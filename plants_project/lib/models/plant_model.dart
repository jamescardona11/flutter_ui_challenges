class PlantModel {
  final String description;
  final double price;
  final String size;
  final String plant;
  final String imageAsset;
  final double review;
  final String category;

  PlantModel({
    required this.description,
    required this.price,
    required this.size,
    required this.plant,
    required this.imageAsset,
    required this.review,
    required this.category,
  });
}

final listOfPlants = [
  PlantModel(
    description: 'Lorem Ipsum Dammy Plants',
    price: 66,
    size: 'Medium',
    plant: 'Gimam',
    imageAsset: 'assets/plants/plant_1.png',
    review: 3.8,
    category: 'Indor',
  ),
  PlantModel(
    description: 'Lorem Ipsum Dammy Plants',
    price: 88,
    size: 'Small',
    plant: 'G-Bit',
    imageAsset: 'assets/plants/plant_2.png',
    review: 5,
    category: 'Outdor',
  ),
  PlantModel(
    description: 'Lorem Ipsum Dammy Plants',
    price: 90,
    size: 'Small',
    plant: 'Yule',
    imageAsset: 'assets/plants/plant_3.png',
    review: 5,
    category: 'Outdor',
  ),
  PlantModel(
    description: 'Lorem Ipsum Dammy Plants',
    price: 66,
    size: 'Small',
    plant: 'Barg',
    imageAsset: 'assets/plants/plant_4.png',
    review: 4,
    category: 'Indor',
  ),
];
