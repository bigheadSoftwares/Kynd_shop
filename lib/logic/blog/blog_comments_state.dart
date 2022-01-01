part of 'blog_comments_cubit.dart';

abstract class BlogCommentsState extends Equatable {
  const BlogCommentsState();

  @override
  List<Object> get props => <Object>[];
}

class BlogCommentsInitial extends BlogCommentsState {}

class BlogCommentsLoading extends BlogCommentsState {}

class BlogCommentsSuccess extends BlogCommentsState {
  const BlogCommentsSuccess(this.comments);
  final BlogCommentsModel comments;

  @override
  List<Object> get props => <Object>[comments];
}

class BlogCommentsError extends BlogCommentsState {
  const BlogCommentsError(this.error);
  final Failure error;

  @override
  List<Object> get props => <Object>[error];
}
