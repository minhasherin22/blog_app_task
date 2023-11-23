import 'dart:convert';

import 'package:blog_app_task/model/post_model.dart';
import 'package:http/http.dart'as http;
class HttpService{
  static Future<List<PostModel>>fetchPosts()async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      var data = response.body;
      return postModelFromJson(data);
    }else{
      throw Exception();
    }
  }

 

  

  static Future<dynamic>  deletePost(int? itemkey) async{
    var response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if(response.statusCode >200){
      var data = response.body;
      return jsonEncode(data);
    }else{
      return null;
    }
  }

 static  Future<dynamic> postUser({required Map<String, String> data})async {
     var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/"),
                         body: jsonEncode(data),
                          headers: {'Content-Type': 'application/json'},
              
    );
    if(response.statusCode >200){
      var data = response.body;
      return jsonDecode(data);
    }else{
      return null;
    }
  }

  

 
}