import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "First UI",
      home: One(),
    ),
  );
}

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Container(
              color: Colors.blue,
              child: SafeArea(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.help, color: Colors.white),
                    Text(
                      'Tracker',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Icon(Icons.notification_important, color: Colors.white),
                        SizedBox(width: 5),
                        Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(child: Image.asset("assets/image1.png")),
                SizedBox(width: 10),
                const Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Robert Steven'),
                        Row(children: [
                          Icon(
                            Icons.car_crash_rounded,
                            color: Colors.blue,
                          ),
                          Text('+2313142423',
                              style: TextStyle(color: Colors.blue))
                        ])
                      ]),
                ),
                Text('Logout', style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            color: Colors.blue,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Online | Battrery: 90%',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500),
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                  MyWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Column(
        children: [
          Icon(
            Icons.umbrella,
            color: Colors.blue,
          ),
          Text('Umbrella'),
        ],
      ),
    );
  }
}
