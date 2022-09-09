import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wit_project/Api/model/model.dart';
import '../serices/product_services.dart';

class ProductApiController extends GetxController with StateMixin {
dynamic p =<Drinks>[].obs;
var isLoading = true.obs;
TextEditingController editingController = TextEditingController();
 getProduct() async{
  try {
  var resp = await ProductServices().ProductServiceList();

p=await resp.drinks;
  isLoading(false);
  update();

} on Exception catch (e) {
  log('error in contrioller ==>  $e');
}

}


List<Drinks> searchList = <Drinks>[];
List<Drinks> q = <Drinks>[];

onSearch(String value) {
  if (value.isEmpty) {

    ProductApiController().getProduct().then((value) {
      q = value;
      print(q);
    });
  } else {


   // searchList = p
   //      .where(
   //        (u) => (u.strDrink!.toLowerCase().contains(
   //      value.toLowerCase()
   //    ) as bool),
   //  )
   //      .toList();
    searchList = p
        .where((cityNameApi) =>
        cityNameApi.strDrink!.toLowerCase().contains(value.toLowerCase()  ) as bool)
        .toList();
    print(p);
  }
  p = searchList;
  update();
}




}