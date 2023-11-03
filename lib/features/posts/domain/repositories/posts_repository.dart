import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/posts/domain/enitites/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository{
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> addPost(Post post);
  Future<Either<Failure, Unit>> updatePost(Post post);
}