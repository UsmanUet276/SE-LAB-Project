import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // Lists to store data for services
  List<String> imageUrls = [];
  List<String> names = ['Ali', 'Ahamd', 'Rehan', 'Alia', 'Muhammad'];
  List<String> service = [
    'Electrical',
    'Furniture Cleaning',
    'HandyMan',
    'Teaching',
    'Mechanic'
  ];
  List<String> rating = ['4.5', '4.0', '4.2', '4.9', '4.9'];
  List<String> price = ['\$20', '\$25', '\$10', '\$30', '\$15'];

  @override
  void initState() {
    super.initState();
    // Fetch images from Firebase Storage
    fetchImages();
  }

// Fetch images from Firebase Storage
  Future<void> fetchImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (int i = 1; i <= 5; i++) {
      Reference ref = storage.ref().child('f$i.jpeg');
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrls.add(downloadUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue[200]),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  // Expanded GridView to display services
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: imageUrls.length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            imageUrls[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row for displaying name and rating
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                child: Text(
                                  names[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                child: Text(
                                  rating[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                child: Text(
                                  service[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(
                                    8.0,
                                  ),
                                ),
                                child: Text(
                                  price[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }
}

// ServiceProvider class for representing a service provider
class ServiceProvider {
  final String image;
  final String name;
  final String service;
  final double rating;
  final double price;

  ServiceProvider(
      {required this.image,
      required this.name,
      required this.service,
      required this.rating,
      required this.price});
}
