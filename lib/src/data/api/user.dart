import 'package:starter/src/model/user.dart';
import 'package:dio/dio.dart';
import 'package:starter/src/shared/helper/json.dart';

class UserClient {
  final Dio dio;
  UserClient(this.dio);

  Future<List<User>> getFriends() async {
    final res = await dio.get("/freind");
    return jsonListConvert(User.fromJson, res.data);
  }
}
