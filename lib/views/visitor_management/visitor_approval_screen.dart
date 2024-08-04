import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app/controllers/visitor_controller.dart';

class VisitorApprovalScreen extends StatelessWidget {
  final VisitorController visitorController = Get.find<VisitorController>();

  @override
  Widget build(BuildContext context) {
    visitorController.onInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Approval'),
        backgroundColor: Colors.grey[400],
      ),
      body: Obx(() => ListView.builder(
            itemCount: visitorController.visitors.length,
            itemBuilder: (context, index) {
              final visitor = visitorController.visitors[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(visitor.name[0]),
                  ),
                  title: Text(visitor.name),
                  subtitle: Text(
                    'Purpose: ${visitor.purpose}\nContact: ${visitor.contact}',
                  ),
                  trailing: visitor.isApproved
                      ? const Icon(Icons.check, color: Colors.green)
                      : ElevatedButton(
                          onPressed: () {
                            visitorController.approveVisitor(visitor.id);
                          },
                          child: const Text('Approve'),
                        ),
                ),
              );
            },
          )),
    );
  }
}
