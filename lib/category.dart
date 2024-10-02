import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  CategoryWidgetState createState() => CategoryWidgetState();
}

class CategoryWidgetState extends State<CategoryWidget> {
  bool showAll = false;
  final int initialCount = 8;

  final List<Map<String, dynamic>> categories = [
    {'name': 'Dentistry', 'icon': Icons.medical_services},
    {'name': 'Cardiology', 'icon': Icons.favorite},
    {'name': 'Pulmonology', 'icon': Icons.health_and_safety},
    {'name': 'General', 'icon': Icons.medication},

    {'name': 'Neurology', 'icon': Icons.health_and_safety},
    {'name': 'Pediatrics', 'icon': Icons.child_care},
    {'name': 'Orthopedics', 'icon': Icons.accessibility},
    {'name': 'Oncology', 'icon': Icons.local_hospital},

    {'name': 'Dermatology', 'icon': Icons.monitor_heart_rounded},
    {'name': 'Psychiatry', 'icon': Icons.psychology},
    {'name': 'Otolaryngology', 'icon': Icons.headphones},

  ];


  final List<Color> containerColors = [
    const Color(0xFFdc9497),
    const Color(0xFF93c19e),
    const Color(0xFFf5ad7e),
    const Color(0xFFaca1cd),
    const Color(0xFF4d9b91),
    const Color(0xFF5d4e81),
    const Color(0xFFdeb6b5),
    const Color(0xFF89ccdb),
  ];

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
              for (var i = 0; i < visibleCount; i++)
                _buildCategoryItem(
                  categories[i]['name'],
                  categories[i]['icon'],
                  containerColors[i % containerColors.length],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String category, IconData icon, Color containerColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 50.0,
                  color: Colors.white,
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
