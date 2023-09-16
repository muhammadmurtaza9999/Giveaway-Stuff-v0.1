import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gas/Services/firestore_services.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/views/widgets_common/loading_indicator.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Orders". text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllOrders(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty){
            return
              "No orders yet!".text.color(darkFontGrey).makeCentered();
          }else{

            return Container();
          }
        },
      ),
    );
  }
}
