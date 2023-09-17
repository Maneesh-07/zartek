import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/cart_provider.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/views/cart/widgets/cart_model.dart';

class DishTile extends StatefulWidget {
  const DishTile({
    super.key,
    required this.index,
    required this.dName,
    required this.dPrice,
    required this.dCals,
    required this.dDesp,
    required this.dImage,
  });
  final int index;
  final String dName;
  final String dPrice;
  final String dCals;
  final String dDesp;
  final String dImage;

  @override
  State<DishTile> createState() => _DishTileState();
}

class _DishTileState extends State<DishTile> {
  List<CartItem> cartItems = [];
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    resetQuantity();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartmodel, _) => Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.index > 0
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      height: .7,
                      color: Colors.grey,
                    )
                  : const SizedBox(),
              Container(
                margin: const EdgeInsets.only(bottom: 2.5),
                width: 290,
                child: Text(
                  widget.dName,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "INR ${widget.dPrice}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "${widget.dCals} calories",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (widget.dImage != null)
                    Container(
                      height: 80,
                      width: 90,
                      color: black,
                      child: CachedNetworkImage(imageUrl: widget.dImage),
                    )
                  else
                    Container(
                      height: 40, 
                      color: Colors.grey,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: 300,
                  child: Text(
                    widget.dDesp,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 62, 62, 62)),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: WillPopScope(
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
                                  
                                  if (quantity > 0) {
                                    quantity--;
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
                                  
                                  quantity++;
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
                    )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        
                        final cartItem = CartItem(
                          dishName: widget.dName,
                          dishPrice: double.parse(widget.dPrice), 
                          quantity: quantity, 
                        );

                        
                        cartmodel.addOrUpdateCartItemInFirebase(cartItem);
                      },
                      child: Text('Add to Cart'))
                ],
              ),
            ],
          )),
    );
  }

  void resetQuantity() {
    setState(() {
      quantity = 0;
    });
  }
}
