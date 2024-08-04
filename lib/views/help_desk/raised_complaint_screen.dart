import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:member_app/controllers/complaint.controller.dart';

class RaiseComplaintScreen extends StatelessWidget {
  final Map<String, String> category;
  final TextEditingController _complaintController = TextEditingController();
  final ComplaintController complaintController =
      Get.put(ComplaintController());

  RaiseComplaintScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category['icon']} ${category['name']}'),
        backgroundColor: Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _complaintController,
              decoration: const InputDecoration(
                labelText: 'Complaint',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final complaint = _complaintController.text;
                if (complaint.isNotEmpty) {
                  complaintController.addComplaint(
                      category['name']!, complaint);
                  _complaintController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Complaint Submitted'),
                      content: const Text('Your complaint has been submitted.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Submit Complaint'),
            ),
          ],
        ),
      ),
    );
  }
}
