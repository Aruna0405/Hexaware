package com.bankingsystem;

public class CurrentAccount extends BankAccount implements InterestCalculator {
    private double overdraftLimit;

    public CurrentAccount(String accountNumber, double initialBalance, double overdraftLimit) {
        super(accountNumber, initialBalance);
        this.overdraftLimit = overdraftLimit;
    }

    @Override
    public double calculateInterest() {
        return 0;
    }

    @Override
    public void applyInterest() {
        
    }
}