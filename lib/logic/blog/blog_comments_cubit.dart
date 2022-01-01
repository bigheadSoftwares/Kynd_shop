import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/blog/blog_repository.dart';

part 'blog_comments_state.dart';

class BlogCommentsCubit extends Cubit<BlogCommentsState> {
  BlogCommentsCubit() : super(BlogCommentsInitial());

  final BlogRepository _repo = BlogRepository();

  void getComments(int blogId) {
    _repo.getComments(blogId).then(
          (BlogCommentsModel comments) => emit(BlogCommentsSuccess(comments)),
          onError: (dynamic error, StackTrace trace) => emit(
            BlogCommentsError(
              handleError(error),
            ),
          ),
        );
  }
}
