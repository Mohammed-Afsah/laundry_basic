import 'package:flutter/material.dart';
import 'cart_screen.dart';

class Enquiryform extends StatefulWidget {
  const Enquiryform({super.key});

  @override
  State<Enquiryform> createState() => _EnquiryformState();
}

class _EnquiryformState extends State<Enquiryform> {
  final int cartCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enquiry Form',
          style: TextStyle(fontSize: 18.0, color: Color(0xFFF5F5F5)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0083F5),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFFD9EDFF),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Vector.png'),
                    height: 45,
                    width: 30,
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 6,
                          minHeight: 6,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: const TextStyle(
                            color: Color(0xFF0083F5),
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileimage.png'),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 15.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(39.0),
                topRight: Radius.circular(39.0)),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000), // Shadow color
                offset: Offset(0, -6), // Shadow position (dx, dy)
                blurRadius: 12, // How blurry the shadow is
                // How much the shadow spreads
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: 43.0),
          child: Container(
            margin: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your details',
                      style: TextStyle(fontSize: 13, color: Color(0xFF000000)),
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(fontSize: 11, color: Color(0xFF05518A)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Color(0xFF848484)),
                )),
                const SizedBox(
                  height: 14.0,
                ),
                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter phone number',
                  labelStyle: TextStyle(color: Color(0xFF848484)),
                )),
                const SizedBox(
                  height: 14.0,
                ),
                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter subject',
                  labelStyle: TextStyle(color: Color(0xFF848484)),
                )),
                const SizedBox(
                  height: 14.0,
                ),
                const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Question',
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(color: Color(0xFF848484)),
                    )),
                const SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0083F5),
                      minimumSize: const Size(163, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(7), // Set the border radius
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
