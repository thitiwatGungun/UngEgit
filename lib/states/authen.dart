import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
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
        pressFunc: () {},
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
        changeFung: (String String) {},
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
        changeFung: (String string) {},
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
}
