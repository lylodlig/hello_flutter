import 'package:flutter/material.dart';
import 'package:hello_flutter/http/wan_api.dart';
import 'package:hello_flutter/http/wan_http_util_with_cookie.dart';
import 'package:hello_flutter/pages/list/page_list.dart';
import 'package:hello_flutter/widget/wan_widget/banner.dart';

class TabHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabHomeState();
  }
}

class _TabHomeState extends State<TabHome> {
  var _banner;

  @override
  void initState() {
    getBanner();
    super.initState();
  }

  void getBanner() {
    HttpUtil.get(Api.BANNER, (data) {
      if (data != null)
        setState(() {
          _banner = data;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[WanBanner(_banner)],
      ),
    );
  }
}
