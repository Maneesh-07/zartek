
class MenuCategory {
  final String menuCategory;
  final String menuCategoryImage;
  final List<Dish> categoryDishes;

  MenuCategory({
    required this.menuCategory,
    required this.menuCategoryImage,
    required this.categoryDishes,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    final categoryDishes = (json['category_dishes'] as List)
        .map((dish) => Dish.fromJson(dish))
        .toList();

    return MenuCategory(
      menuCategory: json['menu_category'],
      menuCategoryImage: json['menu_category_image'],
      categoryDishes: categoryDishes,
    );
  }
}

class Dish {
  final String dishName;
  final double dishPrice;
  final String dishImage;
  final String dishDesp;
  final String dishCal;

  Dish(
      {required this.dishName,
      required this.dishPrice,
      required this.dishImage,
      required this.dishDesp,
      required this.dishCal});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
        dishName: json['dish_name'],
        dishPrice: json['dish_price'].toDouble(),
        dishImage: json['dish_image'],
        dishDesp: json['dish_description'],
        dishCal: json['dish_calories'].toString());
  }
}
