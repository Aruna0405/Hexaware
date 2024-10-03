package BankingException;

public class BankAccount {

	private double balance;

	public BankAccount() {
		super();
		this.balance = 50000;
	}
	
	public void deposit(double amount) throws InvalidAmountException{
		if(amount<=0) {
			throw new InvalidAmountException("Deposit amount must be greater than 0");
		}else {
			balance = balance + amount;
			System.out.println("Amount deposited. New Balance : "+balance);
		}
	}
	
	public void withdraw(double amount) throws InvalidAmountException, InsufficientFundsException{
		if(amount<=0) {
			throw new InvalidAmountException("Withdraw amount must be greater than 0");
		}
		else if(amount>balance) {
			throw new InsufficientFundsException("Low Balance. Balance :"+balance);
		}
		else {
			balance = balance - amount;
			System.out.println("Amount Withdrawn. New balance :"+balance);
		}
	}
	
	public void checkBalance() {
		System.out.println("Current Balance :"+balance);
	}
	
	
}