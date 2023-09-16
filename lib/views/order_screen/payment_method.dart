import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/consts/lists.dart';
import 'package:flutter_gas/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../widgets_common/our_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderController>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {
            controller.placeMyOrder(orderPaymentMethod: paymentMethods[controller.paymentIndex.value],totalAmount: controller.totalP.value);
          },
          color: redColor,
          textColor: whiteColor,
          title: "Please my Order",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
              () => Column(
            children: List.generate(paymentMethodsImg.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: controller.paymentIndex.value == index? redColor : Colors.transparent,
                          width: 4,
                    )),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                          paymentMethodsImg[index],
                          width: double.infinity,
                          height: 120,
                          colorBlendMode: controller.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                          color: controller.paymentIndex.value == index ? Colors.black.withOpacity(0.4) : Colors.transparent,
                          fit: BoxFit.cover,
                      ),
                      controller.paymentIndex.value == index ?  Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          value: true,
                          onChanged: (value) {},
                        ),
                      ):
                      Container(),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: paymentMethods[index].text.white.fontFamily(semibold).size(16).make()),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}