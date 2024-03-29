import 'api_response_mode.dart';

class NetworkingResponse {}

class NetworkingException extends NetworkingResponse {
  String message;
  NetworkingException(this.message);
}

class NetworkingResponseData extends NetworkingResponse {
  APIResponseModel apiResponseModel;
  NetworkingResponseData(this.apiResponseModel);
}
