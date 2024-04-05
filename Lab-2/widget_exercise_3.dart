import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Second UI",
      home: Three(),
    ),
  );
}

class Three extends StatelessWidget {
  const Three({super.key});

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        child: Text('Order Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            Icon(Icons.check_circle,
                                color: Colors.teal, size: 40),
                            SizedBox(width: 4),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Completed',
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Order completed by 24 July, 2024',
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.grey[400],
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Order ID'), Text('#121323')],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order Date'),
                              Text('June 24, 2024')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Purchased Items',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(9, 15, 2, 5),
                          leading: SizedBox(
                            width: 50,
                            height: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/image1.png'),
                                ),
                              ),
                            ),
                          ),
                          title: Text('Computer Monitors'),
                          subtitle: Text('Price: 1000 Birr'),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(9, 15, image2, 5),
                          leading: SizedBox(
                            width: 50,
                            height: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/image2.png'),
                                ),
                              ),
                            ),
                          ),
                          title: Text('Old TV'),
                          subtitle: Text('Price: 300 Birr'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Purchased Items',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Name',
                                  style: TextStyle(color: Colors.grey)),
                              Text('Jacob James')
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Phone Number',
                                  style: TextStyle(color: Colors.grey)),
                              Text('(2213) 123132908')
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Address',
                                  style: TextStyle(color: Colors.grey)),
                              Text('61480 Sunbrook Bolivard'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipment',
                                  style: TextStyle(color: Colors.grey)),
                              Text('Economy')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Information',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment Method',
                                  style: TextStyle(color: Colors.grey)),
                              Text('Cash on delivery')
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
