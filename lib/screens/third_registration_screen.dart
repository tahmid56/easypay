import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/common/widgets/custom_text_field.dart';
import 'package:easypay/common/widgets/custom_upload_button.dart';
import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/constants/theme.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';
import '../route/named_routes.dart';

class ThirdRegistrationScreen extends ConsumerStatefulWidget {
  const ThirdRegistrationScreen({super.key});

  @override
  ConsumerState<ThirdRegistrationScreen> createState() =>
      _ThirdRegistrationScreenState();
}

class _ThirdRegistrationScreenState
    extends ConsumerState<ThirdRegistrationScreen> {
  // FilePickerResult? nidFrontFilePath;
  // FilePickerResult? nidBackFilePath;
  // FilePickerResult? offerLetterFilePath;
  // FilePickerResult? bankStatementFilePath;
  final TextEditingController cardController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  DateTime _expireDate = DateTime.now();
  String cardType = "MASTERCARD";
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Future<void> _pickNIDFront() async {
  //   nidFrontFilePath = await pickFile(fileTypes: ["png"]);
  // }

  // Future<void> _pickNIDBack() async {
  //   nidBackFilePath = await pickFile(fileTypes: ["png"]);
  // }

  // Future<void> _pickJobOfferLetter() async {
  //   offerLetterFilePath = await pickFile(fileTypes: ["png"]);
  // }

  // Future<void> _pickBankStatement() async {
  //   bankStatementFilePath = await pickFile(fileTypes: ["png"]);
  // }

  void onNextClick(
    WidgetRef ref,
    BuildContext context,
    String cardNumber,
    String cvv,
    String street,
    DateTime expireDate,
    String city,
    String postalCode,
    String cardType,
  ) {
    // if (_formKey.currentState!.validate()) {
    // if (nidFrontFilePath == null) {
    //   showSnackBar(
    //       context, "NID Front image is empty! Please Select the proper file!");
    //   return;
    // }
    // if (nidBackFilePath == null) {
    //   showSnackBar(
    //       context, "NID back image is empty! Please Select the proper file!");
    //   return;
    // }
    // if (offerLetterFilePath == null) {
    //   showSnackBar(context,
    //       "Offer Letter image is empty! Please Select the proper file!");
    //   return;
    // }
    // if (bankStatementFilePath == null) {
    //   showSnackBar(context,
    //       "Bank Statement image is empty! Please Select the proper file!");
    //   return;
    // }
    // GoRouter.of(context)
    //     .pushNamed(NamedRoutes.registration4);
    // }
    if (_formKey.currentState!.validate()) {
      //   ref.read(authControllerProvider.notifier).thirdStepRegistration(
      //       context: context,
      //       nidFrontFile: nidFrontFilePath!.files.first.path!,
      //       nidFrontName: nidFrontFilePath?.files.first.name,
      //       nidBackFile: nidBackFilePath!.files.first.path!,
      //       nidBackName: nidBackFilePath?.files.first.name,
      //       permanentAddress: permanentAddress,
      //       residentialAddress: residentAddress,
      //       jobOfferFile: offerLetterFilePath!.files.first.path!,
      //       jobOfferName: offerLetterFilePath?.files.first.name,
      //       bankStatement: bankStatementFilePath!.files.first.path!,
      //       bankStateName: bankStatementFilePath?.files.first.name);
      ref.read(authControllerProvider.notifier).thirdStepRegistration(
          context: context,
          cardNumber: cardNumber,
          expireDate: expireDate,
          cvv: cvv,
          street: street,
          city: city,
          postalCode: postalCode,
          cardType: cardType);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add",
                              style: TextStyle(
                                fontSize: 38,
                                fontFamily: CustomTheme.fontFamily,
                                color: CustomTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment",
                              style: TextStyle(
                                fontSize: 38,
                                fontFamily: CustomTheme.fontFamily,
                                color: CustomTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Method",
                              style: TextStyle(
                                fontSize: 38,
                                fontFamily: CustomTheme.fontFamily,
                                color: CustomTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please enter your 16 digit card number",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: CustomTheme.fontFamily,
                                color: CustomTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: CustomTheme.fontFamily,
                                color: CustomTheme.secondaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: CustomTextField(
                                  textEditingController: cardController,
                                  hintText: "",
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        hint: Text(cardType),
                                        isExpanded: true,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        items: ["MASTERCARD", "VISA"]
                                            .map((String value) {
                                          return DropdownMenuItem(
                                            value: value.toString(),
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          cardType = value.toString();
                                          setState(() {});
                                        }),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3),
                                      child: Text(
                                        "Expiry Date",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: CustomTheme.fontFamily,
                                          color: CustomTheme.secondaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                _expireDate,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: InkWell(
                                              onTap: () {
                                                showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2100),
                                                ).then((value) {
                                                  setState(() {
                                                    _expireDate =
                                                        value ?? DateTime.now();
                                                  });
                                                });
                                              },
                                              child: const Icon(
                                                Icons.calendar_today_outlined,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        "CVV",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: CustomTheme.fontFamily,
                                          color: CustomTheme.secondaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomTextField(
                                          textEditingController: cvvController,
                                          hintText: "cvv"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Address",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: CustomTheme.fontFamily,
                                  color: CustomTheme.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CustomTextField(
                                textEditingController: streetController,
                                hintText: "Street"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: CustomTextField(
                                  textEditingController: cityController,
                                  hintText: "City",
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: CustomTextField(
                                  textEditingController: postalCodeController,
                                  hintText: "Postal Code",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ReusableButton(
                              buttonText: "Done",
                              customWidth:
                                  MediaQuery.of(context).size.width * 0.2,
                              onPressed: () {
                                onNextClick(
                                    ref,
                                    context,
                                    cardController.text,
                                    cvvController.text,
                                    streetController.text,
                                    _expireDate,
                                    cityController.text,
                                    postalCodeController.text,
                                    cardType);
                              }),
                          const Spacer(),
                          const Text("Not registered as a User?",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          TextReusableButton(
                              buttonText: "Login",
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(NamedRoutes.login);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
