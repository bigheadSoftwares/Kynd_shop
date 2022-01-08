part of 'blog_repository.dart';

BlogModel blogModelFromJson(String str) =>
    BlogModel.fromJson(json.decode(str) as Map<String, dynamic>);

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  BlogModel copyWith({
    bool? success,
    List<Datum>? data,
  }) =>
      BlogModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        success: json['success'] as bool,
        data: List<Datum>.from((json['data'] as Iterable<dynamic>)
            .map((dynamic x) => Datum.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    this.image,
    this.categoryId,
    this.title,
    this.slug,
    this.description,
    this.userProfile,
    required this.isLiked,
    required this.totalLike,
    required this.totalUnlike,
    required this.status,
    required this.createdAt,
  });

  int id;
  String? image;
  int? categoryId;
  String? title;
  String? slug;
  String? description;
  int isLiked;
  int totalLike;
  int totalUnlike;
  int status;
  String? userProfile;
  String createdAt;

  Datum copyWith({
    int? id,
    String? image,
    int? categoryId,
    String? title,
    String? slug,
    String? description,
    int? isLiked,
    int? totalLike,
    int? totalUnlike,
    int? status,
    String? createdAt,
  }) =>
      Datum(
        id: id ?? this.id,
        image: image ?? this.image,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        description: description ?? this.description,
        totalLike: totalLike ?? this.totalLike,
        totalUnlike: totalUnlike ?? this.totalUnlike,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        isLiked: isLiked ?? this.isLiked,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        image: json['image'] == null ? null : json['image'] as String,
        categoryId:
            json['category_id'] == null ? null : json['category_id'] as int,
        title: json['title'] == null ? null : json['title'] as String,
        slug: json['slug'] == null ? null : json['slug'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        totalLike: json['total_like'] as int,
        userProfile: json['user_profile'] == null
            ? null
            : json['user_profile'] as String,
        totalUnlike:
            json['total_unlike'] == null ? 0 : json['total_unlike'] as int,
        status: json['status'] as int,
        createdAt: json['created_at'] as String,
        isLiked: json['isLiked'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'image': image,
        'category_id': categoryId,
        'title': title,
        'slug': slug,
        'description': description,
        'total_like': totalLike,
        'total_unlike': totalUnlike,
        'status': status,
      };
}
