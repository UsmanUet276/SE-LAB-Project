//import 'dart:ui_web';

import 'package:flutter/material.dart';

//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class SelectedServices extends StatefulWidget {
  const SelectedServices({super.key});

  @override
  State<SelectedServices> createState() => _SelectedServicesState();
}

class _SelectedServicesState extends State<SelectedServices> {
  // Lists to store service provider names, quantities, prices, and images
  List<String> serviceProviderNames = [
    'ALI',
    'AHMAD',
    'ALIA',
    'REHAN',
    'FAHAD'
  ];
  List<int> quantities = [1, 1, 1, 1, 1];
  List<double> price = [9.0, 20.0, 25.0, 15.0, 9.0];
  List<String> images = [
    'images/person1.png',
    'images/person.jpg',
    'images/person2.png',
    'images/person3.png',
    'images/person4.png'
  ];
  // Increment quantity for the selected service
  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }
// Decrement quantity for the selected service
  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }
// Calculate the total cost of selected services
  double getServiceTool() {
    double total = 0.0;
    for (int i = 0; i < serviceProviderNames.length; i++) {
      total += quantities[i] * price[i];
    }
    return total;
  }

  /*void showCallDialog() {
    showDialog(
        context: context,
        builder: (context){
          (
            title: Text('Call Service'),
            content: Text('Hurray! You have Order this service Successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }*/

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Servives',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: serviceProviderNames.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: Key(serviceProviderNames[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          serviceProviderNames.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.cancel, color: Colors.white),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              images[index],
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              children: [
                                Text(
                                  serviceProviderNames[index],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  '\$${price[index]}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    decrementQuantity(index);
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text(
                                  quantities[index].toString(),
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                IconButton(
                                  onPressed: () {
                                    incrementQuantity(index);
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Service Selection',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      '\$${getServiceTool().toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          //showCallDialog();
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blue[300]),
                        child: Text('Proceed to Call'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 3,
    );
  }
}
