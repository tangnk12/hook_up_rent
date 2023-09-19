import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_profile/function_button_widget.dart';
import 'function_button_data.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Wrap(
      spacing: 0,
      runSpacing: 0,
      children: listData.map((item) => FunctionButtonWidget(item
          // height: 20,
          // width: MediaQuery.of(context).size.width * 0.3,
          // decoration: BoxDecoration(color: Colors.red),
          )).toList(),
    ));
  }
}
