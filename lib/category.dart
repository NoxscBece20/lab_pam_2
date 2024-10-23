import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required to read from assets

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  CategoryWidgetState createState() => CategoryWidgetState();
}

class CategoryWidgetState extends State<CategoryWidget> {
  bool showAll = false;
  final int initialCount = 8;
  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final String response = await rootBundle.loadString('assets/categories_data.json');
    final data = jsonDecode(response);
    setState(() {
      categories = List<Map<String, dynamic>>.from(data['categories']);
    });
  }

  @override
  Widget build(BuildContext context) {
    int visibleCount = showAll ? categories.length : initialCount;
    int rows = (visibleCount / 4).ceil();
    double itemHeight = 110.0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Categories',
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
          height: rows * itemHeight,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 1,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (var i = 0; i < visibleCount && i < categories.length; i++)
                _buildCategoryItem(
                  categories[i]['title'],
                  categories[i]['icon'],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String category, String iconUrl) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.grey[200], // You can choose a default color or use your containerColors list
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  iconUrl,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: FittedBox(
            child: Text(
              category,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
