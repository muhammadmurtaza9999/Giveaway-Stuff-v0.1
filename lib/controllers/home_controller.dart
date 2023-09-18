import 'package:flutter_gas/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }
  var currentNavIndex = 0.obs;
  var username = "";
  var featuredList = [];

  getUsername() async {
    var n = await firestore.collection(usersCollection).where('id', isEqualTo: currentUser!.uid).get().then((value) {
      if (value.docs.isNotEmpty) {
return value.docs.single['name'];
      }
    });
    username = n;
  }

  // fetchFeatured(data) {
  //   featuredList.clear();
  //   for (var i = 0; i < data.length; i++) {
  //     featuredList.add(data[i]);
  //     print(data[i]);
  //   }
  //   return featuredList.shuffle();
  // }
}
