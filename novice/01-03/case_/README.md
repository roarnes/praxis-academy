# Simple ATM Machine Program in DART

In this project, we are going to make a simple ATM Machine in DART. This is a case exercise for learning the object oriented programming feature of DART.

In the project, there are two .dart files, ```main.dart``` and ```classes.dart```. ```bin/main.dart``` contains only the ```main()``` function, whereas our classes are located in ```lib/classes.dart```.


## ```classes.dart```

There is one main class or parent class called ```ATMMachine``` and three sub-classes, namely ```Deposit```, ```Withdraw```, and ```BalanceInquiry```.

```
class Deposit {
	double _deposit = 0;

	Deposit(){
	}

	void set deposit (double d) {
		_deposit = d;
	}

	double get deposit {
		return _deposit;
	}
}

class Withdraw {
	double _withdraw = 0;

	Withdraw(){
	}

	void set withdraw (double w) {
		_withdraw = w;
	}

	double get withdraw {
		return _withdraw;
	}
}

class BalanceInquiry {
	double _balance = 0;

	BalanceInquiry(){
	}

	set balance (double b) {
		_balance = b;
	}

	double get balance {
		return _balance;
	}
}
```

All of the three sub-classes have each an empty construtor and one getter and setter methods. These classes are further made as instances in ```ATMMachine``` class. We assign the variables ```_balance```, ```_deposit```, and ```_withdraw``` initially to zero so that when we access them from the ```main()``` class, they will not return any ```null``` object exception.

```
class ATMMachine {

	ATMMachine(){
	}

	BalanceInquiry mBalance =  BalanceInquiry();
	Deposit mDeposit =  Deposit();
	Withdraw mWithdraw =  Withdraw();

```

So here we made three instances of the three classes that we have as objects in our ```ATMMachine``` class so we can further manipulate the data inside them. The main class also only have one empty unnamed constructor.

Furthermore, there are three methods, called ```checkBalance```, ```withdrawMoney```, and ```depositMoney```. 

```
	void checkBalance(){
		print('\tYour balance is ${mBalance._balance}.');
	}
```

The above method only prints the current user's balance. on the first call this will print ```0```.

```
	void withdrawMoney(){

		if (mBalance.balance == 0) {
			print('\tYour current balance is zero');
			print('\tYou cannot withdraw!');
			print('\tYou need to deposit money first.');
		}

		else if (mBalance.balance <= 500) {
            print('\tYou do not have sufficient money to withdraw');
            print('\tCheck your balance to see your money in the bank.');
        }

        else if (mWithdraw.withdraw > mBalance.balance) {
            print('\tThe amount you withdraw is greater than to your balance');
            print('\tPlease check the amount you entered.');
        }

        else if (mBalance.balance - mWithdraw.withdraw <= 500) {
        	print('\tThe amount of withdrawal exceeds the minimum balance.');
            print('\tYou have to have at least 500 in your balance.');
            print('\tPlease enter another amount.');
        }

        else {
            mBalance.balance = mBalance.balance - mWithdraw.withdraw;
            print('\tYou withdraw the amount of Rp ${mWithdraw.withdraw}');
        }
	}

```

The above method has several conditional flow of rules that a common atm machine would have, such as not allowing withdrawal that exceeds the balance nor the minimum balance (which in this case 500),  and such.

```
	void depositMoney(){
		print('\tYou deposited the amount of ${mDeposit.deposit}');
	}
}
```

The last method prints the amount of money that the user just deposited.

## ```main.dart```

First, since we have our classes in a separate class, we should import the correct path leading to our ```classes.dart``` file. 

```
import 'package:case_/classes.dart' as mClass;
```

We would like to get a command input from the user, so an input/output DART library should also be imported.

```
import 'dart:io';
```

Furthermore, as you can see in the source code, we show a welcome message and transaction options for the user to choose from.

```
	print("====================================================");
	print("\tWelcome to this simple ATM machine");
	print("====================================================");

	print("\n\tPlease select ATM Transactions");
	print("\tPress [1] Deposit");
	print("\tPress [2] Withdraw");
	print("\tPress [3] Balance Inquiry");
	print("\tPress [4] Exit");
```

However, for after every transaction we would like to always ask whether the user want to do another transaction (i.e. the program does not end after just one transaction). Here we use a ```while``` loop to do that, and a 'counter' variable called ```select``` that saves the option number.

```
	int select = 0;

	while (select == 0){
		print("\n\tWhat would you like to do?");

		var input = stdin.readLineSync();

		if (int.parse(input) < 1 || int.parse(input) > 4){
			print ('\n\tPlease select correct transaction.');
		}

		else {
			select = int.parse(input);

			switch (select) { 
				case 1: {
				print("\n\tEnter the amount of money to deposit: ");
				var input = stdin.readLineSync();

	            atm.mDeposit.deposit = double.parse(input);

				atm.mBalance.balance = atm.mDeposit.deposit + atm.mBalance.balance;
				atm.depositMoney();
				} 
				break; 
     
				case 2: {
					print("\n\tTo withdraw, make sure that you have sufficient balance in your account.");
					print("\tThe minimum balance is 500.");
					print("\tEnter amount of money to withdraw: ");

					var input = stdin.readLineSync();

					atm.mWithdraw.withdraw = double.parse(input);
					
					atm.withdrawMoney();
				} 
				break;

				case 3: {
					atm.checkBalance();
				} 
				break; 
		     
				case 4: {
					print("\n\tTransaction exited.");
				} 
				break;
     		}
		}

		print ('\n\tWould you like to make another transaction?');
     	print('\t[1] Yes \n\t[2] No');

     		var input2 = stdin.readLineSync();

     		if (int.parse(input2) < 1 || int.parse(input2) > 2){
				print ('\n\tPlease select correct transaction.');
			}

			else {
				if (int.parse(input2) == 1){
					select = 0;
				}

				else if (int.parse(input2) == 2){
					print('\n\tThank you for using this simple ATM Machine.');
					select = int.parse(input2);
				}
			}
	}
```

Before the program goes into the ```switch case``` condition, the value of ```select``` is changed into the value that the user inputted and so the program will do the transaction accordingly. The while loop only terminates (and so the program) when the value of ```select``` is other than zero.


Here is the output after the program being run:

```bash
====================================================
	Welcome to this simple ATM machine
====================================================

	Please select ATM Transactions
	Press [1] Deposit
	Press [2] Withdraw
	Press [3] Balance Inquiry
	Press [4] Exit

	What would you like to do?
1

	Enter the amount of money to deposit: 
1000
	You deposited the amount of 1000.0

	Would you like to make another transaction?
	[1] Yes 
	[2] No
1

	What would you like to do?
2

	To withdraw, make sure that you have sufficient balance in your account.
	Enter amount of money to withdraw: 
1000
	The amount of withdrawal exceeds the minimum balance.
	You have to have at least 500 in your balance.
	Please enter another amount.

	Would you like to make another transaction?
	[1] Yes 
	[2] No
1

	What would you like to do?
2

	To withdraw, make sure that you have sufficient balance in your account.
	Enter amount of money to withdraw: 
500
	The amount of withdrawal exceeds the minimum balance.
	You have to have at least 500 in your balance.
	Please enter another amount.

	Would you like to make another transaction?
	[1] Yes 
	[2] No
1

	What would you like to do?
2

	To withdraw, make sure that you have sufficient balance in your account.
	Enter amount of money to withdraw: 
400
	You withdraw the amount of Rp 400.0

	Would you like to make another transaction?
	[1] Yes 
	[2] No
1

	What would you like to do?
3
	Your balance is 600.0.

	Would you like to make another transaction?
	[1] Yes 
	[2] No
2

	Thank you for using this simple ATM Machine.
```

Arnes R. Putri.
August 2019.
Praxis Academy.
