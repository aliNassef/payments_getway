import 'package:dio/dio.dart';

import '../utils/constants.dart';

// import '../cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[ApiKey.token] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //         ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
    //         : null;
    options.headers['Authorization'] = 'Bearer $kToken';
    // options.headers['Accept-Language'] = 'ar';
    options.headers['Content-Type'] = Headers.formUrlEncodedContentType;
    // options.headers['Content-Length'] = '<calculated when request is sent>';
    // options.headers['Host'] = '<calculated when request is sent>';
    // options.headers['User-Agent'] = 'PostmanRuntime/7.42.0';
    // options.headers['Accept'] = '*/*';
    // options.headers['Accept-Encoding'] = 'gzip, deflate, br';
    // options.headers['Connection'] = 'keep-alive';
    // options.headers['Cache-Control'] = 'no-cache';
    // options.headers['Postman-Token'] = '<calculated when request is sent>';

    super.onRequest(options, handler);
  }
}
