import 'package:flutter/material.dart';

class NoticeBoardScreen extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {
      'title': 'New Year Celebration',
      'date': 'January 1, 2024',
      'details': 'Join us for a grand celebration to welcome the New Year!'
    },
    {
      'title': 'Christmas Party',
      'date': 'December 25, 2023',
      'details': 'Celebrate Christmas with us! Enjoy games, food, and fun!'
    },
    {
      'title': 'Annual General Meeting',
      'date': 'March 15, 2024',
      'details': 'Attend the AGM to discuss important community matters.'
    },
    {
      'title': 'Community Clean-Up',
      'date': 'April 22, 2024',
      'details': 'Join hands to clean our community park on Earth Day.'
    },
  ];

  NoticeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice Board'),
        backgroundColor: Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: notices.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final notice = notices[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  // Handle tap here, e.g., show notice details
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(notice['title']!),
                      content:
                          Text('${notice['date']!}\n\n${notice['details']!}'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notice['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notice['date']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notice['details']!,
                        style: TextStyle(
                          fontSize: 14,
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
    );
  }
}
