import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Exercise 1
Future<String> getQuote() async {
  var random = Random();
  await Future.delayed(Duration(seconds: random.nextInt(5)));
  var quotes = [
    "The future belongs to those who believe in the beauty of their dreams.",
    "I have not failed. I've just found 10,000 ways that won't work.",
    "The only thing that interferes with my learning is my education.",
    "I'm not lazy, I'm just conserving energy.",
  ];
  return quotes[random.nextInt(quotes.length)];
}

// Exercise 2
Future<String> downloadFile(String url) async {
  var response = await http.get(Uri.parse(url));
  return response.body;
}

// Exercise 3
Future<List<int>> loadData() async {
  await Future.delayed(Duration(seconds: 3));
  var data = List<int>.generate(10, (i) => Random().nextInt(100));
  return data;
}

// Exercise 4
Future<void> fetchWeatherData() async {
  final apiKey = 'API_KEY';
  final city = 'Addis Ababa';
  final url =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

  try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var temperature = data['main']['temp'];
      var weatherDescription = data['weather'][0]['description'];

      print('Temperature: $temperature');
      print('Weather: $weatherDescription');
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
