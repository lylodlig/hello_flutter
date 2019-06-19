import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class WanBanner extends StatefulWidget {
  WanBanner({Key key}) : super(key: key);

  @override
  WanBannerState createState() => new WanBannerState();
}

class WanBannerState extends State<WanBanner> {
  var banner = [];

  void setBanner(dynamic banner) {
    setState(() {
      this.banner = banner;
    });
  }

  Widget getBannerItem(item) {
    var imgUrl = item['imagePath'];
    var title = item['title'];
    item['link'] = item['url'];
    return GestureDetector(
      onTap: () => _handleItemClick(item),
      // 按比例显示
      child: AspectRatio(
        // 宽高2:1
        aspectRatio: 2 / 1,
        // 类似FrameLayout
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: banner.length > 0 ? 200.0 : 0,
        child: Swiper(
          itemCount: banner.length,
          pagination: SwiperPagination(alignment: Alignment.bottomRight),
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return getBannerItem(banner[index]);
          },
        ));
  }

  _handleItemClick(item) {}
}
