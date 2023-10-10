import 'package:book_app_mvvm/core/api_service/api_service.dart';
import 'package:book_app_mvvm/fetures/home/data/repository/home_repository.dart';
import 'package:book_app_mvvm/fetures/home/data/repository/home_repository_implemntion.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerSingleton(ApiService(Dio()));
    getIt.registerSingleton<SearchRepository>(SearchRepositoryImplemention(getIt()));
  }
}
