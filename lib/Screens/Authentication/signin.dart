import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jesr/Screens/welcome.dart';
import 'package:jesr/utils/colors_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //logo
        child: Container(
          child: Column(
            children: <Widget>[
             Container(
  height: 400,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background1.png'),
      fit: BoxFit.fill,
    ),
  ),
  child: Stack(
    children: <Widget>[
      Positioned(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: Text(
              "Welcome to Jesr",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 130,
         top: 32,
        width: 170,
        height: 200,
        
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logoWhite.png'),
            ),
          ),
        ),
      ),
    ],
  ),
),

              Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 00),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: hexStringToColor("9982C2"),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 0.2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100]!,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(
                                  fontFamily:
                                      'Ubuntu'), // Apply Ubuntu font family

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[550]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _passwordController,
                                      obscureText: !_isPasswordVisible,
                                      style: TextStyle(fontFamily: 'Ubuntu'),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[550]),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            hexStringToColor("B49EDD"),
                            hexStringToColor("9982C2"),
                          ],
                        ),
                      ),

                      //BUTTON
                      child: ElevatedButton(
                        onPressed: () {
                          signin();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(0, 255, 50, 50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        // Add your logic to handle the click event
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: hexStringToColor("9982C2"),
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                    SizedBox(height: 70),

//Or Label
/*
                    Row(children: <Widget>[
                      Expanded(child: Divider(color: Colors.black)),
                      Text("or",
                          style: TextStyle(
                            fontSize: 20,
                            color: hexStringToColor("9982C2"),
                            fontFamily: 'Ubuntu',
                          )),
                      Expanded(child: Divider(color: Colors.black)),
                    ]),*/
/*
                    //SignUp
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            hexStringToColor("9982C2"),
                            hexStringToColor("9982C2"),
                          ],
                        ),
                      ),

                      //BUTTON
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your login button onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(0, 255, 50, 50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ),
                      ),
                    ),
*/
                    SizedBox(height: 5),

GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  },
  child: Text.rich(
    TextSpan(
      text: "Don't have an account? ",
      style: TextStyle(
        color: Colors.grey[600],
        fontFamily: 'Ubuntu',
      ),
      children: [
        TextSpan(
          text: "Sign up",
          style: TextStyle(
            color: hexStringToColor("00B7B1"),
            fontFamily: 'Ubuntu',
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  ),
),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

