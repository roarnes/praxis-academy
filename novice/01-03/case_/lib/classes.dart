class ATMMachine {

	ATMMachine(){
	}

	BalanceInquiry mBalance =  BalanceInquiry();
	Deposit mDeposit =  Deposit();
	Withdraw mWithdraw =  Withdraw();

	void checkBalance(){
		print('\tYour balance is ${mBalance._balance}.');
	}

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

	void depositMoney(){
		print('\tYou deposited the amount of ${mDeposit.deposit}');
	}
}

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