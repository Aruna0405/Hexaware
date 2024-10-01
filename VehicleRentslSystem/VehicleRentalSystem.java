package com.hexaware.mainvehicleprogram;

import com.hexaware.concreteclasses.Car;
import com.hexaware.concreteclasses.Bike;
import com.hexaware.concreteclasses.Truck;
import com.hexaware.concreteclasses.User;
import com.hexaware.abstractclasses.Vehicle;

import java.util.Scanner;

public class VehicleRentalSystem {
    private static Vehicle[] availableVehicles = new Vehicle[3];
    private static User user = new User();

    static {
        availableVehicles[0] = new Car("Car");
        availableVehicles[1] = new Bike("Bike");
        availableVehicles[2] = new Truck("Truck");
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("1. Rent Vehicle");
            System.out.println("2. Return Vehicle");
            System.out.println("3. View Available Vehicles");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();
            scanner.nextLine(); 

            switch (choice) {
                case 1:
                    System.out.println("Available Vehicles:");
                    for (Vehicle vehicle : availableVehicles) {
                        if (vehicle != null) {
                            System.out.println(vehicle.getName()); 
                            System.out.println(" - Price: $" + vehicle.getRentalPrice());
                        }
                    }
                    System.out.print("Enter vehicle name to rent: ");
                    String rentVehicleName = scanner.nextLine();
                    for (int i = 0; i < availableVehicles.length; i++) {
                        if (availableVehicles[i] != null && availableVehicles[i].getName().equalsIgnoreCase(rentVehicleName)) {
                            user.rentVehicle(availableVehicles[i]);
                            availableVehicles[i] = null; // Remove from available vehicles
                            break;
                        }
                    }
                    break;

                case 2:
                    System.out.print("Enter vehicle name to return: ");
                    String returnVehicleName = scanner.nextLine();
                    Vehicle returnVehicle = new Car(returnVehicleName); // Create a temporary vehicle for return
                    user.returnVehicle(returnVehicle);
                    for (int i = 0; i < availableVehicles.length; i++) {
                        if (availableVehicles[i] == null) {
                            // Add back the returned vehicle to available vehicles
                            availableVehicles[i] = returnVehicle; // This assumes the vehicle's type can be inferred correctly
                            break;
                        }
                    }
                    break;

                case 3:
                    System.out.println("Available Vehicles:");
                    for (Vehicle vehicle : availableVehicles) {
                        if (vehicle != null) {
                            System.out.println(vehicle.getName() + " - Price: $" + vehicle.getRentalPrice());
                        }
                    }
                    break;

                case 4:
                    System.out.println("Exiting...");
                    break;

                default:
                    System.out.println("Invalid choice"); // This message appears when wrong choice number selected by user
            }
        } while (choice != 4);

        scanner.close();
    }
}
