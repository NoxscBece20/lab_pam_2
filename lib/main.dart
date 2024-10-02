import 'package:flutter/material.dart';
import 'banner.dart';
import 'category.dart';
import 'medical_center.dart';
import 'doctor_list.dart';
import 'custom_app_bar.dart';

void main() {
  runApp(const DoctorAppointment());
}

class DoctorAppointment extends StatelessWidget {
  const DoctorAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: CustomAppBar(),
        ),

        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: const [

            BannerWidget(),
            SizedBox(height: 15.0),

            CategoryWidget(),
            SizedBox(height: 5.0),

            MedicalCenterWidget(),
            SizedBox(height: 15.0),

            DoctorList(),
          ],
        ),
      ),
    );
  }
}
