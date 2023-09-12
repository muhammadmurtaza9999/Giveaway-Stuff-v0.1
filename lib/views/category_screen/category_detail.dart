import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gas/Services/firestore_services.dart';
import 'package:flutter_gas/views/widgets_common/bg_widget.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/controllers/product_controller.dart';
import 'package:flutter_gas/views/category_screen/item_details.dart';
import 'package:get/get.dart';
import '../widgets_common/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    ////////////////////////////////////////
    // ignore: prefer_typing_uninitialized_variables
    // var snapshot;
    // var data = snapshot.data!.docs;
    /////////////////////////////////////

    // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
    // var FirebaseFireStore;
    return bgWidget(
        child: Scaffold(
          appBar: AppBar(
            title: title!.text.fontFamily(bold).white.make(),
          ),
          body: StreamBuilder(
            stream: FirestoreServices.getProducts(title),
            // stream: FirebaseFireStore.instance.collection('Products').where('p_category', isEqualTo: title).get(title),
// stream: FirebaseFirestore.instance.collection('products').where('p_category', isEqualTo: title).get(title),
            builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot) {
              if(!snapshot.hasData){
                return Center(
                  child: loadingIndicator(),
                );
              }
              ///////////////////////////////////
              // else if (snapshot.data!.docs.isEmpty){
              //         return Center(
              //           child: "No Items found!".text.color(darkFontGrey).make(),
              //         );
              //       }
              /////////////////////////////////////////
              else {
/////////////////////////////////////////////////////////////
                var data = snapshot.data!.docs;
                // ignore: avoid_print
                print(data);
                // print(data);
//////////////////////////////////////////////////////////
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.subcat.length,
                                  (index) => "${controller.subcat[index]}"
                                  .text
                                  .size(12)
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .makeCentered()
                                  .box
                                  .white
                                  .rounded
                                  .size(120, 50)
                                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        ),
                      ),
                      //items container
                      20.heightBox,
                      Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      data[index]['p_imgs'][0],
                                      height: 150,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ).box.roundedSM.clip(Clip.antiAlias).make(),
                                    "${data[index]['p_name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "${data[index]['p_price']}"
                                        .numCurrency.text
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .size(16)
                                        .make(),
                                    10.heightBox,
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                                    .roundedSM
                                    .outerShadowSm
                                    .padding(const EdgeInsets.all(12))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetails(title: "${data[index]['p_name']}",data: data[index]));
                                });
                              }))
                      //items container
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
