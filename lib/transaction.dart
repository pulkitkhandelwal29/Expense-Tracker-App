//Defining a transaction variables
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //constructor for defining a transaction (named arguements)
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
