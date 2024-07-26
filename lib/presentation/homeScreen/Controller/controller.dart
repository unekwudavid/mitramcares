import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mitramcares/presentation/homeScreen/model/homeScreen_model.dart';

class HomeController extends GetxController{

late Future<Chronicles> documents;

@override
void onInit(){
super.onInit();
documents = getData(); //initialize document varialbe by parsing decoded JSON Data.
}

//function to fetch(GET) data from endpoint 
Future<Chronicles>  getData() async{
  //endpoint
String  url = 'https://chroniclingamerica.loc.gov/search/titles/results/?terms=oakland&format=json&page=1' ;

//implementing try, catch for robust error handling 
try{
final response = await http.get(Uri.parse(url));

//if response status code is a success(200)
if(response.statusCode == 200){
var jsonString = response.body;

//logger package used when in debug mode to print data successfully fetched from API
if(kDebugMode){
  print('Response: $jsonString');
}
final chronicles = chroniclesFromJson(jsonString); //parse JSON Data

return chronicles;
}
//if response status code is not success(200)
else{
 //logger package used when in debug mode to print response when data fetch isnt successful
   if(kDebugMode){
    print('Raw response: ${response.body}');
  }
}
}
//handle network error
on SocketException catch(e){
  if (kDebugMode) {
    //initiate logger,in debug mode
    print('Server Error: $e');
  }
}

//handle client specific errors
on http.ClientException catch(e){
  if (kDebugMode) {
    //initate logger,in debug mode
    print('Client error: $e');
  }  
}

//handle any other type of error
catch (e){
  if(kDebugMode){
     //initate logger,in debug mode
    print('Error: $e');
  }
}
// ignore: null_check_always_fails
return null!;
}
}