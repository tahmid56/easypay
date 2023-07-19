import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/custom_text_field.dart';
import '../common/widgets/reusable_button.dart';

import '../common/widgets/text_reusable_button.dart';
import '../route/named_routes.dart';

class SecondRegistrationScreen extends StatefulWidget {
  const SecondRegistrationScreen({super.key});

  @override
  State<SecondRegistrationScreen> createState() =>
      _SecondRegistrationScreenState();
}

class _SecondRegistrationScreenState extends State<SecondRegistrationScreen> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
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
                      textEditingController: otpController,
                      hintText: 'OTP Sent To Your Phone')),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableButton(
                      buttonText: "Next",
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        GoRouter.of(context)
                            .pushNamed(NamedRoutes.registration3);
                        // }
                      }),
                  ReusableButton(
                      buttonText: "Go Back",
                      colorCode: 0xff00c2e5,
                      onPressed: () {
                        GoRouter.of(context).pop();
                      }),
                ],
              ),
              const Spacer(),
              const Text("Not registered as a User?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              TextReusableButton(
                  buttonText: "Login",
                  onPressed: () {
                    GoRouter.of(context).pushNamed(NamedRoutes.login);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
