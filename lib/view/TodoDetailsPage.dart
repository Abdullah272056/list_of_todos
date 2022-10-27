
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../controller/todo_details_page_controller.dart';

class TodoDetailsPage extends StatelessWidget {

  String id;


  TodoDetailsPage(this.id);



  @override
  Widget build(BuildContext context) {
    final todoDetailsController = Get.put(TodoDetailsController(id));
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo Details"),
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("User Id: "),
                  Obx(() =>
                      Text(" ${todoDetailsController.userId}"),
                  )


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Id: "),
                  Obx(() =>
                      Text(" ${todoDetailsController.id1}"),
                  )
                  ,

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Title: "),
                  Expanded(child: Obx(() =>
                      Text(" ${todoDetailsController.title}"),
                  ))



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Completed:"),
                  SizedBox(
                      height: 30,
                      width: 30,
                      child:  Obx(() =>
                          Checkbox(
                            value:todoDetailsController.completed.value,
                            onChanged: ( value) {

                            },
                          ),
                      )





                  )


                ],
              ),


            ],
          ),
        )

    );
  }




  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }


}
