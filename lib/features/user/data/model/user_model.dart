import 'package:fitness_app/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String email,
    required String name,
    required DateTime createdAt,
    String? photoUrl,
  }) : super(
         id: id,
         email: email,
         name: name,
         photoUrl: photoUrl,
         createdAt: createdAt,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      photoUrl: json["photoUrl"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "photoUrl": photoUrl,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
