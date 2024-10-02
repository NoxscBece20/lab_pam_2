import 'package:flutter/material.dart';

class MedicalCenterWidget extends StatefulWidget {
  const MedicalCenterWidget({super.key});

  @override
  MedicalCenterWidgetState createState() => MedicalCenterWidgetState();
}

class MedicalCenterWidgetState extends State<MedicalCenterWidget> {
  bool showAll = false;

  final List<Map<String, String>> medicalCenters = [
    {
      'imagePath': 'assets/center1.jpg',
      'title': 'Sunrise Health Clinic',
      'address': '123 Main St, City, Country',
      'rating': '4.5',
      'distance': '5 miles',
      'type': 'Cardiology',
    },
    {
      'imagePath': 'assets/center2.jpg',
      'title': 'Harmony Dermatology Center',
      'address': '456 Elm St, City, Country',
      'rating': '4.0',
      'distance': '10 miles',
      'type': 'Dermatology',
    },
    {
      'imagePath': 'assets/center3.jpg',
      'title': 'NeuroHealth Institute',
      'address': '789 Oak St, City, Country',
      'rating': '4.8',
      'distance': '7 miles',
      'type': 'Neurology',
    },
    {
      'imagePath': 'assets/center4.jpg',
      'title': 'Pediatric Care Center',
      'address': '101 Pine St, City, Country',
      'rating': '4.2',
      'distance': '3 miles',
      'type': 'Pediatrics',
    },
    {
      'imagePath': 'assets/center5.jpg',
      'title': 'Maple Oncology Institute',
      'address': '202 Maple St, City, Country',
      'rating': '5.0',
      'distance': '2 miles',
      'type': 'Oncology',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nearby Medical Centers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              child: Text(showAll ? 'See Less' : 'See All'),
            ),
          ],
        ),

        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var center in (showAll ? medicalCenters : medicalCenters.take(3)))
                _buildCenterItem(
                  center['imagePath']!,
                  center['title']!,
                  center['address']!,
                  center['rating']!,
                  center['distance']!,
                  center['type']!,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCenterItem(String imagePath, String title, String address, String rating, String distance, String type) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, color: Colors.black, size: 16),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            rating,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const Icon(Icons.star_half, color: Colors.amber, size: 16),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Divider(thickness: 1, color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.earbuds_outlined, color: Colors.black54, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                distance,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.home_sharp, color: Colors.black54, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                type,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),

            const Positioned(
              right: 8,
              top: 8,
              child: Opacity(
                opacity: 0.6,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
