// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://baobab.kaiyanapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FeedEntity> queryFeedData(date, pageIndex) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'date': date, r'num': pageIndex};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FeedEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v2/feed',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FeedEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<TypeEntity>> queryCategoryData() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TypeEntity>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v4/categories',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => TypeEntity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<FocusEntity> queryFocusData(startId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'start': startId};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FocusEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v4/tabs/follow',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FocusEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<TopicEntity> queryTopicData(startId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'start': startId};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TopicEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v3/specialTopics',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopicEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<FocusEntity> queryRankingData(strategy) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'strategy': strategy};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FocusEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v4/rankList/videos',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FocusEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<FocusEntity> searchData(query) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FocusEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v1/search?&num=10&start=10',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FocusEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<FocusEntity> queryVideoDetail(videoId) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': videoId};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FocusEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v4/video/related',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FocusEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<FocusEntity> queryTypeDetail(typeId, startNum,
      {uuid = CommonConstant.UUID,
      deviceModel = CommonConstant.DEVICE_NUM}) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': typeId,
      r'start': startNum,
      r'udid': uuid,
      r'deviceModel': deviceModel
    };
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FocusEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v4/categories/videoList',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FocusEntity.fromJson(result.data!);
    return value;
  }

  @override
  Future<TopicDetailEntity> queryTopicDetail(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TopicDetailEntity>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, 'api/v3/lightTopics/internal/$id',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopicDetailEntity.fromJson(result.data!);
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
