import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/utils/utils.dart';
import '../common/widgets/custom_text_field.dart';
import '../common/widgets/custom_upload_button.dart';
import '../common/widgets/reusable_button.dart';
import '../common/widgets/text_reusable_button.dart';
import '../route/named_routes.dart';

class FourthRegistrationScreen extends ConsumerStatefulWidget {
  const FourthRegistrationScreen({super.key});

  @override
  ConsumerState<FourthRegistrationScreen> createState() =>
      _FourthRegistrationScreenState();
}

class _FourthRegistrationScreenState
    extends ConsumerState<FourthRegistrationScreen> {
  FilePickerResult? selfieFile;
  FilePickerResult? bankAccount;
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  void _pickSelfieImage() async {
    selfieFile = await pickFile(fileTypes: ["png"]);
  }

  void _pickBankAccount() async {
    bankAccount = await pickFile(fileTypes: ["png"]);
  }

  void handleCompletePress(
      WidgetRef ref,
      BuildContext context,
      FilePickerResult? selfieFile,
      FilePickerResult? bankAccount,
      String pin,
      String confirmPin) {
    if (selfieFile == null) {
      showSnackBar(
          context, "Selfie field is empty! Please Select the proper file!");
      return;
    }
    if (bankAccount == null) {
      showSnackBar(context,
          "Bank account field is empty! Please Select the proper file!");
      return;
    }
    if (pin == confirmPin) {
      ref.read(authControllerProvider.notifier).fourthStepRegistration(
          context: context,
          selfieFile: selfieFile.files.first.path!,
          selfieName: selfieFile.files.first.name,
          bankAccountFile: bankAccount.files.first.path!,
          bankAccountName: bankAccount.files.first.name,
          pin: pin,
          confirmPin: confirmPin);
    } else {
      showSnackBar(context, "Confirm pin doesn't match. Please Enter again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Loader()
          : Padding(
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
                        buttonText: "Upload Selfie",
                        onPressed: _pickSelfieImage,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomUploadButton(
                        buttonText: "Upload Bank Account",
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
                              buttonText: "Complete",
                              onPressed: () {
                                handleCompletePress(
                                    ref,
                                    context,
                                    selfieFile,
                                    bankAccount,
                                    pinController.text,
                                    confirmPinController.text);
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
