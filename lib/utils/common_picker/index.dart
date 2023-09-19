import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?> showPicker({
    required BuildContext context,
    required List<String> options,
    required int value,
    double height = 300,
  }) {
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {
          var buttonTestStyle = TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          );
          var pickerSelected = FixedExtentScrollController(initialItem: value);
          return Container(
            height: 400,
            color: Colors.grey,
            child: Column(children: [
              Container(
                color: Colors.grey[200],
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text('Cancel', style: buttonTestStyle),
                        onPressed: () {
                          Navigator.of(context).pop(pickerSelected.initialItem);
                        },
                      ),
                      // TextButton(onPressed: (){
                      //   Navigator.of(context).pop(pickerSelected.selectedItem);
                      // }, child: Navigator.of(context).pop(pickerSelected.selectedItem),),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(pickerSelected.selectedItem);
                        },
                        child: Text('Comfirm', style: buttonTestStyle),
                      )
                    ]),
              ),
              Expanded(
                  child: CupertinoPicker(
                scrollController: pickerSelected,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                itemExtent: 32,
                onSelectedItemChanged: (val) {},
                children: options.map((item) => Text(item)).toList(),
              ))
            ]),
          );
        });
  }
}
