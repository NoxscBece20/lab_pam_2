import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        children: [
          _buildBannerItem('assets/banner1.jpg', 'Looking for \nSpecialist Doctors?', 'Schedule an appointment with \nour top doctors.'),
          _buildBannerItem('assets/banner2.jpg', 'Find Your \nIdeal Treatment', 'Get personalized treatment plans \nfor your health.'),
          _buildBannerItem('assets/banner3.jpg', 'Expert Care \nJust a Click Away', 'Access health services \nonline and book visits.'),
          _buildBannerItem('assets/banner4.jpg', 'Your Health \nMatters to Us', 'Experience quality care \nfrom our dedicated staff.'),
        ],
      ),
    );
  }

  Widget _buildBannerItem(String imagePath, String title, String subTitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
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
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              subTitle,
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
