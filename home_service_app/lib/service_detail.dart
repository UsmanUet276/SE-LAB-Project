import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  int _currentSlide = 0;
  int selectedButton = 2;

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = [
    'images/electrical.jpeg',
    'images/handyman.jpg',
    'images/mechanic.jpeg',
    'images/moving.jpg',
    'images/plumbing.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentSlide = index;
                  });
                }),
            items: _image.map((image) {
              return Builder(builder: (context) {
                return Image.asset(
                  image,
                  fit: BoxFit.cover,
                );
              });
            }).toList(),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Price : \$20.0',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ]),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Service Description',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'These services have very good quality and our workers are also experienced.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'These services have very good quality and our workers are also experienced.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'These services have very good quality and our workers are also experienced.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'These services have very good quality and our workers are also experienced.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'These services have very good quality and our workers are also experienced.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(1);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: selectButton == 1
                            ? Colors.blue[300]
                            : Colors.white),
                    child: Text(
                      'Re-Order Service',
                      style: TextStyle(
                          color:
                              selectButton == 1 ? Colors.white : Colors.black,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(2);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: selectButton == 2
                            ? Colors.blue[300]
                            : Colors.white38),
                    child: Text(
                      'Selected Service',
                      style: TextStyle(
                          color:
                              selectButton == 2 ? Colors.white : Colors.black,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
