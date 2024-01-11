import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kicks/app.dart';
import 'package:kicks/data/repositories.auth/authentication_repository.dart';
import 'package:kicks/firebase_options.dart';


Future<void> main() async {


  await GetStorage.init();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
       (FirebaseApp value) => Get.put(AuthenticationRepository()),
    );

  runApp(const App());
}

