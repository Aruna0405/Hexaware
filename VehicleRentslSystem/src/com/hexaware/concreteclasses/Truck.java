package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class Truck extends Vehicle { //child class truck extended from parent class vehicle
    public Truck(String name) {
        super(name, 150.0); // rental price given by default
    }

    @Override
    public void rentVehicle() {
        System.out.println("Truck " + getName() + " has been rented.");
    }

    @Override
    public void returnVehicle() {
        System.out.println("Truck " + getName() + " has been returned.");
    }
}