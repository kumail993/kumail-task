import 'package:eaisoft/model/posts_model.dart';
import 'package:eaisoft/services/posts_services.dart';
import 'package:eaisoft/ui/views/home/widgets/add_post_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  TextEditingController postTitleController = TextEditingController();
  TextEditingController postBodyController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isFavorite = false.obs;
  RxList<Posts> posts = <Posts>[].obs;
  var tags = <String>[].obs;
  @override
  void onInit() async {
    fetchPosts();
    getFavorites();
    super.onInit();
  }

  void addTag() {
    if (tagController.text.isNotEmpty) {
      tags.add(tagController.text);
      tagController.clear(); // Clear the input field after adding the tag
    }
  }

  void removeTag(int index) {
    tags.removeAt(index);
  }

  Future<List<Posts>> fetchPosts() async {
    try {
      isLoading.value = true;

      // Fetch the PostsModel object
      PostsModel fetchedPostsModel = await PostsServices.getPosts();

      // Extract the list of posts from the PostsModel
      List<Posts> fetchedPosts = fetchedPostsModel.posts ?? [];

      posts.value = fetchedPosts;
      isLoading.value = false;

      return fetchedPosts;
    } catch (error) {
      isLoading.value = false;
      rethrow;
    }
  }

  void showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddPostDialogue();
      },
    );
  }

  void addPost(BuildContext context) async {
    Posts newPost = Posts(
      id: 31,
      title: postTitleController.text,
      body: postBodyController.text,
      tags: tags.toList(),
      userId: 1,
    );

    PostsModel postsModel = PostsModel(posts: [newPost]);

    try {
      PostsModel createdPost = await PostsServices.createPost(postsModel);
    } catch (error) {
      print('Failed to create post: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to create post')),
      );
    }
  }

  Future<void> addToFavorites(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(postId)) {
      favorites.add(postId);
      await prefs.setStringList('favorites', favorites);
    }
  }

  Future<void> removeFromFavorites(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    if (favorites.contains(postId)) {
      favorites.remove(postId);
      await prefs.setStringList('favorites', favorites);
    }
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }

  Future<void> checkFavoriteStatus(String postId) async {
    List<String> favorites = await getFavorites();
    isFavorite.value = favorites.contains(postId);
  }

  void toggleFavorite(String postId) async {
    if (isFavorite.value) {
      await removeFromFavorites(postId);
    } else {
      await addToFavorites(postId);
    }
    checkFavoriteStatus(postId);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
