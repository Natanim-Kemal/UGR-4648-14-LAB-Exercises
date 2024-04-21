import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        final postsBloc = PostsBloc();
        postsBloc.add(FetchPostsEvent());
        return postsBloc;
      },
      child: const MyApp(),
    ),
  );
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['title'],
      );
}

abstract class PostsEvent {}

class InitialEvent extends PostsEvent {}

class LoadingEvent extends PostsEvent {}

class FetchPostsEvent extends PostsEvent {} // Add this line

class PostsLoadedEvent extends PostsEvent {
  final List<Post> posts;

  PostsLoadedEvent(this.posts);
}

abstract class PostsStates {
  const PostsStates();

  List<Object> get props => [];
}

class PostsInitial extends PostsStates {}

class PostsLoading extends PostsStates {}

class PostsLoaded extends PostsStates {
  final List<Post> posts;

  const PostsLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostsError extends PostsStates {
  final String message;

  const PostsError(this.message);

  @override
  List<Object> get props => [message];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 11, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Posts with Bloc'),
    );
  }
}

class PostsBloc extends Bloc<PostsEvent, PostsStates> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>(
      (event, emit) async {
        if (event is LoadingEvent) {
          emit(PostsLoading());
        } else if (event is InitialEvent) {
          emit(PostsInitial());
        } else if (event is FetchPostsEvent) {
          // Handle the FetchPostsEvent
          final response = await http
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
          if (response.statusCode == 200) {
            final List<dynamic> responseBody = jsonDecode(response.body);
            final List<Post> posts =
                responseBody.map((post) => Post.fromJson(post)).toList();
            emit(PostsLoaded(posts));
          } else {
            emit(PostsError('Failed to load posts'));
          }
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<PostsBloc, PostsStates>(
        builder: (context, state) {
          if (state is PostsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is PostsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
