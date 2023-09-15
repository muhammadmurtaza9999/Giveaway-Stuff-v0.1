import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/views/widgets_common/custom_textfield.dart';
import 'package:flutter_gas/views/widgets_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {},
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(hint: "Address", isPass: false, title: "Address"),
            customTextField(hint: "City", isPass: false, title: "City"),
            customTextField(hint: "State", isPass: false, title: "State"),
            customTextField(hint: "Postal Code", isPass: false, title: "Postal Code"),
            customTextField(hint: "Cell Phone", isPass: false, title: "Cell Phone"),
          ],
        ),
      ),
    );
  }
}
