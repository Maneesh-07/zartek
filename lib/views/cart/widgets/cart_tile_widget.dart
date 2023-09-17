import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/cart_provider.dart';
import 'package:zartek/views/cart/widgets/cart_model.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Container(
      padding: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text(item.dishName),
        subtitle: Text('Price: \$${item.dishPrice.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cartModel.decrementCartItemQuantity(item);
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cartModel.incrementCartItemQuantity(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
