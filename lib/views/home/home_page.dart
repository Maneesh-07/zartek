import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:zartek/controller/provider/cart_provider.dart';
import 'package:zartek/core/color/color.dart';
import 'package:zartek/model/Item_model/dish.dart';
import 'package:zartek/views/cart/cart_page.dart';
import 'package:zartek/views/cart/widgets/cart_model.dart';
import 'package:zartek/views/home/widgets/bookin_list_widgets.dart';
import 'package:zartek/views/home/widgets/drawer.dart';

List<MenuCategory> menuData = [];

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({super.key, this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<CartItem> cartItems = [];

  final List<Tab> myTabs = <Tab>[
    Tab(text: menuData[0].menuCategory),
    Tab(text: menuData[1].menuCategory),
    Tab(text: menuData[2].menuCategory),
    Tab(text: menuData[3].menuCategory),
    Tab(text: menuData[4].menuCategory),
    Tab(text: menuData[5].menuCategory),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartModel>(context);
    final cartItemCount = cartProvider.cartItems.length;
    return Scaffold(
      drawer: MyDrawer(user: widget.user),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              );
            }),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Stack(alignment: Alignment.center, children: [
                IconButton(
                  icon: Icon(
                    Ionicons.ios_cart,
                    size: 30,
                    color: black,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  ),
                ),
                if (cartItemCount >
                    0) 
                  Positioned(
                    right: 12,
                    top: 1,
                    bottom: 30,
                    child: CircleAvatar(
                      backgroundColor:
                          Colors.red, // You can customize the color
                      radius: 10,
                      child: Text(
                        cartItemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ]),
            ),
          ],
          bottom: TabBar(
            labelColor: const Color.fromARGB(255, 216, 0, 65),
            indicatorColor: const Color.fromARGB(255, 216, 0, 65),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          Center(
            child: ListView.builder(
              itemCount: menuData[0].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[0].categoryDishes[index].dishName,
                  dCals: menuData[0].categoryDishes[index].dishCal,
                  dDesp: menuData[0].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[0].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[0].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: menuData[1].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[1].categoryDishes[index].dishName,
                  dCals: menuData[1].categoryDishes[index].dishCal,
                  dDesp: menuData[1].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[1].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[1].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: menuData[2].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[2].categoryDishes[index].dishName,
                  dCals: menuData[2].categoryDishes[index].dishCal,
                  dDesp: menuData[2].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[2].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[2].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: menuData[3].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[3].categoryDishes[index].dishName,
                  dCals: menuData[3].categoryDishes[index].dishCal,
                  dDesp: menuData[3].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[3].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[3].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: menuData[4].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[4].categoryDishes[index].dishName,
                  dCals: menuData[4].categoryDishes[index].dishCal,
                  dDesp: menuData[4].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[4].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[4].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
          Center(
            child: ListView.builder(
              itemCount: menuData[4].categoryDishes.length,
              itemBuilder: (context, index) {
                return DishTile(
                  index: index,
                  dName: menuData[5].categoryDishes[index].dishName,
                  dCals: menuData[5].categoryDishes[index].dishCal,
                  dDesp: menuData[5].categoryDishes[index].dishDesp,
                  dPrice:
                      menuData[5].categoryDishes[index].dishPrice.toString(),
                  dImage: menuData[5].categoryDishes[index].dishImage,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
