class Card3D {
  final String title;
  final String author;
  final String image;

  Card3D({
    required this.title,
    required this.author,
    required this.image,
  });
}

const path = 'assets';

final cardList = [
  Card3D(title: 'Title 1', author: 'Author 1', image: '$path/kim1.jpg'),
  Card3D(title: 'Title 2', author: 'Author 2', image: '$path/kim2.jpg'),
  Card3D(title: 'Title 3', author: 'Author 3', image: '$path/kim3.jpg'),
  Card3D(title: 'Title 4', author: 'Author 4', image: '$path/kim4.jpg'),
  Card3D(title: 'Title 5', author: 'Author 5', image: '$path/kim5.jpg'),
  Card3D(title: 'Title 6', author: 'Author 6', image: '$path/kim6.jpg'),
];
