import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  Future restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    //headers da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        {
          'content-type': 'application/json',
          'accept': 'application/json',
          'X-Parse-Application-Id': 'LEgaQCkyCXEwSjDSXBLmhGloeGzEVOJ7K0lFSpdt',
          'X-Parse-Rest-api-Key': '4TwGVp0De2IJFxToJBOq0PnR2cNaELIg172NSZfX',
        },
      );
    Dio dio = Dio();
    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: HttpMethods.post,
        ),
        data: body,
      );
      //Retorno do resultado do server backend
      return response.data;
    } on DioError catch (error) {
      //returno do erro dio request
      return error.response?.data ?? {};
    } catch (error) {
      //retorno de map vazio para error generalizado
      return {};
    }
  }
}
