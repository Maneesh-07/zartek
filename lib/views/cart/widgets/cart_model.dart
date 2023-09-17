class CartItem {
  String? id; // You can include an ID field for Firestore document reference
  String dishName;
  double dishPrice;
  int quantity;

  CartItem({
    required this.dishName,
    required this.dishPrice,
    required this.quantity,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'dishName': dishName,
      'dishPrice': dishPrice,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      dishName: map['dishName'],
      dishPrice: map['dishPrice'],
      quantity: map['quantity'],
    );
  }
}
