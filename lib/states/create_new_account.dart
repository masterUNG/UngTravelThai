import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungtravelthai/models/user_model.dart';
import 'package:ungtravelthai/utility/app_constant.dart';
import 'package:ungtravelthai/utility/app_controller.dart';
import 'package:ungtravelthai/utility/app_service.dart';
import 'package:ungtravelthai/utility/app_snackbar.dart';
import 'package:ungtravelthai/widgets/widget_button.dart';
import 'package:ungtravelthai/widgets/widget_form.dart';
import 'package:ungtravelthai/widgets/widget_icon_button.dart';
import 'package:ungtravelthai/widgets/widget_image.dart';
import 'package:ungtravelthai/widgets/widget_image_file.dart';
import 'package:ungtravelthai/widgets/widget_text.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String? name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      appBar: AppBar(
        title: const WidgetText(text: 'Create New Account'),
      ),
      body: GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('files ===> ${appController.files}');
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: 250,
                      height: 250,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          appController.files.isEmpty
                              ? const WidgetImage(
                                  path: 'images/account.png',
                                )
                              : WidgetImageFile(file: appController.files.last),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: WidgertIconButton(
                              iconData: Icons.add_a_photo,
                              pressFunc: () {
                                AppService().processGetPhoto(
                                    imageSource: ImageSource.camera);
                              },
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: WidgertIconButton(
                              iconData: Icons.add_photo_alternate,
                              pressFunc: () {
                                AppService().processGetPhoto(
                                    imageSource: ImageSource.gallery);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetForm(
                      hint: 'Display Name :',
                      changeFunc: (p0) {
                        name = p0.trim();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetForm(
                      hint: 'User :',
                      changeFunc: (p0) {
                        user = p0.trim();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetForm(
                      hint: 'Password :',
                      changeFunc: (p0) {
                        password = p0.trim();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetButton(
                      label: 'Create New Account',
                      pressFunc: () async {
                        if (appController.files.isEmpty) {
                          AppSnackbar().redSnackBar(
                              title: 'ไม่มีรูปภาพ',
                              message: 'กรุณา ถ่ายรูปด้วย คะ');
                        } else if ((name?.isEmpty ?? true) ||
                            (user?.isEmpty ?? true) ||
                            (password?.isEmpty ?? true)) {
                          AppSnackbar().redSnackBar(
                              title: 'มีช่องว่าง ?',
                              message: 'กรุณากรอก ข้อมูลให้ครบ ด้วยคะ');
                        } else {
                          //1 Check User
                          String urlApiCheckUser =
                              'https://www.androidthai.in.th/fluttertraining/getUserWhereUserUngTravel.php?isAdd=true&user=$user';
                          await Dio().get(urlApiCheckUser).then((value) async {
                            print('value --> $value');

                            if (value.toString() == 'null') {
                              // User True
                              String urlAvatar =
                                  await AppService().processUploadPhoto();
                              urlAvatar =
                                  'https://www.androidthai.in.th/fluttertraining/ung/$urlAvatar';
                              print('urlAvatar --> $urlAvatar');

                              UserModel userModel = UserModel(
                                  name: name!,
                                  user: user!,
                                  password: password!,
                                  avatar: urlAvatar);

                              AppService()
                                  .processCreateAccount(userModel: userModel);
                            } else {
                              // User False
                              AppSnackbar().redSnackBar(
                                  title: 'User False ?',
                                  message:
                                      'มี $user ในฐานข้อมูล อยู่แล้ว เปลี่ยน user ใหม่');
                            }
                          });
                        }
                      },
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
