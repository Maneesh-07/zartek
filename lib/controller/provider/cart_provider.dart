import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zartek/views/cart/cart_page.dart';
import 'package:zartek/views/cart/widgets/cart_model.dart';
import 'package:flutter/foundation.dart';


class CartModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CartItem> cartItems = [];

  
  Future<void> addOrUpdateCartItemInFirebase(CartItem cartItem) async {
    try {
      
      final existingItem = await _getCartItemFromFirebase(cartItem.dishName);

      if (existingItem != null) {
        
        await _updateCartItemInFirebase(existingItem.id.toString(), cartItem);
      } else {
        
        await _addCartItemToFirebase(cartItem);
      }

      
      notifyListeners();
    } catch (error) {
      
      print('Error adding/updating cart item: $error');
    }
  }

  
  Future<void> _addCartItemToFirebase(CartItem cartItem) async {
    await _firestore.collection('cart').add(cartItem.toMap());
  }

  
  Future<void> _updateCartItemInFirebase(String itemId, CartItem cartItem) async {
    await _firestore.collection('cart').doc(itemId).update(cartItem.toMap());
  }

  
  Future<CartItem?> _getCartItemFromFirebase(String dishName) async {
    final query = await _firestore
        .collection('cart')
        .where('dishName', isEqualTo: dishName)
        .get();

    if (query.docs.isNotEmpty) {
      final document = query.docs.first;
      return CartItem.fromMap(document.data() as Map<String, dynamic>)
        ..id = document.id;
    }

    return null;
  }

  Future<List<CartItem>> getCartItemsFromFirebase() async {
  try {
    final query = await _firestore.collection('cart').get();

    if (query.docs.isNotEmpty) {
      return query.docs
          .map((document) =>
              CartItem.fromMap(document.data() as Map<String, dynamic>)
                ..id = document.id)
          .toList();
    }
  } catch (error) {
    print('Error getting cart items from Firebase: $error');
  }
  return [];
}

  void incrementCartItemQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
    _updateCartItemInFirebase(item.id.toString(), item);
  }

  void decrementCartItemQuantity(CartItem item) {
    if (item.quantity > 0) {
      item.quantity--;
      notifyListeners();
      _updateCartItemInFirebase(item.id.toString(), item);
    }
  }

  double calculateTotalPrice(List<CartItem>? cartItems) {
    double totalPrice = 0;
    if (cartItems != null) {
      for (var item in cartItems) {
        totalPrice += item.dishPrice * item.quantity;
      }
    }
    return totalPrice;
  }

  void navigateToCartScreen(BuildContext context, List<CartItem> cartItems) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CartScreen(),
      ),
    );
  }


   Future<String?> getUserAuthenticationMethod() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return null;
    }

    
    if (user.providerData.any((userInfo) => userInfo.providerId == 'google.com')) {
      return 'Google';
    }

    
    if (user.providerData.any((userInfo) => userInfo.providerId == 'phone')) {
      return 'Phone Number';
    }

    return null;
  }

}
