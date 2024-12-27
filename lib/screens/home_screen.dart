import 'package:flutter/material.dart';
import 'package:laundry/screens/cart_screen.dart';
import 'package:laundry/screens/enquiry_form.dart';
import 'package:laundry/screens/landing_page.dart';
import '../product.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final int cartCount = 5;
  late TabController _tabController;
  String switching = 'Pick';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabListener);
  }

  void _tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0083F5),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Enquiry'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Enquiryform(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF0083F5),
      body: Column(
        children: [
          // Search TextField at the top
          Container(
            margin: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                labelText: 'Search products',
                filled: true,
                isDense: true,
                fillColor: Color(0xFFFFFFFF),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),

          // Place the TabBar below the TextField
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(39.0),
                  topRight: Radius.circular(39.0),
                ),
                color: Color(0xFFFFFFFF),
              ),
              padding: EdgeInsets.only(top: 14),
              child: TabBar(
                unselectedLabelColor: Color(0xFFFFFFFF),
                labelColor: Color(0xFF0083F5),
                isScrollable: true,
                indicator: BoxDecoration(),
                dividerColor: Color(0xFFFFFFFF),
                controller: _tabController,
                tabs: [
                  Container(
                    decoration: BoxDecoration(
                        color: _tabController.index == 0
                            ? Color(0xFF0083F5)
                            : Color(0xFFFFFFFF),
                        border: Border.all(color: Color(0xFF0083F5)),
                        borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: EdgeInsets.only(left: 48.0,right: 48.0,top: 8.0,bottom: 8.0),
                    margin: EdgeInsets.only(left: 5.0),
                    child: Center(
                      child: Text(
                        'Pick',
                        style: TextStyle(
                          color: _tabController.index == 0
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF0083F5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: _tabController.index == 1
                            ? Color(0xFF0083F5)
                            : Color(0xFFFFFFFF),
                        border: Border.all(color: Color(0xFF0083F5)),
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: EdgeInsets.only(left: 48.0,right: 48.0,top: 8.0,bottom: 8.0),
                    child: Center(
                      child: Text(
                        'Drop',
                        style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF0083F5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )),

          // TabBarView inside an Expanded widget
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PickProduct(), // Displayed when "Pick" tab is selected
                DropProduct(), // Displayed when "Drop" tab is selected
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PickProduct extends StatelessWidget {
  const PickProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 24.0),
        color: Color(0xFFFFFFFF),
        width: double.infinity,
        child: GridView.builder(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: Products.prod.length,
            itemBuilder: (context, index) {
              final item = Products.prod[index];
              return Containers(product: item);
            }),
      ),
    );
  }
}

class DropProduct extends StatelessWidget {
  const DropProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFFFFFFFF),
        width: double.infinity,
        child: GridView.builder(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: Products1.prod1.length,
            itemBuilder: (context, index) {
              final item = Products1.prod1[index];
              return Containers(product: item);
            }),
      ),
    );
  }
}

class Containers extends StatelessWidget {
  const Containers({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        height: 180,
        width: 174,
        padding: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, 0),
              blurRadius: 14.0,
            ),
          ],
          borderRadius: BorderRadius.circular(16.0),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              width: 155,
              height: 132,
            ),
            SizedBox(height: 10),
            Text(
              product.pname,
              style: TextStyle(fontSize: 14.0, color: Color(0xFF222222)),
            ),
          ],
        ),
      ),
    );
  }
}
