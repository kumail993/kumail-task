import 'package:dio/dio.dart';
import 'package:eaisoft/model/posts_model.dart';

class PostsServices {
  static Future<PostsModel> getPosts() async {
    try {
      final response = await Dio().get('https://dummyjson.com/posts');
      PostsModel postsModel = PostsModel.fromJson(response.data);

      return postsModel;
    } catch (error) {
      throw Exception('PostsService: Failed to fetch posts: $error');
    }
  }

  static Future<PostsModel> createPost(PostsModel newPost) async {
    try {
      final response = await Dio().post(
        'https://dummyjson.com/posts/add',
        data: newPost,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successfully created post
        return PostsModel.fromJson(response.data);
      } else {
        // Handle non-200/201 status codes
        throw Exception(
            'Server responded with status code ${response.statusCode}');
      }
    } on DioError catch (dioError) {
      // Handle DioError specifically
      String errorMessage = 'An unknown error occurred';
      if (dioError.response != null) {
        errorMessage =
            'Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}';
      } else {
        errorMessage = 'Error: ${dioError.message}';
      }
      throw Exception('PostsService: Failed to create post: $errorMessage');
    } catch (error) {
      // Handle any other types of errors
      throw Exception('PostsService: Failed to create post: $error');
    }
  }
}
