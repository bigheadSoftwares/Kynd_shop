part of 'add_blog_comment_cubit.dart';

abstract class AddBlogCommentState extends Equatable {
  const AddBlogCommentState();

  @override
  List<Object> get props => <Object>[];
}

class AddBlogCommentInitial extends AddBlogCommentState {}

class AddBlogCommentLoading extends AddBlogCommentState {}

class AddBlogCommentSuccess extends AddBlogCommentState {}

class AddBlogCommentFailure extends AddBlogCommentState {
  const AddBlogCommentFailure(this.error);
  final Failure error;

  @override
  List<Object> get props => <Object>[error];
}
