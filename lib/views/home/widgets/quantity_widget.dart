import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zartek/core/color/color.dart';

class QuantityWidget extends StatefulWidget {
  // final CategoryDish product;
  final Function(int) onQuantityChanged;

  const QuantityWidget({
    Key? key,
    // required this.product,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    resetQuantity();
  }

  void resetQuantity() {
    setState(() {
      quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        resetQuantity();
        return true;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colorGrey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  // Decrement quantity
                  if (quantity > 1) {
                    quantity--;
                    widget.onQuantityChanged(quantity);
                  }
                });
              },
              child: const Icon(
                CupertinoIcons.minus,
                size: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(quantity.toString()),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: colorGrey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  // Increment quantity
                  quantity++;
                  widget.onQuantityChanged(quantity);
                });
              },
              child: const Icon(
                CupertinoIcons.plus,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
