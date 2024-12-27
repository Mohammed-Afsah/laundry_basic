import 'package:flutter/material.dart';
import 'package:laundry/screens/LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  bool _obscureText = true;

  void _userDetails() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String mobile = _mobileController.text;

    print(name);
    print(email);
    print(password);
    print(mobile);
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0083F5),
      body: SingleChildScrollView(
        // Makes the form scrollable when the keyboard is shown
        child: Container(
          margin: EdgeInsets.only(top: 122.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(39.0),
                topRight: Radius.circular(39.0)),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000), // Shadow color
                offset: Offset(0, -6), // Shadow position (dx, dy)
                blurRadius: 12, // How blurry the shadow is
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 43.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              children: [
                Text(
                  'Create an account',
                  style: TextStyle(color: Color(0xFF000000), fontSize: 19),
                ),
                SizedBox(height: 4),
                Text(
                  'Nam in risus quis risus consectetur pharetra vel vel erat. Suspendisse potenti. Maecenas sit amet semper',
                  style: TextStyle(color: Color(0xFF808080)),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Color(0xFF848484),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Enter Mobile Number',
                    labelStyle: TextStyle(color: Color(0xFF848484)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _userDetails,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(358, 45),
                    backgroundColor: Color(0xFF0083F5),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                  ),
                ),
                SizedBox(height: 27),
                Row(
                  children: [
                    Expanded(
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
                    Expanded(
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
                          ),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 147),
                Container(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Row(
                    children: [
                      Text(
                        'Already you have an account?',
                        style:
                            TextStyle(color: Color(0xFF848484), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style:
                              TextStyle(color: Color(0xFF05518A), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
