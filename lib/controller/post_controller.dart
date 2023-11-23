import 'package:blog_app_task/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PostController extends GetxController{
  var isLoading = true.obs;
  var postList = [].obs;
  void onInit() {
    GetPost();
    super.onInit();
  }
  Future <void>GetPost()async {
try {  
 
  var response = await HttpService.fetchPosts();
   if(response != null){
    postList.value = response;
   }
   }catch(e){
      print(e);
    }
  }
  // Future<void> deleteUser({required String itemkey,context}) async {
   
  //   final response = await HttpService.deletePost(itemkey);
  //   if (response != null) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Sccessfully deleted")));
     
  //   } else {
  //     print(response);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Failed to delete")));
  //   }
   
  // }

 
}