import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/network/network_info.dart';
import 'package:clean_architecture/features/posts/data/data_sources/local_data_sourse.dart';
import 'package:clean_architecture/features/posts/data/data_sources/remote_data_sourse.dart';

import 'package:clean_architecture/features/posts/domain/enitites/post.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/posts_repository.dart';

class PostRepositoryImpl implements PostRepository{
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;


  PostRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected ) {
      try{
        
      final remotePosts = await remoteDataSource.getAllPosts();
      localDataSource.cachePosts(remotePosts);
      return Right(remotePosts);
      }catch(e){
        return Left(ServerFailure());
      }
    } else {
      try{
        final localPosts = await localDataSource.getCachedPosts();
          return Right(localPosts);
        }catch(e){
          return Left(EmptyCacheFailure());
        }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}