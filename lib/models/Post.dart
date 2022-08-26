// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map post) {
    return Post(
      userId: post["userId"],
      id: post["id"],
      title: post["title"],
      body: post["body"],
    );
  }
}
