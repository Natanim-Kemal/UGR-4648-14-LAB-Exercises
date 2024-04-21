import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const NetReq());
}

class NetReq extends StatelessWidget {
  const NetReq({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(),
      child: const MaterialApp(
        title: 'Network Request Bloc',
        home: MyHomePage(),
      ),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

abstract class PostsEvent {}

class FetchPosts extends PostsEvent {}

class PostsState {
  final List<Post> posts;
  final bool hasError;

  const PostsState({this.posts = const [], this.hasError = false});

  PostsState copyWith({List<Post>? posts, bool? hasError}) {
    return PostsState(
      posts: posts ?? this.posts,
      hasError: hasError ?? this.hasError,
    );
  }
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(state.copyWith(hasError: false));

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<Post> fetchedPosts = [];

        for (var post in jsonDecode(response.body)) {
          fetchedPosts.add(Post.fromJson(post));
        }

        emit(state.copyWith(posts: fetchedPosts));
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
  }
}

class PostDetailBloc extends Bloc<Object, Post> {
  PostDetailBloc() : super(Post());

  Future<void> fetchAndSetPost(int id) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      state = Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Request Bloc'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<PostsBloc>().add(FetchPosts());
          return Future.value();
        },
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }

            if (state.posts.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = state.posts[index];

                return ListTile(
                  title: Text(post.title),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          final postDetailBloc =
                              BlocProvider.of<PostDetailBloc>(context);
                          postDetailBloc.fetchAndSetPost(post.id);

                          return BlocBuilder<PostDetailBloc, Post>(
                            builder: (context, post) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text(post.title),
                                ),
                                body: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(post.body),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
