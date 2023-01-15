import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungtravelthai/states/create_new_account.dart';
import 'package:ungtravelthai/utility/app_constant.dart';
import 'package:ungtravelthai/utility/app_service.dart';
import 'package:ungtravelthai/utility/app_snackbar.dart';
import 'package:ungtravelthai/widgets/widget_button.dart';
import 'package:ungtravelthai/widgets/widget_form.dart';
import 'package:ungtravelthai/widgets/widget_image.dart';
import 'package:ungtravelthai/widgets/widget_text.dart';
import 'package:ungtravelthai/widgets/widget_text_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 32, right: 8, top: 60),
                    child: const WidgetImage(
                      size: 80,
                    ),
                  ),
                  WidgetText(
                    text: 'Ung Travel\nThailand',
                    textStyle: AppConstant().h2Style(
                        size: 28, color: const Color.fromARGB(255, 64, 43, 36)),
                  )
                ],
              ),
              WidgetForm(
                hint: 'User :',
                changeFunc: (p0) {
                  user = p0.trim();
                },
              ),
              WidgetForm(
                hint: 'Password',
                changeFunc: (p0) {
                  password = p0.trim();
                },
              ),
              WidgetButton(
                label: 'Login',
                pressFunc: () {
                  if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                    AppSnackbar().redSnackBar(
                        title: 'Have Space ?',
                        message: 'Please Fill Every Blank');
                  } else {
                    AppService()
                        .processAuthen(user: user!, password: password!);
                  }
                },
              ),
              WidgetTextButton(
                label: 'Create New Account',
                pressFunc: () {
                  Get.to(const CreateNewAccount());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
