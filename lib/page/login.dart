//create new file
//add matrrial, page content
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hook_up_rent/utils/utils_pop.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

import '../main.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  final Function onClickedSignUp;
  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _myBox = Hive.box('user');
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  late Box box1;
  @override
  void dispose() {
    //close specific data
    Hive.box('user').close();
    //close all
    //Hive.close();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   createBox();
  //   getData();
  // }

  // void createBox() async {
  //   box1 = await Hive.openBox('qing');\
  //   getData();
  // }

  // void getData() {
  //   if (box1.get('email') != null) {
  //     email.text = box1.get('email');
  //   }
  // }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    //add scaffold

    // var repeatPasswordController = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Please Type In Username',
            ),
          ),
          TextField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please Type In Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              )),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Text("Login", style: TextStyle(color: Colors.white)),
            onPressed: //signInWithHive,
                signIn,
          ),
          SizedBox(
            height: 24,
          ),
          GestureDetector(
            child: Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ForgotPasswordPage();
              }
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotPasswordPage();

                  ));
            },
          ),
          SizedBox(
            height: 24,
          ),
          Text('Didnt have account'),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = widget.onClickedSignUp as GestureTapCallback?,
              text: 'Register one',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
    //  Padding(padding: EdgeInsets.all(160),),
    //     Container(
    //       width: 80,
    //       child:
    //     ),
    //     SizedBox(
    //       height: 16,
    //     ),
    //     //Padding(padding: EdgeInsets.all(10),),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text('Didnt have account'),
    //         TextButton(
    //             onPressed: () {
    //               Navigator.pushReplacementNamed(context, 'register');
    //             },
    //             child: Text(
    //               'Register one',
    //               style: TextStyle(color: Colors.blue),
    //             )),
    //       ],
    //     )
    //   ],
    // );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      //UtilsPop.showSnackBar("something when wrong");
      UtilsPop.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // void signInWithHive() {
  //   box1.put('email', usernameController.text);
  //   box1.put('pass', passwordController.text);
  // }
}
