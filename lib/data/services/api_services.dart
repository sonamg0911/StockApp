import 'package:dio/dio.dart';
import 'package:stock_app/data/model/stock_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@singleton
@RestApi(baseUrl: "http://coding-assignment.bombayrunning.com")
abstract class ApiServices {
  @factoryMethod
  factory ApiServices() {
    final dio = Dio();
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000, contentType: 'content/json');
    return _ApiServices(dio);
  }

  @GET("/data.json")
  Future<List<StockResponse>?> getStocks();
}
