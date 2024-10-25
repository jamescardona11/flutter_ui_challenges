class Category {
  final String name;
  final int courses;
  final String image;

  Category(
    this.name,
    this.courses,
    this.image,
  );
}

List<Category> categories = categoriesData.map((item) => Category(item['name'], item['courses'], item['image'])).toList();

var categoriesData = <Map<String, dynamic>>[
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "Photography", 'courses': 13, 'image': "assets/images/photography.png"},
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.png"},
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "Photography", 'courses': 13, 'image': "assets/images/photography.png"},
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.png"},
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "Photography", 'courses': 13, 'image': "assets/images/photography.png"},
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.png"},
  {"name": "Marketing", 'courses': 17, 'image': "assets/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {"name": "Photography", 'courses': 13, 'image': "assets/images/photography.png"},
  {"name": "Business", 'courses': 17, 'image': "assets/images/business.png"},
];
