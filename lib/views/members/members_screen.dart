import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  final List<String> memberNames = [
    'Roshan Nakate',
    'Amar Nakate',
    'Asmita Musale',
    'Vaibhav Gherade',
    'Anita Nakate',
    'Arun Nakate',
    'Swati Shinde',
    'Sanchi Kharat',
    'Ramesh Pawar',
    'Shubham Mishra',
  ];

  late final List<Map<String, String>> members;

  MembersScreen({super.key}) {
    members = List.generate(
      memberNames.length,
      (index) => {
        'name': memberNames[index],
        'role': 'Role ${index + 1}', // Placeholder roles
        'avatar': 'https://via.placeholder.com/50', // Placeholder avatar
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
        backgroundColor: Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: members.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final member = members[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(member['avatar']!),
              ),
              title: Text(member['name']!),
              subtitle: Text(member['role']!),
              onTap: () {
                // Handle tap here, e.g., show member details
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(member['name']!),
                    content: Text('Role: ${member['role']!}'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
