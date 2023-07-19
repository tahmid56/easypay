import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/common/widgets/custom_text_field.dart';
import 'package:easypay/common/widgets/custom_upload_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';
import '../route/named_routes.dart';

class ThirdRegistrationScreen extends StatefulWidget {
  const ThirdRegistrationScreen({super.key});

  @override
  State<ThirdRegistrationScreen> createState() =>
      _ThirdRegistrationScreenState();
}

class _ThirdRegistrationScreenState extends State<ThirdRegistrationScreen> {
  String nidFrontFileName = "";
  String nidBackFileName = "";
  String offerLetterFileName = "";
  String bankStatementFileName = "";
  final TextEditingController permanentAddressController =
      TextEditingController();
  final TextEditingController residentialAddressController =
      TextEditingController();
  void _pickNIDFront() async {
    final FilePickerResult? result = await pickFile(fileType: FileType.image);
    if (result != null) {
      nidFrontFileName = result.files.first.name;
    }
  }

  void _pickNIDBack() async {
    final FilePickerResult? result = await pickFile(fileType: FileType.image);
    if (result != null) {
      nidBackFileName = result.files.first.name;
    }
  }

  void _pickJobOfferLetter() async {
    final FilePickerResult? result = await pickFile(fileType: FileType.image);
    if (result != null) {
      offerLetterFileName = result.files.first.name;
    }
  }

  void _pickBankStatement() async {
    final FilePickerResult? result = await pickFile(fileType: FileType.image);
    if (result != null) {
      bankStatementFileName = result.files.first.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/images/gg2.png"),
                ),
                const Spacer(),
                CustomUploadButton(
                  buttonText: "Upload NID Front",
                  onPressed: _pickNIDFront,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomUploadButton(
                  buttonText: "Upload NID Back",
                  onPressed: _pickNIDBack,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    textEditingController: permanentAddressController,
                    hintText: "Permanent Address",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    textEditingController: residentialAddressController,
                    hintText: "Residential Address",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomUploadButton(
                  buttonText: "Upload Job Offer Letter",
                  onPressed: _pickJobOfferLetter,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomUploadButton(
                  buttonText: "Upload Bank Statement of Last 3 months",
                  onPressed: _pickBankStatement,
                ),
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
                          if (nidFrontFileName == "") {
                            showSnackBar(context,
                                "NID Front image is empty! Please Select the proper file!");
                          }
                          if (nidBackFileName == "") {
                            showSnackBar(context,
                                "NID back image is empty! Please Select the proper file!");
                          }
                          if(offerLetterFileName == ""){
                            showSnackBar(context,
                                "Offer Letter image is empty! Please Select the proper file!");
                          }
                          if(bankStatementFileName == "") {
                            showSnackBar(context,
                                "Bank Statement image is empty! Please Select the proper file!");
                          }
                          // GoRouter.of(context)
                          //     .pushNamed(NamedRoutes.registration4);
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
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextReusableButton(
                    buttonText: "Login",
                    onPressed: () {
                      GoRouter.of(context).pushNamed(NamedRoutes.login);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
