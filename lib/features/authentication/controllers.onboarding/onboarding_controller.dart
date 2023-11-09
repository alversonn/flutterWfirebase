import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kicks/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  //variabell
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //ngeupdate current indeks ketika d scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump ke spesifik dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current indeks & jump ke next page
  void nextPage() {
    if(currentPageIndex.value == 2){
     Get.offAll(const LoginScreen());
    } else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }


  //update current indeks & jump ke last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}