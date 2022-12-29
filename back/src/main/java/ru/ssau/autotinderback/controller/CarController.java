package ru.ssau.autotinderback.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.CarPatchRequest;
import ru.ssau.autotinderback.model.dto.request.CarRequest;
import ru.ssau.autotinderback.model.dto.response.CarResponse;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.service.service.CarService;

import java.util.List;

@RestController
@RequestMapping("/cars")
@Tag(name = "Автомобили")
@RequiredArgsConstructor
@PreAuthorize("hasAnyAuthority('USUAL','PLUS','GOLD','PLATINUM','ADMIN')")
public class CarController {
    private final CarService carService;

    @PostMapping(produces = "application/json; charset=UTF-8", consumes = "application/json; charset=UTF-8")
    @Operation(summary = "Создание авто")
    public ResponseEntity<CarResponse> create(@RequestBody CarRequest carRequest) {
        return new ResponseEntity<>(carService.create(carRequest), HttpStatus.CREATED);
    }

    @PostMapping(value = "/{car_id}/photos", consumes = "multipart/form-data", produces = "application/json; charset=UTF-8")
    @Operation(summary = "Добавить фотографии к автомобилю")
    public ResponseEntity<List<PhotoDto>> addPhotos(@PathVariable("car_id") Integer carId, @RequestPart MultipartFile[] images) {
        return new ResponseEntity<>(carService.addPhotos(carId, images), HttpStatus.OK);
    }

    @PatchMapping(value = "/{car_id}", consumes = "multipart/form-data", produces = "application/json; charset=UTF-8")
    @Operation(summary = "Изменить автомобиль")
    public ResponseEntity<CarResponse> patch(@PathVariable("car_id") Integer carId, @RequestBody CarPatchRequest carPatchRequest) {
        return new ResponseEntity<>(carService.patch(carId, carPatchRequest), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{car_id}")
    @Operation(summary = "Удаляет автомобиль")
    public ResponseEntity<Void> delete(@PathVariable("car_id") Integer carId) {
        return new ResponseEntity<>(carService.delete(carId), HttpStatus.NO_CONTENT);
    }

    @GetMapping(produces = "application/json; charset=UTF-8")
    @Operation(summary = "Получает все свои автомобили")
    public ResponseEntity<List<CarResponse>> getAllMyCars() {
        return new ResponseEntity<>(carService.getAllMyCars(), HttpStatus.OK);
    }

    @GetMapping(value = "/{car_id}", produces = "application/json; charset=UTF-8")
    @Operation(summary = "Получает свой автомобиль по id либо автомобиль на продаже")
    public ResponseEntity<CarResponse> getCarById(@PathVariable("car_id") Integer carId) {
        return new ResponseEntity<>(carService.getCarById(carId), HttpStatus.OK);
    }

    @GetMapping(value = "/{car_id}/exchange", produces = "application/json; charset=UTF-8")
    @Operation(summary = "Получает автомобили на обмен")
    public ResponseEntity<List<CarResponse>> getCarsOnExchange(@PathVariable("car_id") Integer carId) { // Какой машиной
        return new ResponseEntity<>(carService.getCarsOnExchange(carId), HttpStatus.OK);
    }

    @PostMapping(value = "/{liking_car_id}/{liked_car_id}/like")
    @Operation(summary = "Ставим лайк автомобилю своим автомобилем")
    public ResponseEntity<Void> putLike(@PathVariable("liking_car_id") Integer likingCarId, @PathVariable("liked_car_id") Integer likedCarId) {
        return new ResponseEntity<>(carService.putLike(likingCarId, likedCarId), HttpStatus.OK);
    }

    @PostMapping(value = "/{disliking_car_id}/{disliked_car_id}/like")
    @Operation(summary = "Ставим дизлайк автомобилю своим автомобилем")
    public ResponseEntity<Void> putDislike(@PathVariable("disliking_car_id") Integer dislikingCarId, @PathVariable("disliked_car_id") Integer dislikedCarId) {
        return new ResponseEntity<>(carService.putDislike(dislikingCarId, dislikedCarId), HttpStatus.OK);
    }

    @PostMapping(value = "/sale", produces = "application/json; charset=UTF-8")
    @Operation(summary = "Получаем автомобили на продажу")
    public ResponseEntity<List<CarResponse>> getCarsOnSale() {
        return new ResponseEntity<>(carService.getCarsOnSale(), HttpStatus.OK);
    }

    // Посмотреть тех кто лайкал (для подписок)

    // Посмотреть тех кого дизлайкал (для подписок)

    // Посмотреть тех кто нас лайкал или дизлайкал (для подписок)
}
