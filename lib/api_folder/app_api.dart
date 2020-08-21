import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phone_store/models/post.dart';
import 'package:phone_store/models/todo.dart';
import 'package:phone_store/models/comment.dart';
import 'package:phone_store/models/photo.dart';

/*
class Api {
  //List<Post> postList=[];
   Future<List<Post>> fetchingData() async {
     var response = await http.get(
         'https://jsonplaceholder.typicode.com/posts');
     var jsonData = json.decode(response.body);
     for (var item in jsonData) {
       print(item['body']);
       //   postList.add(item);
     }
   }
 }

 */

class Api {
 //this is a General Method for trying ua_amer
  fetchingData() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/comments');
    var jsonData = json.decode(response.body);
    var data = jsonData;
    for (var item in data) {
      // print(item['name']);
    }
    return data;
  }
  Future<List<Post>> fetchingPost() async {
    List<Post> postsList = [];
    var response =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    var jsonData = json.decode(response.body);
    var data = jsonData;
    for (var item in data) {
      //hint the data variable is an array and we have to extract each row to its Model
      Post post = Post(
        userId: item['userId'],
        id: item['id'],
        title: item['title'],
        body: item['body'],
      );
      postsList.add(post);
    }
//    for (var item in postsList) {
//      print(item.id);
//    }
    return postsList;
  }
  Future<List<Todo>> fetchingTodo() async {
    List<Todo> todosList = [];
    var response =
    await http.get('https://jsonplaceholder.typicode.com/todos');
    var jsonData = json.decode(response.body);
    var data = jsonData;
    for (var item in data) {
      //hint the data variable is an array and we have to extract each row to its Model
   Todo todo=Todo(
      userId: item['userId'],
     id:item['id'],
     title: item['title'],
     completed: item['completed'],
   );
   todosList.add(todo);
    }
    for (var item in todosList) {
      print(item.id);
    }
    return todosList;
  }
Future<List<Photo>> fetchingPhoto() async{
    List<Photo> photosList=[];
    var response=await http.get('https://jsonplaceholder.typicode.com/photos');
  var jsonData=jsonDecode(response.body);
  var data=jsonData;
  for(var item in data){
    Photo photo=Photo(
      id: item['id'],
      albumId: item['albumId'],
      title: item['title'],
      url: item['url'],
      thumbnailUrl: item['thumbnailUrl'],
    );
    photosList.add(photo);
  }
  return photosList;
  }
  Future<List<Comment>> fetchingComment() async {
    List<Comment> commentsList = [];
    var response =
    await http.get('https://jsonplaceholder.typicode.com/comments');
    var jsonData = json.decode(response.body);
    var data = jsonData;
    for (var item in data) {
      //hint the data variable is an array and we have to extract each row to its Model
      Comment comment = Comment(
        postId: item['postId'],
        id: item['id'],
        name: item['name'],
        email: item['email'],
        body: item['body'],
      );
      commentsList.add(comment);
    }
    for (var item in commentsList) {
//      print(item.id);
    }
    return commentsList;
  }

  Future<List<String>> getCommentRow() async{
    var listSearch=[];
    var response=
    await http.get('https://jsonplaceholder.typicode.com/comments');
    var jsonBody=jsonDecode(response.body);
    for(int i=0;i<jsonBody.length;i++){
      listSearch.add(jsonBody[i]['name']);
    }
//    print(listSearch);
  }

  Future<List<String>> getCommentNames() async{
    List < String > names=[];
    var response=
    await http.get('https://jsonplaceholder.typicode.com/comments');
    var jsonData=jsonDecode(response.body);
    var data=jsonData;
    for(var item in data){
      Comment comment = Comment(
        postId: item['postId'],
        id: item['id'],
        name: item['name'],
        email: item['email'],
        body: item['body'],
      );
      names.add(comment.id.toString());
//   print(comment.name);
    }
    return names;
  }



}
