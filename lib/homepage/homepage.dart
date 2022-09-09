import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Api/controller/product_Controller.dart';
import '../constant/color.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = '';

    greetingMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {

    flutterLocalNotificationsPlugin.show(
        0,
        "Firebase Notification",
        "W I T  => WASH IN TIME PRIVATE LIMITED",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }
  String greetingMessage(){

    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return Fluttertoast.showToast(msg: ' ${FirebaseAuth.instance.currentUser!.email} \n  Good Morning}').toString();
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return Fluttertoast.showToast(msg: ' ${FirebaseAuth.instance.currentUser!.email} \n  Good Afternoon').toString();
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return Fluttertoast.showToast(msg: ' ${FirebaseAuth.instance.currentUser!.email} \n  Good Evening').toString();
    } else {
      return Fluttertoast.showToast(msg: '${FirebaseAuth.instance.currentUser!.email} \n  Good Night').toString();
    }
  }
  String query = "";


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() =>ProductApiController());


    ProductApiController controller = ProductApiController();
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    controller.getProduct();


    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: showNotification,child: Text('Press'),),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbar,
        centerTitle: true,
        title: const Text('Shopping Mall'),

      ),
      body: Column(
        children: [
          TextField(
          onChanged: (value) => controller.onSearch(value),
    controller: controller.editingController,
    decoration: InputDecoration(
    icon: const Icon(Icons.search),
    suffixIcon: GestureDetector(
    child: const Icon(Icons.close),
    onTap: () {
    controller.editingController.clear();
    },
    ),
    hintText: 'Search',
    border: InputBorder.none,
    ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            height: height1,
            width: width1,
            child:RefreshIndicator(onRefresh: () {
              setState(() {});
              return controller.getProduct();
            },
            child: Obx(()=>controller.isLoading.value ==false? GridView.builder(
                itemCount:controller.p.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  print(index);
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius:  BorderRadius.all( Radius.circular(10)),
                    ),
                    elevation: 10,
                    child: Column(
                      children: [
                      Expanded(
                        flex:2 ,
                        child:Image.network(controller.p[index].strDrinkThumb),),

                        Expanded(child:Text("Drink Name :${controller.p[index].strDrink}"),),


                      ],
                    ),
                  );
                }) : const Center(child: CircularProgressIndicator())
            ),
          ),
          ),
        ],
      )
    );
  }
}



