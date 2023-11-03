import 'package:clean_architecture/features/posts/domain/enitites/post.dart';

class PostModel extends Post{

  const PostModel({required int id, required  String title, required  String body}) : super(id: 0, title: '', body: '');

  factory PostModel.fromJson(Map<String, dynamic> json){
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson(){
    return {'id':id, 'title': title, 'body':body};
  }
}