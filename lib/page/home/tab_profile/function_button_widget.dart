import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_profile/function_button_data.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;
  const FunctionButtonWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        data.onTapHandle!(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        //height: 20,
        width: MediaQuery.of(context).size.width * 0.33,
        // decoration: BoxDecoration(color: Colors.red),
        child: Column(
          children: [
            Image.asset(
              data.imageUrl,
              scale: 1.5,
            ),
            Text(data.title)
          ],
        ),
      ),
    );
  }
}
