import 'package:easypay/common/widgets/custom_text_field.dart';
import 'package:easypay/common/widgets/reusable_button.dart';
import 'package:easypay/common/widgets/text_reusable_button.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/images/gg2.png"),
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    textEditingController: mobileNumberController,
                    hintText: 'Mobile Number')),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    textEditingController: pinController,
                    hintText: 'Pin Number')),
            const SizedBox(
              height: 20,
            ),
            ReusableButton(buttonText: "Login", onPressed: () {}),
            const Spacer(),
            const Text("Not registered as a User?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            TextReusableButton(
                buttonText: "Sign Up",
                onPressed: () {
                  GoRouter.of(context).pushNamed(NamedRoutes.registration1);
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
