import 'package:flutter/material.dart';
import 'package:hello_flutter/http/wan_api.dart';
import 'package:hello_flutter/http/wan_http_util_with_cookie.dart';
import 'package:hello_flutter/widget/wan_widget/banner.dart';

class TabHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabHomeState();
  }
}

class _TabHomeState extends State<TabHome> {
  final bannerKey = GlobalKey<WanBannerState>();
  var banner;

  var page = 1;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<dynamic> getBanner() async {
    return await HttpUtil.get(Api.BANNER);
  }

  Future<dynamic> getHomeArticleList() async {
    return await HttpUtil.get('${Api.ARTICLE_LIST}$page/json');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return WanBanner(key: bannerKey);
              }
            }),
        onRefresh: _getData);
  }

  Future<Null> _getData() async {
    var response = await getBanner();
    if (response["status"] == 200) {
      if (response["data"] != null) {
        bannerKey.currentState.setBanner(response["data"]);
      }
    }

    var listRes=await getHomeArticleList();
    if (listRes["status"] == 200) {
      if (listRes["data"] != null) {

      }
    }

    return null;
  }
}
