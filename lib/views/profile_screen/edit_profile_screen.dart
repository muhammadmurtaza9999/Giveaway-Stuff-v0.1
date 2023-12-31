
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter_gas/views/widgets_common/bg_widget.dart';
import 'package:flutter_gas/views/widgets_common/custom_textfield.dart';
import 'package:flutter_gas/views/widgets_common/our_button.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/controllers/profile_controller.dart';
import 'package:get/get.dart';



class EditProfileScreen extends StatelessWidget {

  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
      body:  Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //if data image url and controller is empty
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                  //if data is not empty but controller path is empty
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                  ? Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  //else if controller path is not empty but data image url is
                  :Image.file(File(controller.profileImgPath.value),
                  width: 100, fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(color: redColor,
              onPress: (){
                Get.find<ProfileController>().
               changeImage(context);
              },
              textColor: whiteColor,title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                  controller: controller.nameController,
                  hint: nameHint, title: name, isPass: false),
              10.heightBox,
              customTextField(
                  controller: controller.oldpassController,
                  hint: passwordlHint, title: oldpass, isPass: true),
              10.heightBox,
              customTextField(
                  controller: controller.newpassController,
                  hint: passwordlHint, title: newpass, isPass: true),
              20.heightBox,
             controller.isLoading.value ? const CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation(redColor),
             )
                 : SizedBox(
                width: context.screenWidth - 60,
                child: ourButton(color: redColor, onPress: () async{


                  controller.isLoading(true);

                  //if image is not selected
                  if(controller.profileImgPath.value.isNotEmpty){
                    await controller.uploadProfileImage();
                  } else{
                    controller.profileImageLink = data['imageUrl'];
                  }

                  //if old password matches data base
                  if(data['password'] == controller.oldpassController.text){
                    await controller.changeAuthPassword(
                      email: data['email'],
                      password: controller.oldpassController.text,
                      newpassword: controller.newpassController.text);

                    await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name: controller.nameController.text,
                        password: controller.newpassController.text);
                    VxToast.show(context, msg: "Updated");
                  } else{
                    VxToast.show(context, msg: "Wrong Old Password");
                    controller.isLoading(false);
                  }

                },
                    textColor: whiteColor,title: "Save")),
            ],
        )
        .box
        .white
        .shadowSm
        .padding(const EdgeInsets.all(16))
        .margin(const EdgeInsets.only(top: 50, left: 12,right: 12))
        .rounded
        .make(),
      ),


      ),
      );
      
  }
}