import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/constants/text_strings.dart';
import 'package:kicks/features/authentication/controllers/signup/controllers_signup.dart';
import 'package:kicks/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:kicks/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
    const TSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => TValidator.validateEmptyText('First name', value),
                expands: false, 
                decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyText('Last name', value),

                expands: false, 
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user)
                ),
              ),
            ),
            
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),


        //username
        TextFormField(
                validator: (value) => TValidator.validateEmptyText('Username', value),

                controller: controller.username,
                expands: false, 
                decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)
                ),
              ),

        ///email
        TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                expands: false, 
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct)
                ),
              ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        
        ///no hp
        TextFormField(
                validator: (value) => TValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                expands: false, 
                decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call)
                ),
              ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        ///pass
        Obx(
          () => TextFormField(
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                   
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      ),
                  ),
                ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///terms boks
        const TTermsAndConditionCheckBox(),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///signup btn
        SizedBox(
          width: double.infinity, 
          child: ElevatedButton(
            onPressed: () => controller.signup(), 
            child: const Text(TTexts.createAccount)),)
      ],
    ),
    );
  }
}

