import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kicks/common/widgets/login_signup/form_divider.dart';
import 'package:kicks/common/widgets/login_signup/social_button.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/constants/text_strings.dart';
import 'package:kicks/features/authentication/screens/signup/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              //form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              //btn sosmed
              const TSocialButton(), 
              const SizedBox(height: TSizes.spaceBtwSections),

            ],
          ),
        ),
      ),
    );
  }
}

