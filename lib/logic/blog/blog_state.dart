part of 'blog_cubit.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => <Object>[];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  const BlogLoaded(this.blogs);
  final BlogModel blogs;

  @override
  List<Object> get props => <Object>[blogs];
}

class BlogError extends BlogState {
  const BlogError(this.error);
  final Failure error;

  @override
  List<Object> get props => <Object>[error];
}

class BlogAdded extends BlogState {}
