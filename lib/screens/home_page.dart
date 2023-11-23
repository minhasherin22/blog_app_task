


import 'package:appbar_dropdown/appbar_dropdown.dart';
import 'package:blog_app_task/controller/post_controller.dart';
import 'package:blog_app_task/model/post_model.dart';
import 'package:blog_app_task/screens/detaies_page.dart';
import 'package:blog_app_task/screens/user_adding_page.dart';
import 'package:blog_app_task/service/post_service.dart';
import 'package:blog_app_task/widgets/product_tile.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
   final PostController  postController = Get.put(PostController());
   final PostModel? post;
  
   HomePage({this.post});
  
  
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppbarDropdown(items: [
            'User Profile',
            'Setings',
            'Search',
            'More'
          ],
          // selected: 'User Profile',
           title:( (user) => user.toString() ),),
          centerTitle: true,
          title: Text("Home Page"),
        ),
        body: ListView.builder(
          itemCount:postController.postList.length ,
          itemBuilder: (context,index){
          return GestureDetector(
           onTap: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPage()));
           },
            child: ProductTile(
              postController.postList[index]),
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
    items:  <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: GestureDetector(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Icon(Icons.home)),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: GestureDetector(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPage()));
          },
          child: Icon(Icons.details)),
        label: 'Details',
      ),
      BottomNavigationBarItem(
        icon: GestureDetector(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AddingPage()));
          },
          child: Icon(Icons.add)),
        label: 'Add Post',
      ),
    ],
  ),
        
      )
      
      );
      
  }
  
}