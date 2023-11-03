import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase{
  final PostRepository postRepository;

  DeletePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await postRepository.deletePost(id);
  }
}