package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class User {
    private Vehicle[] rentedVehicles = new Vehicle[10]; // Fixed size array for up to 10 vehicles
    private int vehicleCount = 0;

    public void rentVehicle(Vehicle vehicle) {
        if (vehicleCount < rentedVehicles.length) {
            rentedVehicles[vehicleCount] = vehicle;
            vehicleCount++;
            vehicle.rentVehicle();
        } else {
            System.out.println("Cannot rent more vehicles. Limit reached.");
        }
    }

    public void returnVehicle(Vehicle vehicle) {
        boolean found = false;
        for (int i = 0; i < vehicleCount; i++) {
            if (rentedVehicles[i].getName().equalsIgnoreCase(vehicle.getName())) {
                rentedVehicles[i] = rentedVehicles[vehicleCount - 1]; // Swap with last vehicle
                rentedVehicles[vehicleCount - 1] = null; // Clear last position
                vehicleCount--;
                vehicle.returnVehicle();
                found = true;
                break;
            }
        }
        if (!found) {
            System.out.println("This vehicle was not rented by the user.");
        }
    }

    public Vehicle[] getRentedVehicles() {
        return rentedVehicles;
    }

    public int getVehicleCount() {
        return vehicleCount;
    }
}
