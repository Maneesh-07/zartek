import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/cart_provider.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/core/constant/constant.dart';
import 'package:zartek/views/cart/widgets/cart_model.dart';
import 'package:zartek/views/cart/widgets/cart_tile_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: black,
        title: const Text('Order Summary'),
      ),
      body: FutureBuilder<List<CartItem>>(
        future: cartModel.getCartItemsFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('Your cart is empty.');
          } else {
            final cartItems = snapshot.data;
            final totalPrice = cartModel.calculateTotalPrice(cartItems);

            int totalDishes = cartItems!.length;
            int totalQuantity = cartItems.fold(
              0,
              (int sum, CartItem item) => sum + item.quantity,
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: green,
                              ),
                              child: Center(
                                child: Text(
                                  'Total Dishes: $totalDishes | Total Quantity: $totalQuantity',
                                  style: cartFontStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                final item = cartItems[index];
                                return CartItemTile(item: item);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Amount: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "INR ${totalPrice.toStringAsFixed(2)}",
                            style: bookingFontStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green, // background (button) color
                          foregroundColor: white, // foreground (text) color
                        ),
                        onPressed: () {},
                        child: const Text('Place Order'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
