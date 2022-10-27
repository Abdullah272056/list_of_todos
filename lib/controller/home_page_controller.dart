
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../model/TodoListItemModel.dart';



class HomePageController extends GetxController {


  final scrollController=ScrollController();



  var pageNumber=1.obs;
  var limitCount=10.obs;
  var isFirstLoadRunning = true.obs;
  var hasNextPage = true.obs;
  var isMoreLoadRunning = false.obs;

  var todoList=[].obs;

  var otpCountDownSecond = 0.obs;

  var isCountingStatus = false.obs;

  void updateController(ScrollController _controller){
    _controller.addListener(() async{
      if(_controller.position.maxScrollExtent==_controller.position.pixels){
        nextPageHandle();
      }

    });
  }

  void updateTodoList(List<TodoListModel> newList){
    todoList=todoList+newList;
  }

  void updatePageNumber(){
    pageNumber++;
  }

  updateHasNextPage(var value) {
    hasNextPage(value);
  }

  updateIsFirstLoadRunning(var value) {
    isFirstLoadRunning(value);
  }


  updateIsMoreLoadRunning(var value) {
    isMoreLoadRunning(value);
  }


  //get first page data
  void firstLoad() async{

    updateIsFirstLoadRunning(true);

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


        try {
          var response = await get(
            Uri.parse('https://jsonplaceholder.typicode.com/todos?_page=${pageNumber}&_limit=${limitCount}'),

          );


          if (response.statusCode == 200) {
            updateIsFirstLoadRunning(false);
            var data = response.body;
            updateTodoList(todoListModelFromJson(data));
            //  todoList=todoListModelFromJson(data);
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


    updateIsFirstLoadRunning(false);

  }

  //get next page data
  void nextPageHandle() async{
    if(
     hasNextPage ==true &&
      isFirstLoadRunning==false &&
       isMoreLoadRunning==false
    ){


       updateIsMoreLoadRunning(true);


      updatePageNumber();
      //page number increase



      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {


          try {
            var response = await get(
              Uri.parse('https://jsonplaceholder.typicode.com/todos?_page=${pageNumber}&_limit=${ limitCount}'),

            );
            if (response.statusCode == 200) {
              final List fetchData=json.decode(response.body);

              if(fetchData.isNotEmpty){
                var data = response.body;
                 updateTodoList(todoListModelFromJson(data));


              }else{

                updateHasNextPage(false);

              }


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

      updateIsMoreLoadRunning(false);

    }



  }

}