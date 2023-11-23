import 'package:blog_app_task/model/post_model.dart';
import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
   final PostModel post;
   
  const DetailTile(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
       child: ListTile(
        title: Text('${post.body}'),
       
      ),
    );
  }
}