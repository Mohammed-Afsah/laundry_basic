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

  final TextEditingController _enteredemail = TextEditingController();
  final TextEditingController _enteredpassword = TextEditingController();
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
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Show error message if credentials don't match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0083F5),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 122.0),
          decoration: const BoxDecoration(
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
          padding: const EdgeInsets.only(top: 43.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(color: Color(0xFF000000), fontSize: 19),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper',
                  style: TextStyle(color: Color(0xFF808080)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _enteredemail,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFF848484))),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: _obscureText,
                  controller: _enteredpassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Color(0xFF848484)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF848484),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style:
                            TextStyle(color: Color(0xFF848484), fontSize: 14),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(358, 45),
                    backgroundColor: const Color(0xFF0083F5),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    SizedBox(
                      width: 132.0,
                      child: const Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    const Text(
                      'Or Login With',
                      style: TextStyle(color: Color(0xFF848484), fontSize: 14),
                    ),
                    const SizedBox(width: 20.0),
                    SizedBox(
                      width: 132.0,
                      child: const Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(194.0, 45.0),
                        shape: ContinuousRectangleBorder(
                          side: const BorderSide(color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
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
                    const SizedBox(width: 6),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(194.0, 45.0),
                        shape: ContinuousRectangleBorder(
                          side: const BorderSide(color: Color(0xFFC1C1C1)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
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
                const SizedBox(height: 200), // Add a small height for spacing
                Container(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Row(
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style:
                            TextStyle(color: Color(0xFF848484), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                        child: const Text(
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
