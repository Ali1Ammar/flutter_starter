import 'package:json_annotation/json_annotation.dart';

List<T> jsonListConvert<T>(
    T Function(Map<String, dynamic> map) fromJson, List data) {
  return data.map((e) => fromJson((e as Map).cast())).toList();
}

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime json) => json.toUtc().toIso8601String();
}
