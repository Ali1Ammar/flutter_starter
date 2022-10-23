import 'package:khana/src/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "auth.g.dart";

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;

  @GET("/tasks")
  Future<List<User>> getTasks();
}
