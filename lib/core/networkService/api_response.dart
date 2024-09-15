enum Status{success, failure, noInternet}

class ApiResponse<T>{
  final Status? status;
  final String? message;
  final T? data;

  ApiResponse({this.status, this.data, this.message});
}