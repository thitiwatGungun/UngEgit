// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';
import 'package:ungegat/widgets/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    required String title,
    required String subtitle,
    String? label,
    Function()? PressFunc,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subtitle),
        ),
        actions: [
          PressFunc == null ? ShowTextButton(
              label: 'OK',
              pressFunc: () {
                Navigator.pop(context);
              }): ShowTextButton(label: label!, pressFunc: PressFunc),
        ],
      ),
    );
  }
}
