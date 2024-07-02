import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seasalon/app/controllers/auth_controller.dart';
import 'package:seasalon/app/modules/admin_login/views/admin_login_view.dart';
import 'package:seasalon/app/modules/signup_pages/views/signup_pages_view.dart';

import '../controllers/login_pages_controller.dart';

class LoginPagesView extends GetView<LoginPagesController> {
  final authC = Get.find<AuthController>();

  LoginPagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginPagesController());
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
        body: Stack(
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
                          color: Colors.black,
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
                          TextFormField(
                            controller: controller.emailC,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Your Email';
                              }
                              return null;
                            },
                            // controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.blueGrey,
                            onChanged: (value) {
                              //
                            },
                            decoration: const InputDecoration(
                              hintText: "Your email",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TextFormField(
                              controller: controller.passC,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Your Password';
                                }
                                return null;
                              },
                              // controller: passwordController,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              cursorColor: Colors.blueGrey,
                              onChanged: (value) {
                                //
                              },
                              decoration: const InputDecoration(
                                hintText: "Your password",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Hero(
                            tag: "login_btn",
                            child: ElevatedButton(
                              onPressed: () => authC.login(
                                controller.emailC.text,
                                controller.passC.text,
                              ),
                              child: Text("Login".toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don’t have an Account ? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SignupPagesView());
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     const Text(
                          //       "If You Admin ? ",
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Get.to(() => const AdminLoginView());
                          //       },
                          //       child: const Text(
                          //         "Login Here",
                          //         style: TextStyle(
                          //           color: Colors.orange,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
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
    );
  }
}
