import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seasalon/app/controllers/auth_controller.dart';
import 'package:seasalon/app/modules/bar_item_pages/views/bar_item_pages_view.dart';
import 'package:seasalon/app/modules/main_pages/views/main_pages_view.dart';
import 'package:seasalon/app/widgets/app_large_text.dart';
import '../controllers/booking_pages_controller.dart';

class BookingPagesView extends GetView<BookingPagesController> {
  final _formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();

  BookingPagesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookingPagesController());
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                AppLargeText(
                  text: "Let's Your Book",
                  color: Colors.black.withOpacity(0.8),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                    itemCount: controller.imagesBookings.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 200.0, // Atur lebar sesuai kebutuhan
                        height: 300.0,
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  "img/${controller.imagesBookings[index]}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  controller: controller.nameC,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  controller: controller.phoneC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Active Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(Icons.phone_outlined),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your Active Phone Number',
                  ),
                ),
                const SizedBox(height: 10.0),
                GetBuilder<BookingPagesController>(
                  builder: (_) {
                    List<ProductCategory> items = [
                      ProductCategory(
                        idCategory: 1,
                        categoryName: "Haircuts and Styling",
                      ),
                      ProductCategory(
                        idCategory: 2,
                        categoryName: "Manicure and Pedicure",
                      ),
                      ProductCategory(
                        idCategory: 3,
                        categoryName: "Facial Treatments",
                      ),
                    ];

                    return DropdownButtonFormField<ProductCategory>(
                      value: items[controller.selectedIndex],
                      decoration: const InputDecoration(
                        labelText: "Services",
                        helperText: "Type of service",
                      ),
                      onChanged: (ProductCategory? newValue) {
                        if (newValue != null) {
                          controller.updateSelectedService(newValue);
                        }
                      },
                      items: items.map((ProductCategory item) {
                        return DropdownMenuItem<ProductCategory>(
                          value: item,
                          child: Text(item.categoryName),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a service';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child ?? Container(),
                          );
                        },
                      );

                      if (pickedTime != null) {
                        final pickedDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                        final startTime = DateTime(pickedDate.year,
                            pickedDate.month, pickedDate.day, 9, 0); // 9:00 AM
                        final endTime = DateTime(pickedDate.year,
                            pickedDate.month, pickedDate.day, 21, 0); // 9:00 PM

                        if (pickedDateTime.isAfter(startTime) &&
                            pickedDateTime.isBefore(endTime)) {
                          controller.controller.text =
                              pickedDateTime.toString().substring(0, 16);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Waktu Tidak Valid"),
                                content: const Text(
                                    "Waktu yang dipilih harus antara 9:00 AM dan 9:00 PM."),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    }
                  },
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your time';
                      }
                      return null;
                    },
                    controller: controller.controller,
                    maxLength: 20,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Date and Time',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      suffixIcon: Icon(Icons.timer),
                      helperText: "Select your order time?",
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  height: 72,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authC.bookings(
                          controller.nameC.text,
                          controller.phoneC.text,
                          controller.selectedService,
                          controller.controller.text,
                        );

                        Get.dialog(
                          const BookingSuccessDialog(
                            hasOtherBookings: true,
                          ),
                        );

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text("Booking berhasil ditambahkan!"),
                        //   ),
                        // );
                      }
                    },
                    child: const Text("Booking"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCategory {
  final int idCategory;
  final String categoryName;
  ProductCategory({
    required this.idCategory,
    required this.categoryName,
  });
}

class BookingSuccessDialog extends StatelessWidget {
  final bool hasOtherBookings;

  const BookingSuccessDialog({super.key, required this.hasOtherBookings});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Success"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Booking added successfully!"),
          if (hasOtherBookings) const Text("Do you have another booking?"),
        ],
      ),
      actions: [
        if (hasOtherBookings)
          TextButton(
            onPressed: () {
              Get.back(); // Close current dialog
              // Navigate back to previous screen or perform other actions
            },
            child: const Text("Yes, add another"),
          ),
        TextButton(
          onPressed: () {
            Get.offAll(() => const MainPagesView());
          },
          child: const Text("No, close"),
        ),
      ],
    );
  }
}
