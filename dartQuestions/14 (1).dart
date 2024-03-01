class SocialMediaPlatform {
  Map<String, List<String>> users = {
    'user1': ['post1', 'post2'],
    'user2': ['post3'],
  };
  Map<String, String> posts = {
    'post1': 'Hello World!',
    'post2': 'This is my second post',
    'post3': 'Check out my profile',
  };
  SocialMediaPlatform({required this.users, required this.posts});
  void createPost(String userId, String postText) {
    if (users.containsKey(userId)) {
      String newPostId = 'post${posts.length + 1}';
      posts[newPostId] = postText;
      users[userId]!.add(newPostId);
      print('Post created with ID: $newPostId');
    } else {
      print('Invalid user ID');
    }
  }
  void likePost(String postId) {
    if (posts.containsKey(postId)) {
      print('Liked post with ID: $postId');
    } else {
      print('Invalid post ID');
    }
  }
}
void main() {
  final socialMedia = SocialMediaPlatform(users: {'user1': ['post1', 'post2'], 'user2': ['post3']}, posts: {'post1': 'Hello World!', 'post2': 'This is my second post', 'post3': 'Check out my profile'});
  socialMedia.createPost('user1', 'This is my third post');
  socialMedia.likePost('post1');
}