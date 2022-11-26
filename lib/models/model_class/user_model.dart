import '../enum_model/enum_genre.dart';

class User{
  String nom;
  String password;
  Genre genre;
  List<String>? favoris=[];

  User({required this.nom, required this.password,required this.genre, this.favoris});

  Map<String, dynamic> toMap() {
    return {
      "nom": this.nom,
      "password": this.password,
      "genre": this.genre,
      "favoris": this.favoris,
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      nom: json["nom"],
      password: json["password"],
      genre: json["genre"],
      favoris: json['favoris'],
    );
  }
//

}