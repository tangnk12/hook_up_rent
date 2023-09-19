import 'package:flutter/material.dart';

import '../page/home/tab_search/dart_list.dart';
import 'common_tag.dart';

class RoomListtemWidght extends StatelessWidget {
  final RoomListItemData data;

  const RoomListtemWidght(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('roomDetail/${data.id}');
      },
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            children: [
              Image.network(
                data.imageUrl,
                width: 132.5,
                height: 100,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(
                    data.subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    children: data.tags.map((item) => CommonTag(item)).toList(),
                  ),
                  Text('Rm${data.price}/run',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ],
              ))
            ],
          )),
    );
  }
}
