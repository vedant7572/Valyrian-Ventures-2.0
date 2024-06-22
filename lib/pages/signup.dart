import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import '../service/database.dart';
import '../service/shared_pref.dart';
import '../widget/widget_support.dart';
import 'bottom_navbar.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  String email = "", password = "", name = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Registered Successfully",
                style: TextStyle(fontSize: 20.0),
              )
          )
        );
        String Id = randomAlphaNumeric(10);

        Map<String, dynamic> addUserInfo = {
          "Name":nameController.text,
          "Email": mailController.text,
          "Wallet": "0",
          "Id": Id,
        };

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavbar()
            )
        );
        await DatabaseMethods().addUserDetails(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(mailController.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        //because initially when the account is created the balance in wallet should be zero
        await SharedPreferenceHelper().saveUserId(Id);
        // user id is the random id generated above

      }
      on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              ) //password too weak text
            )
          );
        }
        else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exsists",
                style: TextStyle(fontSize: 18.0),
              )// account already exists text
            )
          );
        }
      }
    }
  } // for email password checking with firebase and validation

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  } // for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE80606),
                        Color(0xFF4A0000),
                      ],
                    ),
                  ),
                ),//red part
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                  height: MediaQuery.of(context).size.height /1.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),//white part
                Container(
                  margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "images/logo.png",
                          width: MediaQuery.of(context).size.width / 3,
                          fit: BoxFit.cover,
                        ),
                      ), //center logo
                      const SizedBox(
                        height: 50.0,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height /1.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Form(
                            key: _formkey,

                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Sign Up",
                                  style: AppWidget.headlineTextFieldStyle(),
                                ), //sign up text
                                const SizedBox(
                                  height: 30.0,
                                ),


                                TextFormField(
                                  controller: nameController,
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter Name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    ),
                                    labelText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),//name


                                const SizedBox(
                                  height: 30.0,
                                ),


                                 TextFormField(
                                   controller: mailController ,
                                   validator: (val) {
                                     return RegExp(
                                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                         .hasMatch(val!)
                                         ? null
                                         : "Enter correct email";
                                   },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    ),
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),//email


                                const SizedBox(
                                  height: 30.0,
                                ),


                                TextFormField(
                                  controller: passwordController,
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                    ),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                    filled: true,
                                  ),
                                ),//password text field
                            
                                const SizedBox(
                                  height: 40.0,
                                ),
                            
                                GestureDetector(
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = mailController.text;
                                        name = nameController.text;
                                        password = passwordController.text;
                                      });
                                    }
                                    registration();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE80606),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),//signup buttom


                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LogIn()
                                )
                            );
                          },

                          child:  Text(
                            "Already have an account? Login",
                            style: AppWidget.semiBoldTextFieldStyle(),
                          )
                      )//already have a account then go to login

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

