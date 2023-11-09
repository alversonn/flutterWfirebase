import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kicks/common/widgets/appbar/appbar.dart';
import 'package:kicks/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kicks/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:kicks/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:kicks/common/widgets/texts/section_heading.dart';
import 'package:kicks/constants/colors.dart';
import 'package:kicks/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppbar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                  

                  //user profile
                  const TUserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],

              ),
            ),
            //body

            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //akun setting
                  TSectionHeading(title: 'Account Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set Shopping Delivery Address'),
                  ///kalkulator
                  ///bmi
                  ///suhu
                  ///uang
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}


