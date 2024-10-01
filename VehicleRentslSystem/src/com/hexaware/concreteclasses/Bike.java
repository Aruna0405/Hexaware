package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class Bike extends Vehicle { //child class bike extended from parent class vehicle
    public Bike(String name) {
        super(name, 25.0); // rental price given by default
    }

    @Override
    public void rentVehicle() {
        System.out.println("Bike " + getName() + " has been rented.");
    }

    @Override
    public void returnVehicle() {
        System.out.println("Bike " + getName() + " has been returned.");
    }
}