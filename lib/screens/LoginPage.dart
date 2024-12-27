import 'package:flutter/material.dart';
import 'package:laundry/screens/SignupPage.dart';
import 'package:laundry/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Map<String, String>> demoUsers = [
    {'email': 'user1@example.com', 'password': 'password123'},
    {'email': 'user2@example.com', 'password': 'mypassword456'},
    {'email': 'user3@example.com', 'password': 'securepassword789'},
  ];

  TextEditingController _enteredemail = TextEditingController();
  TextEditingController _enteredpassword = TextEditingController();
  bool _obscureText = true;

  void _login() {
    String enteredEmail = _enteredemail.text;
    String enteredPassword = _enteredpassword.text;

    // Check if the entered email and password match any demo user
    bool isValidUser = demoUsers.any((user) =>
        user['email'] == enteredEmail && user['password'] == enteredPassword);

    if (isValidUser) {
      // Navigate to the home screen if credentials match
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show error message if credentials don't match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0083F5),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 122.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(39.0),
              topRight: Radius.circular(39.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, -6),
                blurRadius: 12,
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 43.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Color(0xFF000000), fontSize: 19),
                ),
                SizedBox(height: 4),
                Text(
                  'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper',
                  style: TextStyle(color: Color(0xFF808080)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _enteredemail,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFF848484))),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: _obscureText,
                  controller: _enteredpassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF848484),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style:
                            TextStyle(color: Color(0xFF848484), fontSize: 14),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(358, 45),
                    backgroundColor: Color(0xFF0083F5),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
                SizedBox(height: 27),
                Row(
                  children: [
                    Container(
                      width: 132.0,
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Or Login With',
                      style: TextStyle(color: Color(0xFF848484), fontSize: 14),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      width: 132.0,
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(194.0, 45.0),
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/fcbk.png'),
                            maxRadius: 13,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'facebook',
                            style: TextStyle(
                                color: Color(0xFF848484), fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(194.0, 45.0),
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/ggl.png'),
                            maxRadius: 15,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Google',
                            style: TextStyle(
                                color: Color(0xFF848484), fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 200), // Add a small height for spacing
                Container(
                  padding: EdgeInsets.only(left: 90.0),
                  child: Row(
                    children: [
                      Text(
                        'Don’t have an account?',
                        style:
                            TextStyle(color: Color(0xFF848484), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(color: Color(0xFF05518A), fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
