import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1,
                children: [
                  _buildCard(
                    context,
                    '📝 Notice Board',
                    'View notices',
                    () => Get.toNamed('/notice_board'),
                  ),
                  _buildCard(
                    context,
                    '👨‍👩‍👧‍👦 Members',
                    'View members',
                    () => Get.toNamed('/members'),
                  ),
                  _buildCard(
                    context,
                    '✅ Visitor Approval',
                    'Approve visitors',
                    () => Get.toNamed('/visitor_approval'),
                  ),
                  _buildCard(
                    context,
                    '🛠 Help Desk',
                    'Contact help desk',
                    () => Get.toNamed('/help_desk'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/login');
              },
              child: const Text('Go Back To Login Page'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard(
  BuildContext context,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
