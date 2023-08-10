import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/custom_text_field.dart';
import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void handleNextClick(WidgetRef ref, String otp) {
    ref
        .read(authControllerProvider.notifier)
        .verifyLoginToken(context: context, otp: otp,ref: ref);
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
                              if (_formKey.currentState!.validate()) {
                                handleNextClick(ref, otpController.text);
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
                    TextReusableButton(buttonText: "Login", onPressed: () {}),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
