import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/posts/domain/enitites/post.dart';
import 'package:clean_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPostUseCase{
  final PostRepository postRepository;

  GetAllPostUseCase(this.postRepository);

  Future<Either<Failure, List<Post>>> call()async{
    return await postRepository.getAllPosts();
  }
}