import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_search/filter_bar/item.dart';
import 'package:hook_up_rent/utils/scopped_model_helper.dart';
import 'package:hook_up_rent/page/home/tab_search/filter_bar/data.dart';
import '../../../../scoped_model/room_filter.dart';
import '../../../../utils/common_picker/index.dart';
import 'data.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceType = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: areaList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index != null) {
        return;
      }
      setState(() {
        areaId = areaList[index!].id;
      });
      _onChange();
    }).whenComplete(() => isAreaActive = false);
  }

  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: rentTypeList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index != null) {
        return;
      }
      setState(() {
        areaId = areaList[index!].id;
      });
      _onChange();
    }).whenComplete(() => isRentTypeActive = false);
  }

  _onPriceChange(context) {
    setState(() {
      isPriceType = true;
    });
    var result = CommonPicker.showPicker(
        context: context,
        options: priceList.map((item) => item.name).toList(),
        value: 0);
    result.then((index) {
      if (index != null) {
        return;
      }
      setState(() {
        areaId = areaList[index!].id;
      });
      _onChange();
    }).whenComplete(() => isPriceType = false);
  }

  _onFilterChange(context) {}

  _onChange() {
    var selectList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
          areaId: areaId,
          priceId: priceId,
          rentTypeId: rentTypeId,
          moreIds: selectList.toList()));
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void didChangeDepedencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer.run(_getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 41,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Item(title: 'area', isActive: isAreaActive, onTap: _onAreaChange),
            Item(
                title: 'method',
                isActive: isRentTypeActive,
                onTap: _onRentTypeChange),
            Item(title: 'rent', isActive: isPriceType, onTap: _onPriceChange),
            Item(
                title: 'choose',
                isActive: isFilterActive,
                onTap: _onFilterChange)
          ],
        ));
  }
}
