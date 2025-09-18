import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/constants/constants.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/widgets/typography.dart';

import '../../../core/utils/utils.dart';
import '../../common/custom_text_field.dart';
import '../model/user_data_model.dart';
import '../widgets/additional_account_info.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppText.body1(
                AppLabels.signUpWelcomeText,
                maxLines: 2,
              ),
              Gap(30.h),
              InkWell(
                onTap: () {
                  // context.pushNamed(RouteEnum.forgotPasswordPage.toName);
                },
                child: AppText.body2(
                  AppLabels.forgotPasswordText,
                  color: AppColors.green4,
                ),
              ),
              Gap(20.h),
              const EmailPasswordEnterWidget(),
              AdditionalAccountInfo(
                infoText: AppLabels.loginInfoText,
                linkText: AppLabels.loginLinkText,
                onTapHandler: () {
                  // context.pushReplacementNamed(RouteEnum.signUpPage.toName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailPasswordEnterWidget extends StatefulWidget {
  const EmailPasswordEnterWidget({super.key});

  @override
  State<EmailPasswordEnterWidget> createState() =>
      _EmailPasswordEnterWidgetState();
}

class _EmailPasswordEnterWidgetState extends State<EmailPasswordEnterWidget> {
  final _formKey = GlobalKey<FormState>();

  LoginUserData userData = LoginUserData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: AppLabels.emailInputHint,
            onChanged: (value) {
              setState(() {
                userData.email = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter email";
              }
              if (!Validation.isValidEmail(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomTextField(
            labelText: AppLabels.passwordInputHint,
            isObscured: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                userData.passWord = value;
              });
            },
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
