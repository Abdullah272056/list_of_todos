import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart';

import '../controller/home_page_controller.dart';
import '../model/TodoListItemModel.dart';
import 'TodoDetailsPage.dart';
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  final homePageController = Get.put(HomePageController());


  ScrollController _controller=ScrollController();


  @override
  @mustCallSuper
  void initState() {
    super.initState();
    homePageController.firstLoad();
    // _controller=ScrollController()..addListener(_loadMore);
    _controller.addListener(() async{
      if(_controller.position.maxScrollExtent==_controller.position.pixels){
        homePageController.nextPageHandle();
      }

    });




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Home page"),
        ),
        body: Obx(() => homePageController.isFirstLoadRunning==true? Center(
          child: CircularProgressIndicator(),
        ):
        Column(
          children: [
            Expanded(child:
            Obx(() =>
                ListView.builder(
                    itemCount: homePageController.todoList.length,
                    controller:_controller,

                    itemBuilder: (_, index)=>InkWell(
                      onTap: (){

                        Get.to(TodoDetailsPage("${homePageController.todoList[index].id}"));
                        // Get.to(page)
                      },
                      child: Card(
                          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),


                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),

                            child: Column(
                              children: [

                                Row(
                                  children: [

                                    Text("User Id: ${homePageController.todoList[index].userId}"),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Id: ${homePageController.todoList[index].id}"),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text("Title: ${homePageController.todoList[index].title}"),
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Completed:"),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Checkbox(
                                        value:homePageController.todoList[index].completed,
                                        onChanged: ( value) {

                                        },
                                      ),
                                    )


                                  ],
                                ),



                              ],
                            ),
                          )

                      ),
                    )

                )
            )
            ),
            Obx(() =>
            homePageController.isMoreLoadRunning==true?Padding(
              padding: EdgeInsets.only(top: 10,bottom: 20),
              child: Center(
                  child: LinearProgressIndicator()
              ),
            ):Container()

            )
            // if(homePageController.isMoreLoadRunning==true)...{
            //   Padding(
            //     padding: EdgeInsets.only(top: 10,bottom: 20),
            //     child: Center(
            //       child: LinearProgressIndicator()
            //     ),
            //   )
            // },




            // if(_hasNextPage==false)...{
            //   Container(
            //     padding: EdgeInsets.only(top: 10,bottom: 20),
            //     child: Center(
            //       child:Text(
            //         "You have fetch all data",
            //         style: TextStyle(
            //           color: Colors.teal
            //         ),
            //       )
            //     ),
            //   )
            // }
          ],
        )

        ));
  }


  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }


}
