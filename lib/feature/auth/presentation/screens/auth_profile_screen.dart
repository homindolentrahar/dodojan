import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:dodojan/core/presentation/widgets/app_buttons.dart';
import 'package:dodojan/core/presentation/widgets/app_fields.dart';
import 'package:dodojan/core/presentation/widgets/app_sheets.dart';
import 'package:dodojan/core/presentation/widgets/app_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AuthProfileScreen extends StatefulWidget {
  const AuthProfileScreen({Key? key}) : super(key: key);

  @override
  _AuthProfileScreenState createState() => _AuthProfileScreenState();
}

class _AuthProfileScreenState extends State<AuthProfileScreen> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();

    super.initState();
  }

  void _validateAndSubmit() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Profil User",
                          style: Get.textTheme.headline4,
                        ),
                        ProceedButton(
                          onPressed: () {},
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 32),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: AppColor.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: -14,
                              child: MaterialButton(
                                elevation: 0,
                                highlightElevation: 0,
                                focusElevation: 0,
                                minWidth: 0,
                                height: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                color: Get.theme.primaryColor,
                                splashColor: AppColor.black.withOpacity(0.15),
                                highlightColor: AppColor.black.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(360),
                                  side: const BorderSide(
                                    color: AppColor.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Text(
                                  "Ubah",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onPressed: () {
                                  Get.bottomSheet(
                                    ImagePickerSheet(
                                      pickImage: () {},
                                      capturePhoto: () {},
                                      onSaved: () {},
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: UnderlineTextField(
                            name: "name",
                            hint: "Nama anda",
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 32),
                    const SizedBox(height: 32),
                    FieldTile(
                      title: "Email",
                      subtitle: "Alamat Email anda",
                      onPressed: () {
                        Get.bottomSheet(
                          FieldSheet(
                            keyboardType: TextInputType.emailAddress,
                            hint: "Alamat Email anda",
                            name: "email",
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.email(context),
                            ]),
                            onChanged: (value) {},
                            onSaved: () {
                              //  Save the email input
                            },
                          ),
                        );
                      },
                    ),
                    FieldTile(
                      title: "Nomor Handphone",
                      subtitle: "Nomor Handphone anda",
                      onPressed: () {
                        Get.bottomSheet(
                          FieldSheet(
                            keyboardType: TextInputType.phone,
                            hint: "Nomor Handphone anda",
                            name: "phone",
                            validators: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.minLength(context, 11),
                            ]),
                            onChanged: (value) {},
                            onSaved: () {
                              //  Save the phone input
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              PrimaryButton(
                text: "Simpan",
                onPressed: () {
                  _validateAndSubmit();
                },
              ).marginSymmetric(horizontal: 32),
            ],
          ),
        ),
      ),
    );
  }
}
