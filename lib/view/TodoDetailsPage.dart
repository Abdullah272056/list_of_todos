
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

          child: Container(
            color: Colors.black.withOpacity(.2),
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("User Id: ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    Obx(() =>
                        Text(" ${todoDetailsController.userId}"),
                    )


                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Id: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    Obx(() =>
                        Text(" ${todoDetailsController.id1}"),
                    )
                    ,

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Title: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                    Flexible(
                        child: Obx(() =>
                            Text(" ${todoDetailsController.title}"),
                        ))






                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Completed: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),

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
