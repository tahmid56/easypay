import 'package:easypay/common/widgets/custom_text_field.dart';
import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/common/widgets/reusable_button.dart';
import 'package:easypay/common/widgets/text_reusable_button.dart';
import 'package:easypay/constants/theme.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleLoginClick(WidgetRef ref, String mobileNumber, String pin) {
    ref
        .read(authControllerProvider.notifier)
        .login(context: context, phoneNumber: mobileNumber, password: pin);
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.90,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "welcome",
                            style: TextStyle(
                                color: CustomTheme.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: CustomTheme.fontFamily),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset("assets/images/logo4.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              color: CustomTheme.secondaryColor,
                              fontFamily: CustomTheme.fontFamily,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Mobile",
                              style: TextStyle(
                                  color: CustomTheme.secondaryColor,
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(
                                textEditingController: mobileNumberController,
                                hintText: 'mobile number')),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: CustomTheme.secondaryColor,
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                              textEditingController: pinController,
                              hintText: 'password'),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child:const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                    color: CustomTheme.secondaryColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ReusableButton(
                          buttonText: "Login",
                          colorCode: 0xff000000,
                          customWidth: MediaQuery.of(context).size.width* 0.8,
                          onPressed: () {
                            handleLoginClick(ref, mobileNumberController.text,
                                pinController.text);
                          },
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Not a user?",
                              style: TextStyle(
                                  color: CustomTheme.secondaryColor,
                                  fontSize: 15,
                                  fontFamily: CustomTheme.fontFamily),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextReusableButton(
                              buttonText: "Sign Up",
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(NamedRoutes.registration1);
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                  color: Color(0xff53d5ec),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Italian Plate 2"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: Color(0xffeaf1ba),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Italian Plate 2"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
