part of 'search_books_cubit.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksLoaded extends SearchBooksState {
  final BookModel bookModel;

  const SearchBooksLoaded(this.bookModel);
}

class SearchBooksErorr extends SearchBooksState {
  final String erorrMessage;

  const SearchBooksErorr(this.erorrMessage);
}
