import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ungtravelthai/models/message_model.dart';

class AppController extends GetxController {
  RxList<File> files = <File>[].obs;

  RxList<MessageModel> messageModels = <MessageModel>[].obs;

  Future<void> readAllMessage() async {
    if (messageModels.isNotEmpty) {
      messageModels.clear();
    }

    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/getAllMessageUng.php';
    await Dio().get(urlApi).then((value) {
      for (var element in json.decode(value.data)) {
        MessageModel messageModel = MessageModel.fromMap(element);
        messageModels.add(messageModel);
      }
    });
  }
}
