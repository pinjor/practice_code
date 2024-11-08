class NetworkResponse {
  final bool issuccess;

  final int statusCode;
  dynamic responseData;

  String errorMessage;

  NetworkResponse(
      {required this.issuccess,
      required this.statusCode,
      this.responseData,
      this.errorMessage = 'Something is wrong'});
}
