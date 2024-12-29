import 'package:flutter/material.dart';
import 'package:laundry/screens/order_details.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final int cartCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
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
        margin: const EdgeInsets.only(top: 15.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(39.0), topRight: Radius.circular(39.0)),
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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/ss.jpeg'),
                        fit: BoxFit.cover)),
                height: 75,
                width: 88,
              ),
              title: const Text(
                'Silk dress',
                style: TextStyle(color: Color(0xFF222222), fontSize: 14),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'i want to oneby one selected services from details screen here',
                    style: TextStyle(fontSize: 12, color: Color(0xFF9D9D9D)),
                  ),
                  Text(
                    '\$300/-',
                    style: TextStyle(fontSize: 14, color: Color(0xFF0083F5)),
                  )
                ],
              ),
              trailing: Container(
                width: 38,
                height: 75,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(29.0)),
                    color: Color(0xFFE5F3FF)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      size: 9,
                    ),
                    Text(
                      '3',
                      style: TextStyle(fontSize: 14, color: Color(0xFF0083F5)),
                    ),
                    Icon(
                      Icons.minimize,
                      size: 9,
                    )
                  ],
                ),
              ),
              contentPadding: const EdgeInsets.only(bottom: 20.0, left: 17.0),
            );
          },
          itemCount: 6,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        height: 90,
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetails(),
              ),
            );
          },
          child: Text(
            'Pick Order',
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
    );
  }
}
