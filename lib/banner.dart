import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required to read from assets

// Modelul pentru un banner
class BannerItem {
  final String title;
  final String description;
  final String image;

  BannerItem({
    required this.title,
    required this.description,
    required this.image,
  });

  // Conversie din JSON în BannerItem
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}

// Funcția care parsează JSON-ul și returnează o listă de BannerItem
Future<List<BannerItem>> loadBannerItems() async {
  final String response = await rootBundle.loadString('assets/banner_data.json');
  final data = jsonDecode(response);
  final List<dynamic> bannersJson = data['banners'];

  return bannersJson.map((banner) => BannerItem.fromJson(banner)).toList();
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerItem>>(
      future: loadBannerItems(), // Load banners from JSON
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final banners = snapshot.data!;
          return SizedBox(
            height: 200,
            child: PageView(
              children: banners.map((banner) => _buildBannerItem(banner)).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildBannerItem(BannerItem banner) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: NetworkImage(banner.image), // Use NetworkImage for online images
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              banner.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              banner.description,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
