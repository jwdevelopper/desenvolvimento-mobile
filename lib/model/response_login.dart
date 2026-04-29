class ResponseLogin {
  String? token;
  String? tokenType;
  String? expiresIn;
  String? message;
  String? error;
  int? statusCode;

  ResponseLogin({this.token, this.tokenType, this.expiresIn, this.message, this.error, this.statusCode});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['tokenType'] = this.tokenType;
    data['expiresIn'] = this.expiresIn;
    data['message'] = this.message;
    data['error'] = this.error;
    data['statusCode'] = this.statusCode;
    return data;
  }
}