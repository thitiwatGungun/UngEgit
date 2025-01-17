// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungegat/models/user_medel.dart';
import 'package:ungegat/states/my_service.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/utility/my_dialog.dart';
import 'package:ungegat/widgets/show_button.dart';
import 'package:ungegat/widgets/show_form.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Container(
            decoration: MyConstant().bgbox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints),
                  newTitle(boxConstraints),
                  formUser(boxConstraints),
                  formPassword(boxConstraints),
                  button_Login(boxConstraints),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container button_Login(BoxConstraints boxConstraints) {
    return Container(
      width: boxConstraints.maxWidth * 0.6,
      margin: const EdgeInsets.only(top: 16),
      child: ShowButton(
        lebel: 'Login',
        pressFunc: () {
          print('user = $user,password = $password');

          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('Have Space');
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', subtitle: 'Please Fill Every Blank');
          } else {
            print('No Space');
            processCheckLogin();
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'password',
        iconData: Icons.key,
        changeFung: (String String) {
          password = String.trim();
        },
      ),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 22),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User',
        iconData: Icons.person_add,
        changeFung: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  SizedBox newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'Login :',
            textStyle: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          SizedBox(
            width: boxConstraints.maxWidth * 0.30,
            child: ShowImage(),
          ),
        ],
      ),
    );
  }

  Future<void> processCheckLogin() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereUserKYI.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) {
      print('value ==> $value');

      if (value.toString() == 'null') {
        MyDialog(context: context).normalDialog(
            title: 'User False', subtitle: 'No $user in my Database');
      } else {
        var result = json.decode(value.data);

        print('result ==> $result');
        for (var element in result) {
          UserModel userModel = UserModel.fromMap(element);
          if (password == userModel.password) {
            MyDialog(context: context).normalDialog(
                label: 'Go To Service',
                PressFunc: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();

                  var data = <String>[];
                  data.add(userModel.id);
                  data.add(userModel.name);
                  data.add(userModel.position);

                  preferences.setStringList('data', data).then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyService(),
                        ),
                        (route) => false);
                  });
                },
                title: 'Welcome to App',
                subtitle: 'Login Success Welcome ${userModel.name}');
          } else {
            MyDialog(context: context).normalDialog(
                title: 'Password False', subtitle: 'Please Try Again');
          }
        }
      }
    });
  }
}
