import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/blog/blog_repository.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());

  final BlogRepository _repo = BlogRepository();

  void getBlogs() {
    emit(BlogLoading());
    _repo.getBlogs().then((BlogModel blog) {
      emit(BlogLoaded(blog));
    }, onError: (dynamic error, StackTrace trace) {
      debugPrint('trace: $trace');
      emit(BlogError(handleError(error)));
    });
  }

  void addBlog({
    required String title,
    required String description,
    required String image,
    required int category,
  }) {
    emit(BlogLoading());
    _repo
        .addBlog(
            title: title,
            description: description,
            image: image,
            category: category)
        .then((_) {
      emit(BlogAdded());
    }, onError: (dynamic error, StackTrace trace) {
      emit(BlogError(handleError(error)));
    });
  }

  @override
  void onChange(Change<BlogState> change) {
    debugPrint('$change');
    super.onChange(change);
  }
}
