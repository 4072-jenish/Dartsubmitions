class Blog {
  List<String> posts = [];
  List<String> comments = [];
  void createPost(String post) {
    posts.add(post);
    print('Post created: $post');
  }
  void moderateComments({required String moderator, required bool approve}) {
    if (approve) {
      print('Approving comments...');
    } else {
      print('Deleting comments...');
    }
    comments.forEach((comment) {
      if (moderator == 'admin') {
        if (approve) {
          print('Approved: $comment');
        } else {
          print('Deleted: $comment');
          comments.remove(comment);
        }
      } else {
        print('$moderator does not have permission to moderate comments');
      }
    });
  }
}
void main() {
  final blog = Blog();
  blog.createPost('Hello World!');
  blog.comments.add('Great post!');
  blog.comments.add('I disagree!');
  blog.moderateComments(moderator: 'admin', approve: true);
  blog.moderateComments(moderator: 'editor', approve: true);
}