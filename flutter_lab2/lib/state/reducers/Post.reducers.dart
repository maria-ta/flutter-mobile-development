import 'package:flutter_lab2/models/PostModel.dart';
import 'package:flutter_lab2/state/actions/Post.actions.dart';

List<PostModel> postReducers(List<PostModel> posts, dynamic action) {
  if (action is AddPostAction) {
    return addItem(posts, action);
  } else if (action is ToggleLikePostAction) {
    return toggleItemState(posts, action);
  }
  return posts;
}

List<PostModel> addItem(List<PostModel> posts, AddPostAction action) {
  return List.from(posts)..add(action.post);
}

List<PostModel> toggleItemState(List<PostModel> posts, ToggleLikePostAction action) {
  return posts.map((post) {
    if (post.id == action.post.id) {
      bool isLikedByUser = post.likes
          .where((userLiked) => userLiked.id == action.user.id)
          .toList().length > 0;

      if (isLikedByUser) {
        post.likes = post.likes
            .where((userLiked) => userLiked.id != action.user.id)
            .toList();
      } else {
        post.likes.add(action.user);
      }
    }
    return post;
  }).toList();
}