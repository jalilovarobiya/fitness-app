import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/features/user/data/model/user_model.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> getUser(String userId);
  Future<void> updateUser(UserModel user);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseFirestore firestore;

  UserRemoteDatasourceImpl(this.firestore);

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final doc = await firestore.collection("users").doc(userId).get();
      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      await firestore.collection("users").doc(user.id).update(user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
