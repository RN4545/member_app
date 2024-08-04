import 'package:get/get.dart';

class ComplaintController extends GetxController {
  var complaints = <Map<String, String>>[].obs;

  void addComplaint(String category, String complaint) {
    complaints.add({
      'category': category,
      'complaint': complaint,
    });
  }
}
