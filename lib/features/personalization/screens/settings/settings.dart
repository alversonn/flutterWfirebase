import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kicks/common/widgets/appbar/appbar.dart';
import 'package:kicks/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kicks/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:kicks/common/widgets/list_tiles/settingmenutile2.dart';
import 'package:kicks/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:kicks/common/widgets/texts/section_heading.dart';
import 'package:kicks/constants/colors.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/features/personalization/screens/profile/profile.dart';
import 'package:kicks/features/personalization/screens/tugas/bmi/bmi.dart';
import 'package:kicks/features/personalization/screens/tugas/kalkulator/calculator.dart';
import 'package:kicks/features/personalization/screens/tugas/suhu/suhu.dart';
import 'package:kicks/features/personalization/screens/tugas/uang/uang.dart';

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
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],

              ),
            ),
            //body

             Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //akun setting
                  const TSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set Shopping Delivery Address'),
                  const TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
                  const TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders'),
                  const TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  const TSettingsMenuTile(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  //tugas/appsetting
                  ///kalkulator
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Mobile Programming Required', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile2(
                    icon: Icons.calculate, // Menggunakan TImages.kalkulator sebagai ikon
                    title: 'Kalkulator',
                    subTitle: 'Perhitungan',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const KalkulatorIP()));
                    },
                  ),

                  ///suhu
                  TSettingsMenuTile2(
                    icon: Icons.calculate, // Menggunakan TImages.kalkulator sebagai ikon
                    title: 'Suhu',
                    subTitle: 'Converter Suhu',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Suhu()));
                    },
                  ),
                  
                  ///bmi
                  TSettingsMenuTile2(
                    icon: Icons.calculate, // Menggunakan TImages.kalkulator sebagai ikon
                    title: 'BMI',
                    subTitle: 'Body Mass Index',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BMI()));
                    },
                  ),
                  
                  ///uang
                  TSettingsMenuTile2(
                    icon: Icons.money, // Menggunakan TImages.kalkulator sebagai ikon
                    title: 'Money Converter',
                    subTitle: 'money converter',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Uang()));
                    },
                  ),


                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
