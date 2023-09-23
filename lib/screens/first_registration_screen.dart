import 'package:easypay/Services/auth_services.dart';
import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/constants/theme.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
  DateTime _dateTime = DateTime.now();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();
  void firstRegistrationClick(
    WidgetRef ref,
    BuildContext context,
    String fullName,
    String mobileNumber,
    String password,
    DateTime dateTime,
  ) {
    ref.read(authControllerProvider.notifier).firstStepRegistration(
          context: context,
          fullName: fullName,
          mobileNumber: mobileNumber,
          password: password,
          dateTime: dateTime,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          "Create new",
                          style: TextStyle(
                              fontSize: 38,
                              color: CustomTheme.secondaryColor,
                              fontFamily: CustomTheme.fontFamily),
                        ),
                        const Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 38,
                              color: CustomTheme.secondaryColor,
                              fontFamily: CustomTheme.fontFamily),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already Registered?",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: CustomTheme.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: CustomTheme.fontFamily),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextReusableButton(
                                  buttonText: "Log in here",
                                  onPressed: () {
                                    GoRouter.of(context).pushReplacementNamed(
                                        NamedRoutes.login);
                                  }),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15,
                                  color: Color(0xff00c2e4)),
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
                              "Phone number",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15,
                                  color: Color(0xff00c2e4)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextField(
                              textEditingController: mobileController,
                              hintText: 'Mobile No.'),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15,
                                  color: Color(0xff00c2e4)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: const TextStyle(
                                  color: Color(0xffcccccc),
                                  fontFamily: 'Italian Plate 2'),
                              fillColor: Colors.white,
                              filled: true,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your password";
                              }
                              return null;
                            },
                            maxLines: 1,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Date of birth",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontSize: 15,
                                  color: Color(0xff00c2e4)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(DateFormat('dd-MM-yyyy')
                                      .format(_dateTime)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime.now(),
                                        ).then((value) {
                                          setState(() {
                                            _dateTime = value ?? DateTime.now();
                                          });
                                        });
                                      },
                                      child: const Icon(
                                          Icons.calendar_today_outlined)),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ReusableButton(
                            buttonText: "sign up",
                            colorCode: 0xff00c2e4,
                            customWidth:
                                MediaQuery.of(context).size.width * 0.2,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                firstRegistrationClick(
                                    ref,
                                    context,
                                    fullNameController.text,
                                    mobileController.text,
                                    passwordController.text,
                                    _dateTime);
                              }
                            }),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
