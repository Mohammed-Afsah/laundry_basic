import 'package:flutter/material.dart';
import 'package:laundry/screens/payment_screen.dart';
import '../utils/date_utils.dart' as date_util;
import 'cart_screen.dart';

List<String> timeSlots = [
  '09:00 Am',
  '10:00 Am',
  '11:00 Am',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '6:00 PM'
];

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late ScrollController scrollController;
  List<DateTime> currentMonthList = [];
  DateTime currentDateTime = DateTime.now();

  String _selectedTimeSlot = '';

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    _selectedTimeSlot = timeSlots[0];
    super.initState();
  }

  final int cartCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
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
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Info Section
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              height: 114,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profileimage.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Philipp',
                        style:
                            TextStyle(color: Color(0xFF3F3F3F), fontSize: 18),
                      ),
                      Text(
                        'John@gmail.com',
                        style:
                            TextStyle(color: Color(0xFF3F3F3F), fontSize: 14),
                      ),
                      Text(
                        '9874563210',
                        style:
                            TextStyle(color: Color(0xFF3F3F3F), fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(width: 80),
                  TextButton(
                    onPressed: () {},
                    child: const CircleAvatar(
                      minRadius: 15.0,
                      backgroundColor: Color(0xFFE5F3FF),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.0,
                        color: Color(0xFF0083F5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Address Section
            Container(
              padding: const EdgeInsets.only(left: 17.0, right: 17.0),
              child: const Text(
                'Address',
                style: TextStyle(color: Color(0xFF2E2E2E), fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 9.0, right: 31.0, bottom: 14.0, top: 13.0),
              margin: const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 18.0),
              height: 114,
              decoration:
                  BoxDecoration(border: Border.all(color: const Color(0xFFDDDDDD))),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(color: Color(0xFF232323), fontSize: 15),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                    style: TextStyle(color: Color(0xFF6C6C6C), fontSize: 15),
                  ),
                ],
              ),
            ),
            // Calendar Section
            Container(
              margin: const EdgeInsets.only(left: 18, right: 18),
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Date',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF2E2E2E)),
                      ),
                      Text(
                        date_util.DateUtils.months[currentDateTime.month - 1] +
                            ' ' +
                            currentDateTime.year.toString(),
                        style:
                            const TextStyle(color: Color(0xFF2E2E2E), fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.builder(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: currentMonthList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentDateTime = currentMonthList[index];
                              });
                            },
                            child: Container(
                              width: 56,
                              height: 87,
                              decoration: BoxDecoration(
                                color: (currentMonthList[index].day !=
                                        currentDateTime.day)
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF0083F5),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      date_util.DateUtils.weekdays[
                                          currentMonthList[index].weekday - 1],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: (currentMonthList[index].day !=
                                                  currentDateTime.day)
                                              ? const Color(0xFF787878)
                                              : const Color(0xFFFFFFFF)),
                                    ),
                                    Text(
                                      currentMonthList[index].day.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: (currentMonthList[index].day !=
                                                  currentDateTime.day)
                                              ? const Color(0xFF787878)
                                              : const Color(0xFFFFFFFF)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 18), child: const Text('Select Time')),
            Column(
              children: [
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: timeSlots.map((slot) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTimeSlot = slot;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              color: _selectedTimeSlot == slot
                                  ? const Color(0xFF0083F5)
                                  : const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: const Color(0xFFBBBBBB))),
                          child: Text(
                            slot,
                            style: TextStyle(
                              color: _selectedTimeSlot == slot
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            )
          ],
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
                builder: (context) => PaymentScreen(),
              ),
            );
          },
          child: Text(
            'Book Now',
            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 17),
          ),
          style: TextButton.styleFrom(
            minimumSize: Size(298, 58),
            backgroundColor: Color(0xFF0083F5),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
        ),
      ),
    );
  }
}
