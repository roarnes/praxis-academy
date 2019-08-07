import 'package:case_/classes.dart' as mClass;
import 'dart:io'; // to get console input

main(List<String> arguments) {
	var atm = mClass.ATMMachine();

	int select = 0;

	print("====================================================");
	print("\tWelcome to this simple ATM machine");
	print("====================================================");

	print("\n\tPlease select ATM Transactions");
	print("\tPress [1] Deposit");
	print("\tPress [2] Withdraw");
	print("\tPress [3] Balance Inquiry");
	print("\tPress [4] Exit");

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
					return;
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

}