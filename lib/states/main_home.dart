// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ungtravelthai/models/user_model.dart';
import 'package:ungtravelthai/utility/app_constant.dart';
import 'package:ungtravelthai/utility/app_controller.dart';
import 'package:ungtravelthai/utility/app_snackbar.dart';
import 'package:ungtravelthai/widgets/widget_form.dart';
import 'package:ungtravelthai/widgets/widget_icon_button.dart';
import 'package:ungtravelthai/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String? message;

  AppController controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    controller.readAllMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      appBar: AppBar(
        title: const WidgetText(text: 'Main Home'),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GetX(
            init: AppController(),
            builder: (AppController appController) {
              print(
                  '####### ขนาดของ message --> ${appController.messageModels.length}');
              return SizedBox(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxHeight,
                child: Stack(
                  children: [
                    appController.messageModels.isEmpty
                        ? const SizedBox()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: appController.messageModels.length,
                            itemBuilder: (context, index) => Row(
                              children: [
                                Container(margin: const EdgeInsets.only(left: 16,right: 8,top: 8),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(appController
                                        .messageModels[index].avatar),
                                  ),
                                ),
                                WidgetText(
                                    text: appController
                                        .messageModels[index].message),
                              ],
                            ),
                          ),
                    Positioned(
                      bottom: 8,
                      child: SizedBox(
                        width: boxConstraints.maxWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetForm(
                              hint: 'Message',
                              changeFunc: (p0) {
                                message = p0.trim();
                              },
                              top: 0,
                            ),
                            WidgertIconButton(
                              iconData: Icons.send,
                              pressFunc: () async {
                                if (message?.isEmpty ?? true) {
                                  AppSnackbar().redSnackBar(
                                      title: 'No Message ?',
                                      message: 'Please Fill Message');
                                } else {
                                  String urlApi =
                                      'https://www.androidthai.in.th/fluttertraining/insertMessageUng.php?isAdd=true&avatar=${widget.userModel.avatar}&name=${widget.userModel.name}&message=$message';
                                  await Dio().get(urlApi).then((value) {
                                    print('insert Message Success');
                                    appController.readAllMessage();
                                  });
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
