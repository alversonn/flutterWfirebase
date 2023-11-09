import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kicks/constants/imge_strings.dart';
import 'package:kicks/constants/text_strings.dart';
import 'package:kicks/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:kicks/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:kicks/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:kicks/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:kicks/features/authentication/screens/widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //horizontalz scroll
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1, 
                title: TTexts.onBoardingTitle1, 
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2, 
                title: TTexts.onBoardingTitle2, 
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3, 
                title: TTexts.onBoardingTitle3, 
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
        
          //skip buttonn
          const OnBoardingSkip(),

          //titik" nafigasi smoothpageIndikator
          const OnBoardingDotNavigation(),

          //button bulet
          const OnBoardingNextButton(),




        ],
      ),
    );
  }
}




