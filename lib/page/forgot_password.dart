import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/utils_pop.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: Text('Reset Password'),
        ),
        body: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Padding(padding: EdgeInsets.only(left: 10, right: 10)),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Type your registered email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  return email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null;
                },
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                icon: Icon(Icons.email_outlined),
                label: Text("ResetPassword",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  resetPassword();
                },
              )
            ]),
          ),
        ),
      );

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      UtilsPop.showSnackBar("Reset Email was sent a link");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      UtilsPop.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
