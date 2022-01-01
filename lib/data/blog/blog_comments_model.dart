part of 'blog_repository.dart';

BlogCommentsModel blogCommentsModelFromJson(String str) =>
    BlogCommentsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String blogCommentsModelToJson(BlogCommentsModel data) =>
    json.encode(data.toJson());

class BlogCommentsModel {
  BlogCommentsModel({
    required this.status,
    required this.data,
  });

  int status;
  List<Comment> data;

  BlogCommentsModel copyWith({
    int? status,
    List<Comment>? data,
  }) =>
      BlogCommentsModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory BlogCommentsModel.fromJson(Map<String, dynamic> json) =>
      BlogCommentsModel(
        status: json['status'] as int,
        data: List<Comment>.from((json['data'] as Iterable<dynamic>)
            .map((dynamic x) => Comment.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'data': List<dynamic>.from(data.map((dynamic x) => x.toJson())),
      };
}

class Comment {
  Comment({
    required this.id,
    required this.blogId,
    required this.userId,
    required this.comment,
    required this.setDefault,
  });

  int id;
  int blogId;
  int userId;
  String comment;
  int setDefault;

  Comment copyWith({
    int? id,
    int? blogId,
    int? userId,
    String? comment,
    int? setDefault,
  }) =>
      Comment(
        id: id ?? this.id,
        blogId: blogId ?? this.blogId,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        setDefault: setDefault ?? this.setDefault,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as int,
        blogId: json['blog_id'] as int,
        userId: json['user_id'] as int,
        comment: json['comment'] as String,
        setDefault: json['set_default'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'blog_id': blogId,
        'user_id': userId,
        'comment': comment,
        'set_default': setDefault,
      };
}
