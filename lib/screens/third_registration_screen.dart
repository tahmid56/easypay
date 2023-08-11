

import 'package:easypay/common/utils/utils.dart';
import 'package:easypay/common/widgets/custom_text_field.dart';
import 'package:easypay/common/widgets/custom_upload_button.dart';
import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/controllers/auth_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  FilePickerResult? nidFrontFilePath;
  FilePickerResult? nidBackFilePath;
  FilePickerResult? offerLetterFilePath;
  FilePickerResult? bankStatementFilePath;
  final TextEditingController permanentAddressController =
      TextEditingController();
  final TextEditingController residentialAddressController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickNIDFront() async {
    nidFrontFilePath = await pickFile(fileTypes: ["png"]);
    
  }

  Future<void> _pickNIDBack() async {
    nidBackFilePath = await pickFile(fileTypes: ["png"]);
  }

  Future<void> _pickJobOfferLetter() async {
    offerLetterFilePath = await pickFile(fileTypes: ["png"]);
  }

  Future<void> _pickBankStatement() async {
    bankStatementFilePath = await pickFile(fileTypes: ["png"]);
  }

  void onNextClick(
      WidgetRef ref,
      BuildContext context,
      FilePickerResult? nidFrontPath,
      FilePickerResult? nidBackPath,
      String permanentAddress,
      String residentAddress,
      FilePickerResult? offerLetterPath,
      FilePickerResult? bankStatementPath) {
    // if (_formKey.currentState!.validate()) {
    if (nidFrontFilePath == null) {
      showSnackBar(
          context, "NID Front image is empty! Please Select the proper file!");
      return;
    }
    if (nidBackFilePath == null) {
      showSnackBar(
          context, "NID back image is empty! Please Select the proper file!");
      return;
    }
    if (offerLetterFilePath == null) {
      showSnackBar(context,
          "Offer Letter image is empty! Please Select the proper file!");
      return;
    }
    if (bankStatementFilePath == null) {
      showSnackBar(context,
          "Bank Statement image is empty! Please Select the proper file!");
      return;
    }
    // GoRouter.of(context)
    //     .pushNamed(NamedRoutes.registration4);
    // }
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).thirdStepRegistration(
          context: context,
          nidFrontFile: nidFrontFilePath!.files.first.path!,
          nidFrontName: nidFrontFilePath?.files.first.name,
          nidBackFile: nidBackFilePath!.files.first.path!,
          nidBackName: nidBackFilePath?.files.first.name,
          permanentAddress: permanentAddress,
          residentialAddress: residentAddress,
          jobOfferFile: offerLetterFilePath!.files.first.path!,
          jobOfferName: offerLetterFilePath?.files.first.name,
          bankStatement: bankStatementFilePath!.files.first.path!,
          bankStateName: bankStatementFilePath?.files.first.name);
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset("assets/images/logo4.png"),
                        ),
                        const Spacer(),
                        CustomUploadButton(
                          buttonText: nidFrontFilePath?.files.first.name ??
                              "Upload NID Front",
                          onPressed: () {
                            _pickNIDFront().then((_)=> setState((){}));
                          },
                          
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomUploadButton(
                          buttonText: nidBackFilePath?.files.first.name ??
                              "Upload NID Back",
                          onPressed: () {
                            _pickNIDBack().then((_) => setState(() {}));
                            
                          },
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
                          buttonText: offerLetterFilePath?.files.first.name ??
                              "Upload Job Offer Letter",
                          onPressed: () {
                            _pickJobOfferLetter().then((_) => setState(() {}));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomUploadButton(
                          buttonText: bankStatementFilePath?.files.first.name ??
                              "Upload Bank Statement of Last 3 months",
                          onPressed: () {
                            _pickBankStatement().then((_) => setState(() {}));
                            
                          },
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
                                  onNextClick(
                                      ref,
                                      context,
                                      nidFrontFilePath,
                                      nidBackFilePath,
                                      permanentAddressController.text,
                                      residentialAddressController.text,
                                      offerLetterFilePath,
                                      bankStatementFilePath);
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
            ),
    );
  }
}
