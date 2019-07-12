import 'package:dio/dio.dart';
import 'api_url.dart';


class NetFactory {
  static final NetFactory _netFactory = NetFactory._internal();

  Dio dio;

  factory NetFactory(){
    return _netFactory;
  }

  NetFactory._internal(){
    if(dio == null){
      dio = Dio();
      dio.options = BaseOptions(headers: {
        "content-type": "application/json"
      },baseUrl: BASEURL);
    }
  }


}