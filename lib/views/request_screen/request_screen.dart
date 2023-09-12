import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gas/Services/firestore_services.dart';
import 'package:flutter_gas/views/widgets_common/loading_indicator.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:get/get.dart';

import '../widgets_common/our_button.dart';
import '../../controllers/request_controller.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(RequestController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Stuff Wishlist".text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),

      body: StreamBuilder(
        stream: FirestoreServices.getRequest(currentUser!.uid),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData){
            return Center(
            child: loadingIndicator(),
            );
          }
         //  else if (snapshot.data!.docs.isEmpty){
         //    return Center(
         //    child: "Request is empty".text.color(darkFontGrey).make(),
         //    );
         // }
          else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network("${data[index]['img']}"),
                        title: "${data[index]['title']} (x${data[index]['qty']})"
                          .text.fontFamily(semibold)
                          .size(16)
                          .make(),
                        subtitle: "${data[index]['tprice']}"
                          .numCurrency
                          .text.color(redColor)
                          .fontFamily(semibold).make(),
                        trailing: const Icon(
                          Icons.delete,color: redColor,
                        ).onTap(() {
                          FirestoreServices.deleteDocument(data[index].id);
                        }),
                      );
                    },
                ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
            Obx(() => "${controller.totalP.value}"
                .numCurrency.text.fontFamily(semibold).color(redColor).make()),
            ],
            ).box.padding(const EdgeInsets.all(12)).color(lightGolden).width(context.screenWidth - 60)
        .roundedSM.make(),
    10.heightBox,
    SizedBox(width: context.screenWidth - 60, child: ourButton(
    color: redColor,
    onPress: () {},
    textColor: whiteColor,
    title: "Proceed to Shipping",
    )),
    ],
    ),
    );
    }
        },
      ),
    );
  }
}
