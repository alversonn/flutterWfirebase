import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kicks/common/styles/spacing_styles.dart';
import 'package:kicks/common/widgets/login_signup/form_divider.dart';
import 'package:kicks/common/widgets/login_signup/social_button.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/constants/text_strings.dart';
import 'package:kicks/features/authentication/screens/login/widgets/login_form.dart';
import 'package:kicks/features/authentication/screens/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
            //logo title dan sub
              const TLoginHeader(),

              //formmm
              const TLoginForm(),

              //divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              //footer
              const TSocialButton(),

            ],
          ),
        ),
      ),
    );
  }
}

