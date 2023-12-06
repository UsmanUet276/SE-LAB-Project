//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:home_service_app/service_detail.dart';

//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({super.key});

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  List<Service> service = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    // Initialize the list of service providers
    service = [
      Service(
          name: 'Name: ALI(Plumber)',
          price: '\$9',
          images: ['images/person1.png'],
          rating: '4.5'),
      Service(
          name: 'Name: Ahmad(Mechanic)',
          price: '\$20',
          images: ['images/person.jpg'],
          rating: '4.9'),
      Service(
          name: 'Name: Alia(Teacher)',
          price: '\$25',
          images: ['images/person2.png'],
          rating: '4.0'),
      Service(
          name: 'Name: Rehan(Electrical)',
          price: '\$15',
          images: ['images/person3.png'],
          rating: '4.2'),
      Service(
          name: 'Name: Fahad(Moving)',
          price: '\$9',
          images: ['images/person4.png'],
          rating: '4.7'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: CustomScaffold(
        body: SafeArea(
            child: Column(
          children: [
            // Search bar at the top
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue[200]),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  // Expanded GridView to display service providers
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Different Services Provider',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
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
              child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: service
                      .where((service) => service.name
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .map((service) {
                    return buildService(service);
                  }).toList()),
            )
          ],
        )),
        showBottomNavBar: true,
        initialIndex: 0,
      ),
    );
  }

  // Widget to build each service provider card
  Widget buildService(Service service) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => ServiceDetail()));
      },
      child: Card(
          child: Column(
        children: [
          // Image carousel for service provider images
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: PageView.builder(
              itemCount: service.images.length,
              onPageChanged: (int index) {
                setState(() {
                  service.currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  service.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Circle avatars for indicating the current image
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List<Widget>.generate(service.images.length, (int circleIndex) {
              return Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: circleIndex == service.currentIndex
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }),
          ),
          // ListTile for service provider details
          ListTile(
            title: Text(
              service.name,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(service.price),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                '  Experienced',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

// Service class for representing a service provider
class Service {
  final String name;
  final String price;
  final List<String> images;
  final String rating;
  int currentIndex;

  Service(
      {required this.name,
      required this.price,
      required this.images,
      required this.rating,
      this.currentIndex = 0});
}
