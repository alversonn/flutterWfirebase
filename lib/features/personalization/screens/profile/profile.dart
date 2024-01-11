import 'package:flutter/material.dart';
import 'package:kicks/common/widgets/appbar/appbar.dart';
import 'package:kicks/common/widgets/images/t_circular_image.dart';
import 'package:kicks/common/widgets/texts/section_heading.dart';
import 'package:kicks/constants/imge_strings.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/features/personalization/screens/profile/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Profile')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //pp
              SizedBox(
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              //details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //heading prof inpo
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: 'Alif Abdul Hakim', onPressed: (){}),
              TProfileMenu(title: 'Username', value: 'Aliff', onPressed: (){}),


              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              
              //heading persnal inpo
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              
              TProfileMenu(title: 'Institute', value: 'Institut Teknologi Nasional', onPressed: (){}),
              TProfileMenu(title: 'Major', value: 'Informatika', onPressed: (){}),
              TProfileMenu(title: 'NRP', value: '152021171', onPressed: (){}),
              TProfileMenu(title: 'Email', value: 'alif.abdul@mhs.itenas.ac.id', onPressed: (){}),


            ],
          ),),
      ),
        
    );
    

  }
}
