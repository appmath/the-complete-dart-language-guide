class BankAccount {
  BankAccount({this.balance = 0, required this.accountHolder});
  double balance = 0;
  final String accountHolder;

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    }
    return false;
  }
}

void main() {
  final bankAccount = BankAccount(accountHolder: 'Aziz', balance: 100);
  print('bankAccount.balance: ${bankAccount.balance}');
}
