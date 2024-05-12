class FoodModel {
  final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel({
    required this.name,
    required this.price,
    required this.weight,
    required this.calory,
    required this.protein,
    required this.item,
    required this.imgPath,
  });

  String get priceTxt {
    final pr = price.toString();
    return '\$ ${pr.substring(0, pr.length - 2)}';
  }
}
