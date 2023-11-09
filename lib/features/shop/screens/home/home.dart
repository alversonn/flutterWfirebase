import 'package:flutter/material.dart';
import 'package:kicks/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kicks/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:kicks/common/widgets/texts/section_heading.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:kicks/features/shop/screens/home/widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //searchbar
                  TSearchContainer(text: 'Search in KICKS'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //kategoriii
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace), 
                    child: Column(
                      children: [

                        //heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //kategori
                        THomeCategories()

                  ],
                  ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}


