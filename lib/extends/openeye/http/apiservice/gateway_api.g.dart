// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GatewayApi implements GatewayApi {
  _GatewayApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://test-gateway.get88.cn/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResult<int>> addFeedBack(map) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(map);
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<int>>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, '/api/feedback/insertQuestion',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<int>.fromJson(
      result.data!,
      (json) => json as int,
    );
    return value;
  }

  @override
  Future<BaseResult<List<MyFeedbackEntity>>> queryMyFeedback() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<List<MyFeedbackEntity>>>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, '/api/feedback/myQuestionList',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<List<MyFeedbackEntity>>.fromJson(
        result.data!,
        (json) => (json as List<dynamic>)
            .map<MyFeedbackEntity>(
                (i) => MyFeedbackEntity.fromJson(i as Map<String, dynamic>))
            .toList());
    return value;
  }

  @override
  Future<BaseResult<FeedbackDetailListEntity>> feedbackDetails(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<FeedbackDetailListEntity>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/feedback/details',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<FeedbackDetailListEntity>.fromJson(
      result.data!,
      (json) => FeedbackDetailListEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResult<dynamic>> insertAnswer(map) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(map);
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<dynamic>>(
            Options(method: 'POST', headers: headers, extra: extra)
                .compose(_dio.options, '/api/feedback/insertContent',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<dynamic>.fromJson(
      result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
