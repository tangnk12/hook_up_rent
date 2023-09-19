import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

import '../../widgets/common_form_item.dart';
import '../../widgets/common_image_picker.dart';
import '../../widgets/common_radio_form_iteam.dart';
import '../../widgets/common_select_form_item.dart';
import '../../widgets/room_application.dart';

class ActivityAddPage extends StatefulWidget {
  const ActivityAddPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RoomAddPage();
  }
}

class _RoomAddPage extends State<ActivityAddPage> {
  int travelType = 0;
  int provideTool = 0;
  int floor = 0;
  int roomType = 0;
  int oriented = 0;
  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Add'),
      ),
      body: ListView(
        children: [
          CommonTitle('Activity Information'),
          CommonFormItem(
              label: 'location',
              contentBuilder: (context) {
                return Container(
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'select hike location',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('search');
                      }),
                );
              }),
          CommonFormItem(
            label: 'Package cost',
            hitText: 'Key in this package cost',
            suffixText: 'Rm/ travel',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: 'Distance whole hiking',
            hitText: 'Expectation length',
            suffixText: 'kilometer',
            controller: TextEditingController(),
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: ['一室', '二室', '三室', '四室'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: ['高楼层', '中楼层', '低楼层'],
          ),
          CommonRadioFormItem(
            label: 'Chanllenge type',
            options: ['Personal', 'Group'],
            value: travelType,
            onChange: (index) {
              setState(() {
                travelType = index;
              });
            },
          ),
          CommonRadioFormItem(
              label: 'Instalement',
              options: ['Provide', 'Not provided'],
              value: provideTool,
              onChange: (index) {
                setState(() {
                  provideTool = index;
                });
              }),
          CommonTitle('Picture'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          CommonTitle('Title'),
          Container(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Please enter package name',
                border: InputBorder.none,
              ),
            ),
          ),
          CommonTitle('Location'),
          RoomAppliance(
            onChange: (data) {},
          ),
          CommonTitle('Description Activity'),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Description of this package',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('Submit', () {}),
    );
  }
}
