// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

const List<String> defaultImage = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

//picture 750px,424px;
var imageHeight = 750.0;
var imageWidth = 424.0;

class CommonSwipper extends StatelessWidget {
  final List<String> images;
  const CommonSwipper({Key? key, this.images = defaultImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //depend on the phone screen size
    var height = MediaQuery.of(context).size.width / imageHeight * imageWidth;
    return Container(
        height: height / 1.5,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              images[index],
              width: 20,
              fit: BoxFit.fill,
            );
          },
          itemCount: images.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}
