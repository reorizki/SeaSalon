import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seasalon/app/modules/login__pages/views/login_pages_view.dart';
import 'package:seasalon/app/modules/main_pages/views/main_pages_view.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Retrieve user ID
        String uid = userCredential.user!.uid;

        // Get user document from Firestore
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;

          // Check user's role
          String role = userData['Role'];

          if (role == 'Admin') {
            // Bypass email verification for admin
            Get.offAll(() => const MainPagesView());
            Get.snackbar("Success", "Login Success as Admin");
          } else {
            // Check if email is verified for non-admin users
            if (userCredential.user!.emailVerified) {
              Get.offAll(() => const MainPagesView());
              Get.snackbar("Success", "Login Success");
            } else {
              Get.snackbar("Error login account", "Please verify your email");
            }
          }
        } else {
          Get.snackbar("Error login account", "User data not found");
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error login account", "Email or Password is wrong");
      }
    } else {
      Get.snackbar("Error login account", "Please enter email and password");
    }
  }

  void signup(String name, String email, String phone, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String userId = userCredential.user!.uid;
      Map<String, dynamic> userInfoMap = {
        "Name": name,
        "Email": email,
        "Phone": phone,
        "Password": password,
        "Image":
            "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "CreatedAt": DateTime.now().toString().substring(0, 16),
        "Id": userId,
        "Role": "User",
      };

      await userCredential.user!.sendEmailVerification();

      await adduserDetails(userInfoMap, userId);

      Get.defaultDialog(
        title: "Success",
        middleText: "Account created successfully, Please verify your email",
        onConfirm: () {
          Get.offAll(() => LoginPagesView());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
        Get.snackbar(
            "Error creating account", "The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
        Get.snackbar("Error creating account",
            "The account already exists for that email.");
      }
    }
  }

  Future adduserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).set(
          userInfoMap,
        );
  }

  void logout() async {
    await auth.signOut();
    Get.offAll(() => LoginPagesView());
  }

  // Future<void> bookings(String name, String phone, String controller,
  //     String selectedService) async {
  //   // Retrieve user ID
  //   String uid = auth.currentUser!.uid;

  //   CollectionReference<Map<String, dynamic>> colBookings =
  //       firestore.collection("users").doc(uid).collection("bookings");

  //   QuerySnapshot<Map<String, dynamic>> snapBookings = await colBookings.get();

  //   String todayDocId = DateTime.now().toString().substring(0, 18);

  //   await colBookings.doc(todayDocId).set({
  //     "name": name,
  //     "phone": phone,
  //     "Date and Time": controller,
  //     "service": selectedService,
  //     "status": "pending", // Set status to pending
  //   });
  // }
  Future<void> bookings(String name, String phone, String controller,
      String selectedService) async {
    // Retrieve user ID
    String uid = auth.currentUser!.uid;

    CollectionReference<Map<String, dynamic>> colBookings =
        firestore.collection("users").doc(uid).collection("bookings");

    QuerySnapshot<Map<String, dynamic>> snapBookings = await colBookings.get();

    String todayDocId = DateTime.now().toString().substring(0, 18);

    await colBookings.doc(todayDocId).set({
      "userId": uid, // Add user ID to the booking document
      "name": name,
      "phone": phone,
      "Date and Time": selectedService,
      "service": controller,
      "status": "pending", // Set status to pending
    });
  }
}
