package com.hexaware.abstractclasses;

public abstract class Vehicle {
    private String name;
    private double rentalPrice;

    public Vehicle(String name, double rentalPrice) {
        this.name = name;
        this.rentalPrice = rentalPrice;
    }

    public String getName() {
        return name;
    }

    public double getRentalPrice() {
        return rentalPrice;
    }

    public abstract void rentVehicle();
    public abstract void returnVehicle();
}