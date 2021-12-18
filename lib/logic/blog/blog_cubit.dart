import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/blog/blog_repository.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());

  final BlogRepository _repo = BlogRepository();

  void getBlogs() async {
    emit(BlogLoading());
    _repo.getBlogs().then((BlogModel blog) {
      emit(BlogLoaded(blog));
    }, onError: (dynamic error, StackTrace trace) {
      emit(BlogError(handleError(error)));
    });
  }
}
