

import 'package:blog_app_task/controller/post_controller.dart';
import 'package:blog_app_task/model/post_model.dart';
import 'package:blog_app_task/screens/detaies_page.dart';
import 'package:blog_app_task/screens/home_page.dart';
import 'package:blog_app_task/service/post_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final PostController  postController = Get.put(PostController());
  List<Post> post = [];
  final title_controller = TextEditingController();
  final discription_controller = TextEditingController();
  @override
  void initState() {
    postController.GetPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
         
          itemCount: post.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(post[index].title),
              subtitle: Text(post[index].discription),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
        onPressed:(){
          showModalBottomSheet(
            context: context,
             builder: (context){
               return Container(
                padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
                child: Column(
                  children: [
                                    TextFormField(
                  controller: title_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Employee Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: discription_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Designation"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(onPressed: (){
                  if (title_controller.text != '' &&
                          discription_controller.text != ""){
                            createPost(title:title_controller.text,discription:discription_controller.text);
                          }
                  title_controller.text = "";
                  discription_controller.text = "";
                },
                
                 icon: Icon(Icons.add), label: Text("Create"))
                  ],
                ),
               );
             });
        },
       
        child: const Icon(Icons.add),
      ),
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
    ));
  }
 Future <void> createPost({required String title, required String discription})async {
  
var response = await HttpService.postUser(data:{"title":title,"description":discription});
if(response !=null){
 postController. GetPost();
}else{
  throw Exception();
}
 
 }

  
 
}