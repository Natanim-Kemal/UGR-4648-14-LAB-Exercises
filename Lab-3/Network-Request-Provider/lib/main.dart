import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

void main() {
  runApp(const NetReq());
}

class NetReq extends StatelessWidget {
  const NetReq({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Posts()),
        ChangeNotifierProvider(create: (_) => PostDetail()),
      ],
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

class Posts with ChangeNotifier {
  List<Post> _items = [];

  List<Post> get items {
    return [..._items];
  }

  Future<void> fetchAndSetPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<Post> fetchedPosts = [];

      for (var post in jsonDecode(response.body)) {
        fetchedPosts.add(Post.fromJson(post));
      }

      _items = fetchedPosts;

      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

class PostDetail with ChangeNotifier {
  late Post _post;

  // PostDetail() : _post = Post();

  Post get post {
    return _post;
  }

  Future<void> fetchAndSetPost(int id) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      _post = Post.fromJson(json.decode(response.body));

      notifyListeners();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<Posts>(context);
    posts.fetchAndSetPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Request Bloc',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 23, 60, 79),
      ),
      body: RefreshIndicator(
        onRefresh: posts.fetchAndSetPosts,
        child: ListView.builder(
          itemCount: posts.items.length,
          itemBuilder: (BuildContext context, int index) {
            final post = posts.items[index];

            return ListTile(
              title: SingleChildScrollView(
                child: Text(post.title),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      final postDetail =
                          Provider.of<PostDetail>(context, listen: false);
                      postDetail.fetchAndSetPost(post.id);

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
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
