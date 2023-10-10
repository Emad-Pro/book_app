import 'package:book_app_mvvm/fetures/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/erorrs/faliure.dart';

abstract class SearchRepository {
  Future<Either<Faliure, BookModel>> searchBooks({required String booksName});
}
