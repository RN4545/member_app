import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Visitor {
  final String id; // Add id field

  final String name;
  final String purpose;
  final String contact;
  final String flatNo;
  bool isApproved;
  bool? checkedIn;

  Visitor({
    required this.id,
    required this.name,
    required this.purpose,
    required this.contact,
    required this.flatNo,
    this.isApproved = false,
    this.checkedIn,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'purpose': purpose,
        'contact': contact,
        'flatNo': flatNo,
        'checkedIn': checkedIn,
        'isApproved': isApproved,
      };

  static Visitor fromJson(Map<String, dynamic> json) => Visitor(
        id: json['id'],
        name: json['name'],
        purpose: json['purpose'],
        contact: json['contact'],
        flatNo: json['flatNo'],
        checkedIn: json['checkedIn'],
        isApproved: json['isApproved'],
      );
}

class VisitorController extends GetxController {
  var db = FirebaseFirestore.instance;

  var visitors = <Visitor>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadVisitors();
  }

  Future<void> loadVisitors() async {
    db.collection("visitorsData").snapshots().listen(
      (querySnapshot) {
        visitors.value = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Add the document ID to the data
          return Visitor.fromJson(data);
        }).toList();
      },
      onError: (e) => print("Error completing: $e"),
    );
    // final prefs = await SharedPreferences.getInstance();
    // final jsonList = prefs.getStringList('visitors') ?? [];
    // visitors.value = jsonList
    //     .map((jsonStr) => Visitor.fromJson(jsonDecode(jsonStr)))
    //     .toList();
  }

  void approveVisitor(String visitorId) async {
    try {
      // Find the visitor in the local list
      final visitor = visitors.firstWhere((visitor) => visitor.id == visitorId);

      // Update the field in Firebase
      await db.collection("visitorsData").doc(visitorId).update({
        'isApproved': !visitor.isApproved,
      });
    } catch (e) {
      print("Error updating approval status: $e");
    }
  }
}
