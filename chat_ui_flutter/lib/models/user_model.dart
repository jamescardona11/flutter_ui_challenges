class UserModel {
  final int id;
  final String name;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  String get firstLetters {
    var split = name.split(' ');
    String firstLetter = split[0].substring(0, 1);

    if (split.length > 1) {
      return firstLetter + split[1].substring(0, 1);
    } else {
      return firstLetter;
    }
  }
}
