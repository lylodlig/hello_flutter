import 'package:flutter/material.dart';

class WanBanner extends StatefulWidget {
  var banner;

  WanBanner(this.banner);

  @override
  _WanBannerState createState() => _WanBannerState(banner);
}

class _WanBannerState extends State<WanBanner>
    with SingleTickerProviderStateMixin {
  var banner;
  var tabController;

  _WanBannerState(this.banner);

  @override
  void initState() {
    tabController =
        TabController(length: banner == null ? 0 : banner.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (banner != null && banner.length > 0) {
      banner.foreach((item) {
        var imgUrl = item['imagePath'];
        var title = item['title'];
        item['link'] = item['url'];
        items.add(GestureDetector(
          onTap: () => _handleItemClick(item),
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Stack(
              children: <Widget>[
                Image.network(imgUrl, fit: BoxFit.cover),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 1000.0,
                    color: Color(0x50000000),
                    padding: EdgeInsets.all(5.0),
                    child: Text(title,
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ),
                )
              ],
            ),
          ),
        ));
      });
    }
    return TabBarView(children: items, controller: tabController);
  }

  _handleItemClick(item) {}
}
