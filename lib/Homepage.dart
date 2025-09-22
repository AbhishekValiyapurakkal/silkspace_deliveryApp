import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List status = [
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      "Left silk space facility",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  ),
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      "Reached nearest hub",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  ),
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Out for delivery",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
  ),
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Delivered",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
  ),
  const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Cancelled",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
  )
];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            elevation: 40,
            shadowColor: Colors.black38,
            title: Center(
              child: Text(
                'Delivery',
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .where('track', isNotEqualTo: "pending")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final snap = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: SizedBox(
                            height: 350,
                            width: double.infinity,
                            //color: Colors.blue,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "RS.${snap['totalPrice']} ₹",
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snap['address'].split("+").join(" "),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Payment:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            snap['payment'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Spacer(),
                                          Card(
                                              child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                            'Order delivered?\nclick ok to confirm and delete order'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'orders')
                                                                    .doc(
                                                                        snap.id)
                                                                    .delete();
                                                              },
                                                              child:
                                                                  const Text("ok")),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  "Cancel")),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: const Icon(Icons.done)))
                                        ],
                                      ),
                                    ),
                                    snap['status'] < 4
                                        ? ElevatedButton(
                                            onPressed: () async {
                                              int status = snap['status'];
                                              status++;
                                              await FirebaseFirestore.instance
                                                  .collection('orders')
                                                  .doc(snap.id)
                                                  .update({'status': status});
                                            },
                                            child: const Text(
                                              "Update order Status",
                                              style: TextStyle(fontSize: 20),
                                            ))
                                        : const SizedBox(),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        const Text(":",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                        status[snap['status']]
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  });
            },
          )),
    );
  }
}
