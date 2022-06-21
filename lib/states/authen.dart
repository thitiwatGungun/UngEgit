import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/widgets/show_form.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitle(),
              formUser(boxConstraints),
              Container(width: boxConstraints.maxWidth*0.6,
              height: 40,
              margin: const EdgeInsets.only(top: 16),
                child: ShowForm(
                  hint: 'password:',
                  iconData: Icons.key,
                  changeFung: (String String) {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 22),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User:',
        iconData: Icons.person_add,
        changeFung: (String string) {},
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'Login :',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.30,
      child: ShowImage(),
    );
  }
}
