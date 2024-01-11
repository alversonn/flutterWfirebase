import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kicks/constants/imge_strings.dart';
import 'package:kicks/data/repositories.auth/authentication_repository.dart';
import 'package:kicks/data/repositories.auth/user_repository.dart';
import 'package:kicks/features/personalization/models/user_model.dart';
import 'package:kicks/utils/network/network_manager.dart';
import 'package:kicks/utils/popups/full_screen_loader.dart';
import 'package:kicks/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //var
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///signup
  void signup() async {
    try {
      //loding
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.onBoardingImage1);

      //tes inet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      

      //palidasi
      if(!signupFormKey.currentState!.validate()) return;
      

      ///privacy cek
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Order to create acc, baca dan setujui',
        );
        return;
      }

      ///register user di firebase auth & simpan data user di firebasee
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      ///simpan auth data user di fitrebse firestore
      final newUser = UserModel(
        id: userCredential.user!.uid, 
        firstName: firstName.text.trim(), 
        lastName: lastName.text.trim(), 
        username: username.text.trim(), 
        email: email.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        profilePicture: '',
      );


      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      ///show pesan berhasil
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your acc sudah kebuat, segera verif email');
    
      ///pindah ke verif email screen
      //Get.to(() => const VerifyEmailScreen());
      
    } catch(e) {
      //erro
      TLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    } finally {
      //remove loader
      TFullScreenLoader.stopLoading();
    }
  }
} 