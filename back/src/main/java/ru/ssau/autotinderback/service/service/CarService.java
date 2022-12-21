package ru.ssau.autotinderback.service.service;

import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.CarPatchRequest;
import ru.ssau.autotinderback.model.dto.request.CarRequest;
import ru.ssau.autotinderback.model.dto.response.CarResponse;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;

import java.util.List;

public interface CarService {
    CarResponse create(CarRequest carRequest);

    List<PhotoDto> addPhotos(Integer id, MultipartFile[] images);
    CarResponse patch(Integer id, CarPatchRequest carPatchRequest);

    Void delete(Integer carId);

    List<CarResponse> getAllMyCars();

    CarResponse getCarById(Integer carId);

    List<CarResponse> getCarsOnExchange(Integer carId);

    Void putLike(Integer likingCarId, Integer likedCarId);

    Void putDislike(Integer dislikingCarId, Integer dislikedCarId);

    List<CarResponse> getCarsOnSale();

}
