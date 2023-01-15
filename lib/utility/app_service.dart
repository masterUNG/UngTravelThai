// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungtravelthai/models/user_model.dart';
import 'package:ungtravelthai/states/main_home.dart';
import 'package:ungtravelthai/utility/app_controller.dart';
import 'package:ungtravelthai/utility/app_snackbar.dart';

class AppService {
  Future<void> processAuthen(
      {required String user, required String password}) async {
    String urlAPI =
        'https://www.androidthai.in.th/fluttertraining/getUserWhereUserUngTravel.php?isAdd=true&user=$user';
    await dio.Dio().get(urlAPI).then((value) {
      if (value.toString() == 'null') {
        AppSnackbar().redSnackBar(
            title: 'User False?', message: 'ไม่มี $user นี่ใน ฐานข้อมูลของเรา');
      } else {
        for (var element in json.decode(value.data)) {
          UserModel userModel = UserModel.fromMap(element);

          if (password == userModel.password) {
            //password true
            Get.offAll( MainHome(userModel: userModel,));
          } else {
            //password false
            AppSnackbar().redSnackBar(
                title: 'Password False',
                message: 'Please Try Again Password False');
          }
        }
      }
    });
  }

  Future<void> processCreateAccount({required UserModel userModel}) async {
    String urlAPI =
        'https://www.androidthai.in.th/fluttertraining/insertUserUngTravel.php?isAdd=true&name=${userModel.name}&user=${userModel.user}&password=${userModel.password}&avatar=${userModel.avatar}';
    await dio.Dio().get(urlAPI).then((value) {
      Get.back();
    });
  }

  Future<String> processUploadPhoto() async {
    String urlApiSavePhoto =
        'https://www.androidthai.in.th/fluttertraining/saveAvatarUngTravel.php';
    String namePhoto = 'avatar${Random().nextInt(1000)}.jpg';

    AppController appController = Get.put(AppController());

    Map<String, dynamic> map = {};
    map['file'] = await dio.MultipartFile.fromFile(
        appController.files.last.path,
        filename: namePhoto);

    dio.FormData formData = dio.FormData.fromMap(map);
    await dio.Dio()
        .post(urlApiSavePhoto, data: formData)
        .then((value) => print('Uplaod Success'));

    return namePhoto;
  }

  Future<void> processGetPhoto({required ImageSource imageSource}) async {
    AppController appController = Get.put(AppController());

    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (result != null) {
      File file = File(result.path);
      appController.files.add(file);
    }
  }
}
