import 'package:budget_recorder/models/expwithid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({required this.uid});

  final CollectionReference budgetCollection = FirebaseFirestore.instance.collection('expenses'); // Create the collection and gives a reference
  // Future<void> updateUserData(String? category,int? price)async{
  //   return await budgetCollection.doc(uid).set({
  //     'category': category,
  //     'price': price,
  //   });
  // }
  Future<void> updateUserData(String? category, int? price) async {
    // Reference to the parent document in the 'expenses' collection
    DocumentReference userDocRef = budgetCollection.doc(uid);

    // Create a new subcollection called 'user_expenses' under the user's document
    CollectionReference userExpensesCollection = userDocRef.collection('user_expenses');

    // Add a new document to the subcollection with the category and price data
    await userExpensesCollection.add({
      'category': category,
      'price': price,
    });
  }

  // List<Exp> _expListFromSnapshot(QuerySnapshot? snapshot){
  //   return snapshot?.docs.map((doc){
  //     return Exp(category: doc['category'] as String? ?? '',price: doc['price'] as int? ?? 0);
  //   }).toList() ?? [];
  // }

  Stream<List<ExpWithId>> get exps {
    // Reference to the user's document in the 'expenses' collection
    DocumentReference userDocRef = budgetCollection.doc(uid);

    // Reference to the 'user_expenses' subcollection for the specific user
    CollectionReference userExpensesCollection = userDocRef.collection('user_expenses');

    // Stream to listen for changes in the 'user_expenses' subcollection
    return userExpensesCollection.snapshots().map((userExpensesSnapshot) {
      // Map the documents to Expense objects
      List<ExpWithId> expenses = userExpensesSnapshot.docs.map((doc) {
        return ExpWithId(
          id: doc.id,
          category: doc['category'] as String? ?? '',
          price: doc['price'] as int? ?? 0,
        );
      }).toList();
      print(expenses);
      return expenses;
    });
  }

  Future<void> deleteExpense(String? expenseDocId) async {
    // Reference to the user's document in the 'expenses' collection
    DocumentReference userDocRef = budgetCollection.doc(uid);

    // Reference to the 'user_expenses' subcollection for the specific user
    CollectionReference userExpensesCollection = userDocRef.collection('user_expenses');

    // Reference to the specific subdocument within the subcollection
    DocumentReference expenseDocRef = userExpensesCollection.doc(expenseDocId);

    // Delete the subdocument using the `delete()` method
    await expenseDocRef.delete();
  }

  // get the Exp stream
  // Stream<List<Exp>> get exps{
  //   return budgetCollection.snapshots().map(_expListFromSnapshot);
  // }

}