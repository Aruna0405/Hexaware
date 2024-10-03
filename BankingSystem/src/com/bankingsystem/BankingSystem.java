package com.bankingsystem;

public class BankingSystem {
	public static void main(String[] args) {
        // Create a Savings Account
        SavingsAccount savingsAccount = new SavingsAccount("SA123", 1000, 0.04);
        savingsAccount.applyInterest(); // Apply interest
        System.out.println("Savings Account Balance: " + savingsAccount.getBalance());

        // Create a Current Account
        CurrentAccount currentAccount = new CurrentAccount("CA456", 500, 200);
        currentAccount.applyInterest(); // Apply interest (no effect)
        System.out.println("Current Account Balance: " + currentAccount.getBalance());
        
        // Example transactions
        savingsAccount.deposit(200);
        savingsAccount.withdraw(100);
        System.out.println("Updated Savings Account Balance: " + savingsAccount.getBalance());
    }


}
