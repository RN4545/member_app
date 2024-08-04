import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app/views/help_desk/raised_complaint_screen.dart';
import 'package:member_app/views/help_desk/view_complaint_screen.dart';

import 'package:member_app/controllers/complaint.controller.dart';

class HelpDeskScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Electricity', 'icon': '⚡'},
    {'name': 'Plumbing', 'icon': '🔧'},
    {'name': 'Others', 'icon': '📋'},
  ];

  HelpDeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Desk'),
        backgroundColor: Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RaiseComplaintScreen(category: category),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category['icon']!,
                              style: const TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              category['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to view complaints screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewComplaintsScreen(),
                  ),
                );
              },
              child: const Text('View Complaints'),
            ),
          ],
        ),
      ),
    );
  }
}
