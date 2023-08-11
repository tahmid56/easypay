import 'package:easypay/common/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/custom_text_field.dart';
import '../common/widgets/reusable_button.dart';

import '../common/widgets/text_reusable_button.dart';
import '../controllers/auth_controller.dart';
import '../route/named_routes.dart';

class SecondRegistrationScreen extends ConsumerStatefulWidget {
  const SecondRegistrationScreen({super.key});

  @override
  ConsumerState<SecondRegistrationScreen> createState() =>
      _SecondRegistrationScreenState();
}

class _SecondRegistrationScreenState
    extends ConsumerState<SecondRegistrationScreen> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void handleNextClick(WidgetRef ref, BuildContext context, String otp) {
    ref
        .read(authControllerProvider.notifier)
        .secondStepRegistration(context: context, otp: otp);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Loader()
          : Padding(
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
                      child: Image.asset("assets/images/logo4.png"),
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
                              if (_formKey.currentState!.validate()) {
                                handleNextClick(
                                    ref, context, otpController.text);
                              }
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
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
