package com.bankingsystem;

public class SavingsAccount extends BankAccount implements InterestCalculator {
    private double interestRate;

    public SavingsAccount(String accountNumber, double initialBalance, double interestRate) {
        super(accountNumber, initialBalance);
        this.interestRate = interestRate;
    }

    @Override
    public double calculateInterest() {
        return getBalance() * interestRate;
    }

    @Override
    public void applyInterest() {
        double interest = calculateInterest();
        deposit(interest);
    }
}
