import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  String _selectedLocation = 'Seattle, USA';

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(140.0),
      child: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.black),
                        const SizedBox(width: 8.0),
                        Text(
                          _selectedLocation,
                          style: const TextStyle(color: Colors.black),
                        ),

                        IconButton(
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          onPressed: () {
                            _showLocationBottomSheet(context);
                          },
                        ),
                      ],
                    ),

                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctor...',
                    hintStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: const Color(0xFFdae2e9),
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _showLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Select Location'),
            ),
            ListTile(
              title: const Text('Seattle, USA'),
              onTap: () {
                _changeLocation('Seattle, USA');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Los Angeles, USA'),
              onTap: () {
                _changeLocation('Los Angeles, USA');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chicago, USA'),
              onTap: () {
                _changeLocation('Chicago, USA');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('San Francisco, USA'),
              onTap: () {
                _changeLocation('San Francisco, USA');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Miami, USA'),
              onTap: () {
                _changeLocation('Miami, USA');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  void _changeLocation(String newLocation) {
    setState(() {
      _selectedLocation = newLocation;
    });
  }
}
