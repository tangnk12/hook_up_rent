import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/scopped_model_helper.dart';

import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['roomTypeList']!;
    orientedList = dataList['orientedList']!;
    floorList = dataList['floorList']!;
    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(children: [
          CommonTitle('Type'),
          FilterDrawItem(
            list: roomTypeList,
            selectedIds: selectedIds,
            onChange: _onChange,
          ),
          CommonTitle('front'),
          FilterDrawItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange),
          CommonTitle('floor'),
          FilterDrawItem(
              list: floorList, selectedIds: selectedIds, onChange: _onChange),
        ]),
      ),
    );
  }
}

class FilterDrawItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String>? onChange;
  const FilterDrawItem({
    Key? key,
    required this.list,
    required this.selectedIds,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);

          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange!(item.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(width: 1.0, color: Colors.green)),
              child: Center(
                child: Text(
                  item.name,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
