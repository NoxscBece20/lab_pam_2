import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '6 founds',
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
        _buildDoctorContainer('Dr. David Patel', 'Cardiologist', 'New York', 'assets/doctor1.jpg'),
        _buildDoctorContainer('Dr. Jessica Turner', 'Gynecologist', 'Los Angeles', 'assets/doctor2.jpg'),
        _buildDoctorContainer('Dr. Michael Johnson', 'Orthopedic Surgery', 'Chicago', 'assets/doctor3.jpg'),
        _buildDoctorContainer('Dr. Emily Walker', 'Pediatrics', 'Houston', 'assets/doctor4.jpg'),
        _buildDoctorContainer('Dr. Jessica Johnson', 'Cardiologist', 'New York', 'assets/doctor5.jpg'),
        _buildDoctorContainer('Dr. John Doe', 'Pediatrics', 'Los Angeles', 'assets/doctor6.jpg'),
      ],
    );
  }


  Widget _buildDoctorContainer(String name, String specialty, String location, String imagePath) {
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
      child: _buildDoctorItem(name, specialty, location, imagePath),
    );
  }


  Widget _buildDoctorItem(String name, String specialty, String location, String imagePath) {
    return Stack(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
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
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4.0),
                      Text('4.5'),
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
