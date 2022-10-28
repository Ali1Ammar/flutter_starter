import 'package:khana/src/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "user.g.dart";

@RestApi(baseUrl: "user")
abstract class UserClient {
  factory UserClient(Dio dio) = _UserClient;

  @GET("/tasks")
  Future<List<User>> getTasks();
}
