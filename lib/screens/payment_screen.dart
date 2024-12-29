import 'package:flutter/material.dart';
import 'package:laundry/screens/status_screen.dart';
import 'cart_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen> {
  List<Color> _containerColors = [
    const Color(0xFFFFFFFF),
    const Color(0xFFFFFFFF),
    const Color(0xFFFFFFFF),
  ];
  void _selectOption(int index) {
    setState(() {
      _containerColors = [
        const Color(0xFFFFFFFF),
        const Color(0xFFFFFFFF),
        const Color(0xFFFFFFFF),
      ];
      _containerColors[index] = const Color(0xFF0083F5);
    });
  }

  final int cartCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
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
            topRight: Radius.circular(39.0),
          ),
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, -6),
              blurRadius: 12,
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 43.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 37, right: 37, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _selectOption(0), // Google Pay option
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[0], // Color for Google Pay
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Gpay.png')),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Google Pay',
                            style: TextStyle(
                                color: Color(0xFF474747), fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  GestureDetector(
                    onTap: () => _selectOption(1), // Phonepe option
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[1], // Color for Phonepe
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/phonepe.jpeg')),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Phonepe',
                            style: TextStyle(
                                color: Color(0xFF474747), fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  GestureDetector(
                    onTap: () => _selectOption(2), // COD option
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[2], // Color for COD
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/cod.png')),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Cash On Delivery',
                            style: TextStyle(
                                color: Color(0xFF474747), fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
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
                  height: 90,
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatusScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(298, 58),
                      backgroundColor: Color(0xFF0083F5),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
