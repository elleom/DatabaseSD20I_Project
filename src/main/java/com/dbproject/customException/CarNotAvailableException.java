package com.dbproject.customException;

public class CarNotAvailableException extends Exception {

    public CarNotAvailableException(String message) {
        super(message);
    }
}
