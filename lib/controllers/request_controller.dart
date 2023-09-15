import 'package:get/get.dart';
import '../consts/consts.dart';

  class RequestController extends GetxController {
    var totalP = 0.obs;

    //text controllers for shipping details

    var addressController = TextEditingController();
    var cityController = TextEditingController();
    var stateController = TextEditingController();
    var postalcodeController = TextEditingController();
    var phoneController = TextEditingController();
    calculate(data) {
      totalP.value = 0;
      for (var i = 0; i < data.length; i++) {
        totalP.value = totalP.value + int.parse(data[i] ['tprice'].toString());
      }
    }
  }