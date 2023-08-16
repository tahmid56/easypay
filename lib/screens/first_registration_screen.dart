import 'package:easypay/Services/auth_services.dart';
import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/constants/theme.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/custom_text_field.dart';

import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';

class FirstRegistrationScreen extends ConsumerStatefulWidget {
  const FirstRegistrationScreen({super.key});

  @override
  ConsumerState<FirstRegistrationScreen> createState() =>
      _FirstRegistrationScreenState();
}

class _FirstRegistrationScreenState
    extends ConsumerState<FirstRegistrationScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  void firstRegistrationClick(
    WidgetRef ref,
    BuildContext context,
    String fullName,
    String mobileNumber,
  ) {
    ref.read(authControllerProvider.notifier).firstStepRegistration(
          context: context,
          fullName: fullName,
          mobileNumber: mobileNumber,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "FullName",
                          style: TextStyle(
                              fontFamily: CustomTheme.fontFamily,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          textEditingController: fullNameController,
                          hintText: 'Full Name'),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Mobile No",
                          style: TextStyle(
                              fontFamily: CustomTheme.fontFamily,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                          textEditingController: mobileController,
                          hintText: 'Mobile No.'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableButton(
                        buttonText: "Next",
                        colorCode: 0xff000000,
                        customWidth: MediaQuery.of(context).size.width * 0.2,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            firstRegistrationClick(
                              ref,
                              context,
                              fullNameController.text,
                              mobileController.text,
                            );
                          }
                        }),
                    const Spacer(),
                    const Text("Not registered as a User?",
                        style: TextStyle(
                            fontSize: 15,
                            color: CustomTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomTheme.fontFamily)),
                    TextReusableButton(
                        buttonText: "Login",
                        onPressed: () {
                          GoRouter.of(context).pushReplacementNamed(NamedRoutes.login);
                        }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
