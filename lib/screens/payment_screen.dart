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
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
  ];
  void _selectOption(int index) {
    setState(() {
      _containerColors = [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ];
      _containerColors[index] = Color(0xFF0083F5);
    });
  }

  final int cartCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 18.0, color: Color(0xFFF5F5F5)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0083F5),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFFD9EDFF),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image(
                    image: AssetImage('assets/images/Vector.png'),
                    height: 45,
                    width: 30,
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 6,
                          minHeight: 6,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: TextStyle(
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
          SizedBox(width: 10.0),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileimage.png'),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
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
        padding: EdgeInsets.only(top: 43.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 37, right: 37, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _selectOption(0), // Google Pay option
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[0], // Color for Google Pay
                      ),
                      child: Row(
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
                  SizedBox(
                    height: 13.0,
                  ),
                  GestureDetector(
                    onTap: () => _selectOption(1), // Phonepe option
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[1], // Color for Phonepe
                      ),
                      child: Row(
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
                  SizedBox(
                    height: 13,
                  ),
                  GestureDetector(
                    onTap: () => _selectOption(2), // COD option
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(10.0),
                        color: _containerColors[2], // Color for COD
                      ),
                      child: Row(
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
                  decoration: BoxDecoration(
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
                  padding: EdgeInsets.all(20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
