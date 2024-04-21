import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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

class PostsNotifier extends StateNotifier<List<Post>> {
  PostsNotifier() : super([]);

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List<dynamic> postsJson = jsonDecode(response.body);
    final List<Post> posts =
        postsJson.map((postJson) => Post.fromJson(postJson)).toList();
    state = posts;
  }
}

final postsProvider = StateNotifierProvider<PostsNotifier, List<Post>>(
  (ref) {
    final postsNotifier = PostsNotifier();
    postsNotifier.fetchPosts();
    return postsNotifier;
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 66, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Posts with Riverpod'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: posts.isEmpty
            ? const Text('No posts found')
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              ),
      ),
    );
  }
}
