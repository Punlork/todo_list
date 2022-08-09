class AppData {
  AppData._();

  static const double padding = 16;
  static const int margin = 16;
  static const int vSpace = 16;
  static const int hSpace = 16;
  static const double btnHeight = 45;
  static const bool environment = true;
  static const int verifyCodeTimeOut = 20;
  static const String apiVersion = 'v2';

  static Map<String, dynamic> get env {
    if (environment) {
      return dev;
    } else {
      return prod;
    }
  }

  static const Map<String, dynamic> dev = {
    'baseUrl': 'http://192.168.0.149:3000/api',
  };
  static const Map<String, dynamic> prod = {
    'baseUrl': 'http://192.168.0.149:3000/api',
  };

  static const String apiKey =
      'base64:RZhlxrPfgeyGRjC//bJxV/Pmq9sI4SQYhJc0H9vvyIg=';

  static const duration = 60; // 60 seconds
  static const receiveTimeout = 15000; // 15 seconds
  static const connectTimeout = 15000; // 15 seconds
  static const sendTimeout = 15000; // 15 seconds
}
