import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kicks/features/authentication/screens/login/login.dart';
import 'package:kicks/features/authentication/screens/onboarding/onboarding.dart';
import 'package:kicks/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:kicks/utils/exceptions/firebase_exceptions.dart';
import 'package:kicks/utils/exceptions/format_exceptions.dart';
import 'package:kicks/utils/exceptions/platform_exceptions.dart';
import 'package:provider/provider.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //var
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    //lokalStor
    deviceStorage.writeIfNull('IsFirstTime', true);
    //cek aph prtma nyoba app
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());

  }

  ///email auth signin
  ///email auth regist
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Coba lagi!';
    }
  }


  ///

}


