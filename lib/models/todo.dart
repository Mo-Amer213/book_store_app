import'package:flutter/material.dart';
class Todo{
  int userId,id;
  String title;
  bool completed;

  Todo(
  {this.userId,
    this.id,
    this.title,
    this.completed});
}