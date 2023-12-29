import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_sdk/dao/header_util.dart';
import 'package:soulia/dao/hi_api_cache.dart';
import 'package:soulia/model/douban_top_model.dart';
import 'package:soulia/util/hi_const.dart';

typedef HitCache<T> = Function(T cache);

///更多课程
class DoubanTopDao {
  ///过期时间设置为1小时
  static const expireTime = 60 * 60 * 1000;

  ///https://api.devio.org/uapi/notice/banner?pageIndex=1&pageSize=100
  //https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=北京&start=0&count=20
  static doubanTopList(
      {String city = '北京',
      int responseCount = 5,
      HitCache<DoubanTopModel>? hitCache}) async {
    Map<String, String> paramsMap = {};
    paramsMap['apikey'] = HiConst.doubanapiKey;
    paramsMap['city'] = city;
    paramsMap['count'] = responseCount.toString();

    var uri = Uri.https('api.douban.com', 'v2/movie/in_theaters', paramsMap);
    //处理缓存
    _handleCache(hitCache, uri);
    final response = await http.get(uri, headers: doubanHeader());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        var data = result['data'];
        //更新缓存
        HiAPICache.getInstance().setCache(uri.toString(), jsonEncode(data));
        return DoubanTopModel.fromJson(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  ///处理缓存
  static void _handleCache(HitCache<DoubanTopModel>? hitCache, Uri uri) {
    if (hitCache != null) {
      var cacheString =
          HiAPICache.getInstance().getCache(uri.toString(), expire: expireTime);
      if (cacheString != null) {
        hitCache(DoubanTopModel.fromJson(json.decode(cacheString)));
      }
    }
  }
}
