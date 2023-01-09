class Transaction {
  Transaction(
    this.id, {
    required this.title,
    required this.value,
    required this.date,
  });

  final String id;
  final String title;
  final double value;
  final DateTime date;
}
