import 'package:flutter/material.dart';
import 'package:hook_up_rent/main.dart';
import 'package:hook_up_rent/page/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:share/share.dart';

import '../../widgets/common_tag.dart';
import '../../widgets/room_application.dart';
import '../home/info/index.dart';

var bottomButtonTextStyle = TextStyle(fontSize: 12.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  bool isLike = false;
  bool showAllText = false;

  late RoomDetailData data;
  @override
  void initState() {
    setState(() {
      data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();
    bool showTextTool = data.subTitle!.length > 100;

    return Scaffold(
        appBar: AppBar(
          title: Text(data.title!),
          actions: [
            IconButton(
                onPressed: () {
                  Share.share('http://itcast.cn');
                },
                icon: Icon(Icons.share))
          ],
        ),
        body: Stack(children: [
          ListView(
            children: [
              CommonSwipper(images: data.houseImgs!),
              CommonTitle(data.title!),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      data.price.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.pink),
                    ),
                    Text('Rm/r',
                        style: TextStyle(fontSize: 14, color: Colors.pink))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Wrap(
                  spacing: 4,
                  children: data.tags!.map((item) => CommonTag(item)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BaseInfoItem(
                      'a:${data.size}m',
                    ),
                    BaseInfoItem(
                      'f:${data.floor}',
                    ),
                    BaseInfoItem(
                      'T:${data.roomType}',
                    ),
                    BaseInfoItem(
                      'C:perfect',
                    ),
                  ],
                ),
              ),
              CommonTitle('room install'),
              RoomApplicanceList(list: data.applicances!),
              CommonTitle('room condition'),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        maxLines: showAllText ? null : 5,
                        data.subTitle ?? 'unvailable curent'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      showAllText ? 'keep' : 'more',
                                    ),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        Text('report abuse'),
                      ],
                    )
                  ],
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
              ),
              CommonTitle('guese you like'),
              Info(),
              Container(
                height: 100,
              )
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              bottom: 0,
              child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.only(
                      top: 10.0, left: 20.0, bottom: 20.0, right: 10),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        },
                        child: Container(
                            height: 50.0,
                            width: 65.0,
                            margin: EdgeInsets.only(right: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(right: 4)),
                                Icon(isLike ? Icons.star : Icons.star_border,
                                    size: 20.0,
                                    color:
                                        isLike ? Colors.green : Colors.black),
                                Text(isLike ? 'Flavoured' : 'Add favourite',
                                    style: TextStyle(fontSize: 10.0))
                              ],
                            )),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 50,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text('inform for booking',
                                  style: bottomButtonTextStyle),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text('more information',
                                  style: bottomButtonTextStyle),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}

class BaseInfoItem extends StatelessWidget {
  final String? content;
  const BaseInfoItem(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
      child: Text(
        content!,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
