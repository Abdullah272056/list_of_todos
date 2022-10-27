
import 'dart:io';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../model/TodoDetailsModel.dart';




class TodoDetailsController extends GetxController {

  String id;
  TodoDetailsController(this.id);

  @override
  void onInit() {
    super.onInit();

    getTodoDetails(id);


  }


  var title="".obs;
  var userId="".obs;
  var id1="".obs;

  RxBool completed = false.obs;



  updateTitle(String value) {
    title(value);
  }
  updateUserId(var value) {
    userId(value);
  }
  updateId1(var value) {
    id1(value);
  }
  updateCompleted(bool value) {
    completed(value);
  }



  //get all todo data list
  void getTodoDetails(String id) async{
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


        try {
          var response = await get(
            Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),

          );
          if (response.statusCode == 200) {



            TodoDetailsModel todoDetailsModel=todoDetailsModelFromJson(response.body);

            updateTitle(todoDetailsModel.title);
            updateUserId('${todoDetailsModel.userId}');
            updateId1('${todoDetailsModel.id}');
            updateCompleted(todoDetailsModel.completed);


          }
          else {
            Fluttertoast.cancel();
          }
        } catch (e) {
          // Fluttertoast.cancel();

        }
      }
    } on SocketException catch (e) {
      Fluttertoast.cancel();
     // _showToast("No Internet Connection!");
    }


  }


}