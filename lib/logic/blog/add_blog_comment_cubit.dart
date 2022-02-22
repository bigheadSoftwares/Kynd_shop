import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/export_utilities.dart';
import '../../data/blog/blog_repository.dart';

part 'add_blog_comment_state.dart';

class AddBlogCommentCubit extends Cubit<AddBlogCommentState> {
  AddBlogCommentCubit() : super(AddBlogCommentInitial());

  final BlogRepository _repo = BlogRepository();

  void addComment({required int blogId, required String comment}) async {
    emit(AddBlogCommentLoading());
    _repo.addComment(blogId: blogId, comment: comment).then((_) {
      emit(AddBlogCommentSuccess());
    }, onError: (dynamic error, StackTrace stackTrace) {
      emit(AddBlogCommentFailure(handleError(error)));
    });
  }
}
