import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bar_item_pages_controller.dart';

class BarItemPagesView extends GetView<BarItemPagesController> {
  const BarItemPagesView({super.key});

  Widget allBookings() {
    return GetBuilder<BarItemPagesController>(
      builder: (controller) {
        return StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.bookingStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Bookings Found'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Object?> ds = snapshot.data!.docs[index];
                Map<String, dynamic>? data = ds.data() as Map<String, dynamic>?;

                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  image: NetworkImage(data?["image"] ??
                                      "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Name : " +
                                                (data?["name"] ??
                                                    'Nama Tidak Tersedia'),
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      "Date and Time : " +
                                          (data?["Date and Time"] ??
                                              'Tanggal & Waktu Tidak Tersedia'),
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Text(
                                      "Phone : " +
                                          (data?["phone"] ??
                                              'Nomor Telepon Tidak Tersedia'),
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                    const SizedBox(height: 6.0),
                                    Text(
                                      "Service : " +
                                          (data?["service"] ??
                                              'Layanan Tidak Tersedia'),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Status : ${data?['status']}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        if (controller.userRole == 'Admin')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () => controller.acceptBooking(
                                    ds.id, data?['userId']),
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () => controller.cancelBooking(
                                    ds.id, data?['userId']),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        if (controller.userRole != 'Admin')
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () => controller.cancelBooking(
                                  ds.id, data?['userId']),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BarItemPagesController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            const Text(
              "All Bookings",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(child: allBookings()),
          ],
        ),
      ),
    );
  }
}
