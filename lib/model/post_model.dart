// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    PostModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
   
}
class Post{
  int id;
  String title;
  String discription;
   Post({
    required this.id,
    required this.discription,
    required this.title
   });
   factory Post.fromJson(Map<String, dynamic> json)=>Post(
    id: json['id'],
    discription: json['title_name'],
    title: json['discription_name']);

    Map<String,dynamic>toJson()=>{
"id":id,
"title_name":title,
"discription_name":discription
    };
}

