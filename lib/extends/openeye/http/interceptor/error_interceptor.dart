import 'package:dio/dio.dart';
import 'package:soulia/extends/openeye/utils/log_utils.dart';

import '../app_except.dart';

///错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // error统一处理
    AppException appException = AppException.create(err);
    // 错误提示
    LogE('DioError===: ${appException.toString()}');
    super.onError(err, handler);
  }
}
