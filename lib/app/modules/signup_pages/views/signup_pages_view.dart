import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seasalon/app/controllers/auth_controller.dart';
import 'package:seasalon/app/modules/login__pages/views/login_pages_view.dart';

import '../controllers/signup_pages_controller.dart';

class SignupPagesView extends GetView<SignupPagesController> {
  final authC = Get.find<AuthController>();
  SignupPagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupPagesController());
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 48),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Colors.blueGrey,
          prefixIconColor: Colors.blueGrey,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Stack(
            children: [
              Blur(
                blur: 5.0,
                blurColor: Colors.blueGrey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "img/haircuts1.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(
                          textTheme: GoogleFonts.pacificoTextTheme().copyWith(
                            displayLarge: TextStyle(
                              color: Colors.grey[800],
                            ),
                            displayMedium: TextStyle(
                              color: Colors.grey[800],
                            ),
                            bodyLarge: TextStyle(
                              color: Colors.grey[800],
                            ),
                            bodyMedium: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        child: Text(
                          "SEA Salon",
                          style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Form(
                        // key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter you full name';
                                  }
                                  return null;
                                },
                                controller: controller.nameC,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.blueGrey,
                                onChanged: (value) {
                                  // setState(() {
                                  //   name = value;
                                  // });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Your Full Name",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.person_add_alt_1),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              controller: controller.emailC,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.blueGrey,
                              onChanged: (value) {
                                // setState(() {
                                //   mail = value;
                                // });
                              },
                              decoration: const InputDecoration(
                                hintText: "Your Email",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.email),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                controller: controller.phoneC,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.blueGrey,
                                onChanged: (value) {
                                  // setState(() {
                                  //   phone = int.tryParse(value);
                                  // });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Phone Number",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.phone_android),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              controller: controller.passC,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              cursorColor: Colors.blueGrey,
                              onChanged: (value) {
                                // setState(() {
                                //   password = value;
                                // });
                              },
                              decoration: const InputDecoration(
                                hintText: "Your password",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () => authC.signup(
                                controller.nameC.text,
                                controller.emailC.text,
                                controller.phoneC.text,
                                controller.passC.text,
                              ),
                              child: Text(
                                "Sign Up".toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Have an Account ? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => LoginPagesView());
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // if (isLoading) // Menampilkan indikator loading jika isLoading true
                      //   const CircularProgressIndicator(
                      //     color: Colors.blueGrey,
                      //   ),
                      if (MediaQuery.of(context).viewInsets.bottom == 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 26.0,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045457/ikiyaxwxuj616fxbqive.png",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 26.0,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045460/fdggcuj6chrzspuog9qa.png",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
