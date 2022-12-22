package ru.ssau.autotinderback.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Bucket;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.StorageClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ServerErrorException;

import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class FirebaseService {

    private static final String DOWNLOAD_URL = "https://firebasestorage.googleapis.com/v0/b/autotinder-840d1.appspot.com/o/%s?alt=media";
    private static final String BUCKET_NAME = "autotinder-840d1.appspot.com";

    @EventListener
    public void init(ApplicationReadyEvent ignoredEvent) throws IOException {
        ClassPathResource serviceAccount = new ClassPathResource("/autotinder.json");

        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount.getInputStream()))
                .setStorageBucket(BUCKET_NAME)
                .build();
        FirebaseApp.initializeApp(options);
    }

    public String uploadImages(MultipartFile image) {
        return handleBucketCreate(image);
    }

    private String handleBucketCreate(MultipartFile image) {
        log.debug("Image received {}", image.getOriginalFilename());
        try {
            return createBucket(image);
        } catch (IOException e) {
            log.error("Не получилось сохранить фото на сервере ресурсов. %s", e);
            throw new ServerErrorException(e.getMessage());
        }
    }

    private String createBucket(MultipartFile image) throws IOException {
        String fileName = getFileName(Objects.requireNonNull(image.getOriginalFilename()));

        Bucket bucket = StorageClient.getInstance().bucket();
        bucket.create(fileName, image.getBytes(), image.getContentType());

        log.debug("Income image {} successfully uploaded", fileName);
        return String.format(DOWNLOAD_URL, fileName);
    }

    private String getFileName(String fileName) {
        return UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));
    }
}
