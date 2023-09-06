import 'package:flutter/services.dart';
import 'package:flutter_gas/Widgets_common/our_button.dart';
import 'package:flutter_gas/consts/consts.dart';

Widget exitDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        "Are you sure want tp exit?".text.size(16).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(color: redColor,onPress: () {
              SystemNavigator.pop();
            },
                textColor: whiteColor,title: "yes"),
            ourButton(color: redColor,onPress: () {
              Navigator.pop(context);
            },
                textColor: whiteColor,title: "No"),
          ],
        )
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).rounded.make(),
  );
}