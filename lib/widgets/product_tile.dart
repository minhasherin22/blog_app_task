import 'package:blog_app_task/model/post_model.dart';
import 'package:blog_app_task/screens/home_page.dart';
import 'package:blog_app_task/service/post_service.dart';

import 'package:flutter/material.dart';


class ProductTile extends StatelessWidget {
  final PostModel post;
   ProductTile(this.post);
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${post.title}'),
        trailing: GestureDetector(
          onTap: (){
            deletPost(itemkey:post.id);
          },
          child: Icon(Icons.delete)),
      ),
    );
  }
  
Future  <void> deletPost({int? itemkey,context})async {
  final response = await HttpService.deletePost(itemkey);
    if (response != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sccessfully deleted")));
      await HomePage();
    } else {
      print(response);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to delete")));
    }
}
  
  
}