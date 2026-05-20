class BaseResponse {
  bool isSuccess;
  int apiStatusCode;
  String message;

  BaseResponse({
    required this.isSuccess,
    required this.apiStatusCode,
    required this.message,
  });
}
