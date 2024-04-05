import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Second UI",
      home: Two(),
    ),
  );
}

class Two extends StatelessWidget {
  final String money = "8.9";
  const Two({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.arrow_back_outlined, color: Colors.black),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text('Search Product'),
                        SizedBox(width: 40),
                      ],
                    ),
                    color: Colors.grey[200],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.black),
                      SizedBox(width: 5),
                      Icon(Icons.notification_add, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 350),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image3.png"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$money Birr",
              style: TextStyle(fontSize: 25),
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey[400],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              'This is a minor description of the product. This is a minor description of the product. | This is a minor description of the product.'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(
                    "5.0",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('(354)')
                ],
              ),
              SizedBox(width: 20),
              Text('540 sale'),
              SizedBox(width: 20),
              Row(
                children: [
                  Icon(Icons.map, color: Colors.grey[300]),
                  Text('Gerji')
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Variant',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('Size: XS', style: TextStyle(fontSize: 14)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'XS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'S',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'M',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'L',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'XL',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text('Color: Red', style: TextStyle(fontSize: 14)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Red',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Brown',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Blue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'White',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Black',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Add to shopping cart",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              )),
        )
      ],
    ));
  }
}
