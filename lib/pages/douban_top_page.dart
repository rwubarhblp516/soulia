// ignore_for_file: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:soulia/dao/douban_top_dao.dart';
import 'package:soulia/util/hi_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:openai_flutter/utils/ai_logger.dart';
import 'package:soulia/model/douban_top_model.dart';

///精彩课程
class DoubanTopPage extends StatefulWidget {
  const DoubanTopPage({Key? key}) : super(key: key);

  @override
  State<DoubanTopPage> createState() => _DoubanTopPageState();
}

class _DoubanTopPageState extends State<DoubanTopPage> {
  var doubanTopList = [];

  get _listView => ListView.builder(
      padding: const EdgeInsets.only(left: 5, right: 5),
      itemCount: doubanTopList.length, //用来展示数据的数量
      itemBuilder: (BuildContext context, int index) =>
          _bannerWidget(index)); //用来创建每个item的布局

  get _body => doubanTopList.isEmpty ? _loading : _listView;

  get _loading => Center(
        child: Lottie.asset("assets/lottie/loading.json.zip", height: 200),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('豆瓣Top20'),
        ),
        body: _listView
        // _body,
        );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _bannerWidget(int index) {
    Subjects model = doubanTopList[index];
    return InkWell(
      onTap: () => HiUtils.openH5(model.alt!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: CachedNetworkImage(
            imageUrl: model.images!.small!,
            height: 190,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _loadData() async {
    var mo = await DoubanTopDao.doubanTopList(
        hitCache: (DoubanTopModel model) => {
              AILogger.log('hiCache:${DateTime.now().millisecondsSinceEpoch}'),
              setState(() {
                // doubanTopList = model.list!;
              })
            });
    setState(() {
      doubanTopList = mo.list;
    });
  }
}
