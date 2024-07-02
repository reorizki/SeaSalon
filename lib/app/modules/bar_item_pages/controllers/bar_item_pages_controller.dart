import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BarItemPagesController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  Stream<QuerySnapshot>? bookingStream;
  StreamSubscription<User?>? _authStateChangesSubscription;
  User? currentUser;
  String? userRole;

  @override
  void onInit() {
    super.onInit();
    _authStateChangesSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User tidak terautentikasi');
        Get.offAllNamed('/login');
      } else {
        currentUser = user;
        print('User terautentikasi: ${currentUser?.uid}');
        getCurrentUserRoleAndLoadBookings();
      }
    });
  }

  @override
  void onClose() {
    _authStateChangesSubscription?.cancel();
    super.onClose();
  }

  Future<void> getCurrentUserRoleAndLoadBookings() async {
    if (currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(currentUser!.uid)
          .get();

      userRole = userDoc.data()?['Role'] ?? 'User';
      print('User role: $userRole');
      bookingStream = userRole == 'Admin'
          ? FirebaseFirestore.instance.collectionGroup("bookings").snapshots()
          : FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser!.uid)
              .collection("bookings")
              .snapshots();

      update();
    } else {
      print("User tidak terautentikasi. Navigasi ke halaman login.");
    }
  }

  Future<void> acceptBooking(String bookingId, String? userId) async {
    if (userId == null) {
      Get.snackbar('Error', 'User ID tidak tersedia.');
      return;
    }

    DocumentReference<Map<String, dynamic>> bookingDoc = userRole == 'Admin'
        ? FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("bookings")
            .doc(bookingId)
        : FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("bookings")
            .doc(bookingId);

    await bookingDoc.update({
      "status": "accepted",
    });
  }

  Future<void> cancelBooking(String bookingId, String? userId) async {
    if (userId == null) {
      Get.snackbar('Error', 'User ID tidak tersedia.');
      return;
    }

    DocumentReference<Map<String, dynamic>> bookingDoc = userRole == 'Admin'
        ? FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("bookings")
            .doc(bookingId)
        : FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("bookings")
            .doc(bookingId);

    DocumentSnapshot<Map<String, dynamic>> bookingSnapshot =
        await bookingDoc.get();

    if (bookingSnapshot.exists) {
      Map<String, dynamic>? data = bookingSnapshot.data();
      if (data != null && data["status"] != "accepted") {
        await bookingDoc.delete();
      } else {
        Get.snackbar('Failed', 'Cannot cancel an accepted booking');
      }
    }
  }
}
