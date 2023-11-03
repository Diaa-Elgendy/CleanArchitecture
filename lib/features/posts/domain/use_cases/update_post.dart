import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/posts/domain/enitites/post.dart';
import 'package:clean_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase{
  final PostRepository postRepository;

  UpdatePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(Post post )async{
    return await postRepository.updatePost(post);
  }
}