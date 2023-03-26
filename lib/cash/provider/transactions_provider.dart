import '../model/transaction.dart';

class TransactProvider {
  static final List<Transact> transactions = [
    Transact(name: "Toys R Us", timestamp: "Jan 29, 2019", amount: "- \$ 499"),
    Transact(name: "Landmark", timestamp: "Jan 9, 2019", amount: "- \$ 356"),
    Transact(name: "D - Mart", timestamp: "Feb 29, 2018", amount: "- \$ 75"),
    Transact(name: "Toys R Us", timestamp: "March 29, 2018", amount: "- \$ 89"),
  ];
}
