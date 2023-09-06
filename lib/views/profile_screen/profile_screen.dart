// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gas/Services/firestore_services.dart';
import 'package:flutter_gas/Widgets_common/bg_widget.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/consts/lists.dart';
import 'package:flutter_gas/controllers/auth_controller.dart';
import 'package:flutter_gas/controllers/profile_controller.dart';
import 'package:flutter_gas/views/auth_screen/login_screen.dart';
import 'package:flutter_gas/views/profile_screen/edit_profile_screen.dart';
import 'package:get/get.dart';

import 'components/details_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

      var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
                );
              }
              else{
                var data = snapshot.data!.docs[0];
                return SafeArea(
                    child: Column(
                      children: [
                        //edit Profile button
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: const Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.edit, color: whiteColor))
                              .onTap(() {
                                controller.nameController.text = data['name'];

                            Get.to(() => EditProfileScreen(
                              data: data
                            ));
                          }),
                        ),
                        // users details section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              data['imageUrl'] == '' ?
                              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                                  .box
                                  .roundedFull
                                  .clip(Clip.antiAlias)
                                  .make() :
                              Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover)
                                  .box
                                  .roundedFull
                                  .clip(Clip.antiAlias)
                                  .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      "${data['name']}".text.fontFamily(semibold).white.make(),
                                      "${data['email']}".text.white.make(),
                                    ],
                                  )),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: whiteColor,
                                    )),
                                onPressed: () async {
                                  await Get.put(AuthController()).signoutMethod(context);
                                  Get.offAll(() => const LoginScreen());
                                },
                                child: logout.text.fontFamily(semibold).white.make(),
                              )
                            ],
                          ),
                        ),
                    10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                count: data['cart-count'],
                                title: "in your card",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['wishlist-count'],
                                title: "in your wishlist",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['order-count'],
                                title: "in your order",
                                width: context.screenWidth / 3.4),
                          ],
                        ),
                        //buttons section

                        ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: lightGrey,
                              );
                            },
                            itemCount: profileButtonsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.asset(
                                  profileButtonsicon[index],
                                  width: 22,
                                ),
                                title: profileButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                              );
                            })
                            .box
                            .white
                            .rounded
                            .margin(const EdgeInsets.all(12))
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .shadowSm
                            .make()
                            .box
                            .color(redColor)
                            .make(),
                      ],
                    ));
              }
              // return Container(
              //   child: child,
              // );
            },




        )




        //SafeArea(
        // child: Column(
        //   children: [
        //     //edit Profile button
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: const Align(
        //               alignment: Alignment.topRight,
        //               child: Icon(Icons.edit, color: whiteColor))
        //           .onTap(() {
        //             Get.to(() => const EditProfileScren());
        //           }),
        //     ),
        //     // users deteils section
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //       child: Row(
        //         children: [
        //           Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
        //               .box
        //               .roundedFull
        //               .clip(Clip.antiAlias)
        //               .make(),
        //           Expanded(
        //               child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               "Dummy User".text.fontFamily(semibold).white.make(),
        //               "customer@example.com".text.white.make(),
        //             ],
        //           )),
        //           OutlinedButton(
        //             style: OutlinedButton.styleFrom(
        //                 side: const BorderSide(
        //               color: whiteColor,
        //             )),
        //             onPressed: () async {
        //               await Get.put(AuthController()).signoutMethod(context);
        //               Get.offAll(() => const LoginScreen());
        //             },
        //             child: logout.text.fontFamily(semibold).white.make(),
        //           )
        //         ],
        //       ),
        //     ),
        //
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         detailsCard(
        //             count: "oo",
        //             title: "in your card",
        //             width: context.screenWidth / 3.4),
        //         detailsCard(
        //             count: "25",
        //             title: "in your wishlist",
        //             width: context.screenWidth / 3.4),
        //         detailsCard(
        //             count: "60",
        //             title: "in your order",
        //             width: context.screenWidth / 3.4),
        //       ],
        //     ),
        //     //buttons section
        //
        //     ListView.separated(
        //             shrinkWrap: true,
        //             separatorBuilder: (context, index) {
        //               return const Divider(
        //                 color: lightGrey,
        //               );
        //             },
        //             itemCount: profileButtonsList.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               return ListTile(
        //                 leading: Image.asset(
        //                   profileButtonsicon[index],
        //                   width: 22,
        //                 ),
        //                 title: profileButtonsList[index]
        //                     .text
        //                     .fontFamily(semibold)
        //                     .color(darkFontGrey)
        //                     .make(),
        //               );
        //             })
        //         .box
        //         .white
        //         .rounded
        //         .margin(const EdgeInsets.all(12))
        //         .padding(const EdgeInsets.symmetric(horizontal: 16))
        //         .shadowSm
        //         .make()
        //         .box
        //         .color(redColor)
        //         .make(),
        //   ],
        // )),
      ),
    );
  }
}
