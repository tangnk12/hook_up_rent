//create new file
//add matrrial, page content
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hook_up_rent/model/sys_user.dart';
import 'package:hook_up_rent/model/user.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

import '../Boxes.dart';
import '../main.dart';
import '../utils/utils_pop.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // bool showPassword = false;
  //final _myBox = Hive.openBox('user');
  final formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();
  final List<UserTest> user = [];
  @override
  void dispose() {
    // Hive.box('user').close();
    Hive.close();
    super.dispose();
  }
  // Future registerHandler() async {

  // }

  @override
  Widget build(BuildContext context) {
    //add scaffold

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: ListView(children: <Widget>[
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Please Type In Username',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid Email'
                      : null,
            ),
            //  Padding(padding: EdgeInsets.all(10),),
            TextFormField(
              controller: passwordController,
              //   obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please Type In Password',
                // suffixIcon: IconButton(
                //   icon: Icon(
                //       showPassword ? Icons.visibility_off : Icons.visibility),
                //   onPressed: () {
                //     setState(() {
                //       showPassword = !showPassword;
                //     });
                //   },
                // ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) => password != null && password.length < 6
                  ? 'Enter a min 6 character password'
                  : null,
            ),
            TextFormField(
                controller: repeatPasswordController,
                decoration: InputDecoration(
                  labelText: 'Comfirm password',
                  hintText: 'Please Type In Same Password',
                )),

            //  Padding(padding: EdgeInsets.all(160),),
            Container(
              width: 80,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child:
                      Text("Register", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (passwordController.text.trim() ==
                        repeatPasswordController.text.trim()) {
                      signUp();
                      // signUpWithHive(usernameController.text.trim(),
                      // passwordController.text.trim());
                    } else {
                      CommonToast.showToast(
                          'The password and comfirm password not same');
                    }
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            //Padding(padding: EdgeInsets.all(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have account'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      CommonToast.showToast(e.message.toString());
      UtilsPop.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // Future signUpWithHive(String username, String password) async {
  //   final createUser = UserTest()
  //     ..username = username
  //     ..password = password;
  //   final box = Boxes.getNewUser();
  //   box.add(createUser);
  //   // setState(() => user.add(createUser));
  // }
}
