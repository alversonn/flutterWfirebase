import 'package:flutter/material.dart';
import 'package:kicks/constants/colors.dart';
import 'package:kicks/constants/sizes.dart';
import 'package:kicks/device/device_utility.dart';
import 'package:kicks/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:kicks/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController, 
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light: TColors.dark, dotHeight: 6),
      ),
    );
  }
}
