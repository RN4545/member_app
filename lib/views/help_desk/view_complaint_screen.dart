import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:member_app/controllers/complaint.controller.dart';

class ViewComplaintsScreen extends StatelessWidget {
  final ComplaintController complaintController =
      Get.find<ComplaintController>();

  ViewComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Complaints'),
        backgroundColor: Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => ListView.builder(
            itemCount: complaintController.complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaintController.complaints[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(complaint['category']!),
                  subtitle: Text(complaint['complaint']!),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
