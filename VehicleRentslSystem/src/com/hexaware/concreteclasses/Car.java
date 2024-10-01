package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class Car extends Vehicle { // child class car extended from parent class vehicle
    public Car(String name) {
        super(name, 55.0); // rental price given by default
    }

    @Override
    public void rentVehicle() {
        System.out.println("Car " + getName() + " has been rented.");
    }

    @Override
    public void returnVehicle() {
        System.out.println("Car " + getName() + " has been returned.");
    }
}