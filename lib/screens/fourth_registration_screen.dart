import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/utils/utils.dart';
import '../common/widgets/custom_text_field.dart';
import '../common/widgets/custom_upload_button.dart';
import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';
import '../route/named_routes.dart';

class FourthRegistrationScreen extends StatefulWidget {
  const FourthRegistrationScreen({super.key});

  @override
  State<FourthRegistrationScreen> createState() =>
      _FourthRegistrationScreenState();
}

class _FourthRegistrationScreenState extends State<FourthRegistrationScreen> {
  String selfieFileName = "";
  String bankAccountName = "";
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  void _pickSelfieImage() async {
    final FilePickerResult? result = await pickFile(fileTypes: ["png"]);
    if (result != null) {
      selfieFileName = result.files.first.name;
    }
  }

  void _pickBankAccount() async {
    final FilePickerResult? result = await pickFile(fileTypes: ["png"]);
    if (result != null) {
      bankAccountName = result.files.first.name;
    }
  }

  void handleCompletePress() {
    if (selfieFileName == "") {
      showSnackBar(
          context, "Selfie field is empty! Please Select the proper file!");
    }
    if (bankAccountName == "") {
      showSnackBar(context,
          "Bank account field is empty! Please Select the proper file!");
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
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/images/gg2.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomUploadButton(
                  buttonText: "Upload NID Front",
                  onPressed: _pickSelfieImage,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomUploadButton(
                  buttonText: "Upload NID Back",
                  onPressed: _pickBankAccount,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    textEditingController: pinController,
                    hintText: "Account Pin",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    textEditingController: confirmPinController,
                    hintText: "Account Pin Again",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ReusableButton(
                        buttonText: "Complete", onPressed: handleCompletePress),
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
