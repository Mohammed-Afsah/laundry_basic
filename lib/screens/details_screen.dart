import 'package:flutter/material.dart';
import 'package:laundry/screens/cart_screen.dart';
import 'package:laundry/service.dart';
import '../product.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<int> selectedServiceIndices = [];
  final int cartCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 15.0),
          padding: const EdgeInsets.only(top: 15.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(39.0),
                        image: DecorationImage(
                          image: AssetImage(widget.product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 400,
                      height: 200,
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 9.0, bottom: 12.0),
                        child: const Text(
                          'What you want to do is describe the idea of the dress rather than the actual dress. Your readers aren\'t interested in in-depth descriptions of fabrics or cuts.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: const Divider(
                        thickness: 1.0,
                        height: 20.0,
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Text('Services')
                      ],
                    ),
                    Container(
                      height: 405,
                      color: const Color(0xFFFFFFFF),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10.0, bottom: 5.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          final item = services.serv[index];
                          return ServiceArea(
                            index: index,
                            service: item,
                            isSelected: selectedServiceIndices.contains(index),
                            onTap: () {
                              setState(() {
                                if (selectedServiceIndices.contains(index)) {
                                  selectedServiceIndices.remove(index);
                                } else {
                                  selectedServiceIndices.add(index);
                                }
                              });
                              if (selectedServiceIndices.contains(index)) {
                                for (int i = 0;
                                    i < selectedServiceIndices.length;
                                    i++) {
                                  print(
                                      'Selected service: ${services.serv[i].servicename}');
                                }
                              } else {
                                for (int i = 0;
                                    i < selectedServiceIndices.length;
                                    i++) {
                                  print(
                                      'Deselected service: ${services.serv[i].servicename}');
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
                        builder: (context) => CartScreen(),
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
        ),
      ),
    );
  }
}

class ServiceArea extends StatelessWidget {
  const ServiceArea({
    super.key,
    required this.service,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final Service service;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap
      child: Container(
        width: 112,
        height: 99,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(4.0, 4.0),
              blurRadius: 14.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.0),
          color: isSelected
              ? const Color(0xFF0083F5)
              : const Color(0xFFFFFFFF), // Apply color based on selection
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              service.servicename,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF222222),
              ),
            ),
            Text(
              service.Price.toString(),
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF222222),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
