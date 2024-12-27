import 'package:flutter/material.dart';
import 'package:laundry/screens/home_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(39.0),
                topRight: Radius.circular(39.0)),
            color: Color(0xFFFFFFFF),
          ),
          padding: EdgeInsets.only(top: 43.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/payment 1.png')),
              Text(
                'Payment Success',
                style: TextStyle(fontSize: 17, color: Color(0xFF363636)),
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 41, right: 41),
                child: Text(
                  'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper orci. Etiam dictum lorem ac nisi ',
                  style: TextStyle(color: Color(0xFF808080), fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0083F5),
                    minimumSize: Size(117, 39),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              )
            ],
          )),
      backgroundColor: Color(0xFFFFFFFF),
    );
  }
}
