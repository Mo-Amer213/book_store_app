import 'package:flutter/material.dart';

class Comment {
  int postId, id;
  String name, email, body;

  Comment(
      {this.postId,
    this.id,
    this.name,
    this.email,
    this.body});
}
