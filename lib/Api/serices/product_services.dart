import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';

import '../model/model.dart';


class ProductServices extends GetConnect{


 Future ProductServiceList() async {
   var  uri = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar';

   //
  try {
  final response = await get(uri);

  var jsonresponce = await json.decode(response.bodyString.toString());
 // log("json responce=>$jsonresponce");
  if(response.statusCode ==200){
    
    var data = ProductModel.fromJson(jsonresponce) ;
 //   log('data from service ==> $data');
    return data;
  }
}
on FormatException catch (e) {
log("erro is this =>$e.toString()");
  // TODO
}


  }

  
}