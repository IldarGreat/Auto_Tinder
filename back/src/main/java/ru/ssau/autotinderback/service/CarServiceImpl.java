package ru.ssau.autotinderback.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.CarPatchRequest;
import ru.ssau.autotinderback.model.dto.request.CarRequest;
import ru.ssau.autotinderback.model.dto.response.CarResponse;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.service.service.CarService;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CarServiceImpl implements CarService {
    @Override
    public CarResponse create(CarRequest carRequest) {
        return null;
    }

    @Override
    public List<PhotoDto> addPhotos(Integer id, MultipartFile[] images) {
        return null;
    }

    @Override
    public CarResponse patch(Integer id, CarPatchRequest carPatchRequest) {
        return null;
    }

    @Override
    public Void delete(Integer carId) {
        return null;
    }

    @Override
    public List<CarResponse> getAllMyCars() {
        return null;
    }

    @Override
    public CarResponse getCarById(Integer carId) {
        return null;
    }

    @Override
    public List<CarResponse> getCarsOnExchange(Integer carId) {
        return null;
    }

    @Override
    public Void putLike(Integer likingCarId, Integer likedCarId) {
        return null;
    }

    @Override
    public Void putDislike(Integer dislikingCarId, Integer dislikedCarId) {
        return null;
    }

    @Override
    public List<CarResponse> getCarsOnSale() {
        return null;
    }
}
