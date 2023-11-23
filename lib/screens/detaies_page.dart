import 'package:blog_app_task/controller/post_controller.dart';
import 'package:blog_app_task/model/post_model.dart';
import 'package:blog_app_task/screens/home_page.dart';
import 'package:blog_app_task/screens/user_adding_page.dart';
import 'package:blog_app_task/widgets/detail_tile.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key});
 final PostController  postController = Get.put(PostController()); 
   

  @override
  Widget build(BuildContext context) {
   
   List<PostModel>post = [];
      
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Detail Page"),
        ),
        body: ListView.builder(itemBuilder: (context,index){
             return Card(
              child: DetailTile(postController.postList[index]),
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
      ),
    );
  }
}