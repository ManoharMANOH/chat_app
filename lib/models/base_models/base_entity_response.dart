import 'package:chat_app/models/base_models/base_response.dart';

class BaseEntityResponse<T> extends BaseResponse {
  T? entity;

  BaseEntityResponse({
    required this.entity,
    required super.isSuccess,
    required super.apiStatusCode,
    required super.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "isSuccess": isSuccess,
      "message": message,
      "apiStatusCode": apiStatusCode,
      "entity": entity,
    };
  }
}
