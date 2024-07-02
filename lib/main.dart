import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seasalon/app/controllers/auth_controller.dart';
import 'package:seasalon/app/modules/login__pages/views/login_pages_view.dart';
import 'package:seasalon/app/modules/main_pages/views/main_pages_view.dart';
import 'package:seasalon/app/modules/welcomepages/views/welcomepages_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  MyApp({super.key});

  Future<bool> isAdmin(String uid) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return userData['Role'] == 'Admin';
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user != null) {
            return FutureBuilder<bool>(
              future: isAdmin(user.uid),
              builder: (context, adminSnapshot) {
                if (adminSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (adminSnapshot.hasData && adminSnapshot.data!) {
                  // User is an admin
                  return GetMaterialApp(
                    title: "SEA Salon",
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      textTheme: GoogleFonts.montserratTextTheme(),
                    ),
                    home: const MainPagesView(),
                    getPages: AppPages.routes,
                  );
                } else if (user.emailVerified) {
                  // User is not an admin but email is verified
                  return GetMaterialApp(
                    title: "SEA Salon",
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      textTheme: GoogleFonts.montserratTextTheme(),
                    ),
                    home: const MainPagesView(),
                    getPages: AppPages.routes,
                  );
                } else {
                  // User is not an admin and email is not verified
                  return GetMaterialApp(
                    title: "SEA Salon",
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      textTheme: GoogleFonts.montserratTextTheme(),
                    ),
                    home: LoginPagesView(),
                    getPages: AppPages.routes,
                  );
                }
              },
            );
          } else {
            // User is not logged in
            return GetMaterialApp(
              title: "SEA Salon",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(),
              ),
              home: const WelcomepagesView(),
              getPages: AppPages.routes,
            );
          }
        }
        return Container();
      },
    );
  }
}
