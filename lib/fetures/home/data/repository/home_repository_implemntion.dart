import 'package:book_app_mvvm/core/api_service/api_service.dart';
import 'package:book_app_mvvm/fetures/home/data/model/book_model/book_model.dart';
import 'package:book_app_mvvm/core/erorrs/faliure.dart';
import 'package:book_app_mvvm/fetures/home/data/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepositoryImplemention implements SearchRepository {
  final ApiService apiService;

  SearchRepositoryImplemention(this.apiService);
  @override
  Future<Either<Faliure, BookModel>> searchBooks({required String booksName}) async {
    try {
      final response =
          await apiService.get(endPoint: 'volumes?filter=free-ebooks&orderBy=newest&q=$booksName');

      return Right(BookModel.fromJson(response));
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFaliure.fromDioErorr(e));
      } else {
        return Left(ServerFaliure(e.toString()));
      }
    }
  }
}
