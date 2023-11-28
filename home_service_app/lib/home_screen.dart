//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:home_service_app/service_detail.dart';

//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service> service = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    service = [
      Service(title: 'Plumbing', price: '\$9', images: [
        'images/plumbing.jpg',
        'images/handyman.jpg',
        'images/mechanic.jpeg'
      ]),
      Service(title: 'Handy Man', price: '\$20', images: [
        'images/handyman.jpg',
        'images/plumbing.jpg',
        'images/moving.jpg'
      ]),
      Service(title: 'Mechanic', price: '\$25', images: [
        'images/mechanic.jpeg',
        'images/moving.jpg',
        'images/electrical.jpeg'
      ]),
      Service(title: 'Moving', price: '\$15', images: [
        'images/moving.jpg',
        'images/electrical.jpeg',
        'images/plumbing.jpg'
      ]),
      Service(title: 'Electrical', price: '\$9', images: [
        'images/electrical.jpeg',
        'images/mechanic.jpeg',
        'images/plumbing.jpg'
      ]),
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
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue[200]),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Different Home Services',
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
                      .where((service) => service.title
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

  Widget buildService(Service service) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => ServiceDetail()));
      },
      child: Card(
          child: Column(
        children: [
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
          ListTile(
            title: Text(
              service.title,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(service.price),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                '  Good Quality',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class Service {
  final String title;
  final String price;
  final List<String> images;
  int currentIndex;

  Service(
      {required this.title,
      required this.price,
      required this.images,
      this.currentIndex = 0});
}
