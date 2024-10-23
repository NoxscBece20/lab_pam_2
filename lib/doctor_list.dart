import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required to read from assets

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  DoctorListState createState() => DoctorListState();
}

class DoctorListState extends State<DoctorList> {
  List<Map<String, dynamic>> doctors = [];

  @override
  void initState() {
    super.initState();
    loadDoctors(); // Load doctors when the widget is initialized
  }

  Future<void> loadDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors_data.json');
    final data = jsonDecode(response);
    setState(() {
      doctors = List<Map<String, dynamic>>.from(data['doctors']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Doctors Found: 6', // Update this dynamically if needed
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.sort, color: Colors.grey),
                SizedBox(width: 4.0),
                Text(
                  'Sort By',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ...doctors.map((doctor) {
          return _buildDoctorContainer(
            doctor['full_name'],
            doctor['type_of_doctor'],
            doctor['location_of_center'],
            doctor['image'],
            doctor['review_rate'],
            doctor['reviews_count'],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildDoctorContainer(String name, String specialty, String location, String imagePath, double reviewRate, int reviewsCount) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: _buildDoctorItem(name, specialty, location, imagePath, reviewRate, reviewsCount),
    );
  }

  Widget _buildDoctorItem(String name, String specialty, String location, String imagePath, double reviewRate, int reviewsCount) {
    return Stack(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Divider(height: 4.0, thickness: 1.0, color: Colors.grey),
                  Text(
                    specialty,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.grey, size: 16),
                      const SizedBox(width: 4.0),
                      Text(
                        location,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4.0),
                      Text('$reviewRate (${reviewsCount} reviews)'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Positioned(
          top: 2.0,
          right: 2.0,
          child: Icon(Icons.favorite_border, color: Colors.red),
        ),
      ],
    );
  }
}
