package ru.ssau.autotinderback.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLException;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<ApiError> handleNotFoundException(NotFoundException e) {
        ApiError apiError = new ApiError(HttpStatus.NOT_FOUND, e.getMessage(), e);
        return new ResponseEntity<>(apiError, apiError.getStatus());
    }

    @ExceptionHandler(SQLException.class)
    public ResponseEntity<ApiError> handlePSQExceptionException(SQLException e) {
        ApiError apiError = new ApiError(HttpStatus.BAD_REQUEST,e);
        if (e.getMessage().contains("duplicate")) {
            apiError.setMessage("Такая сущность уже существует");
        } else {
            apiError.setMessage(e.getMessage());
        }
        return new ResponseEntity<>(apiError, apiError.getStatus());
    }
}
