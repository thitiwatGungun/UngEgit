// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_const
import 'package:flutter/material.dart';

import 'package:ungegat/models/job_model.dart';
import 'package:ungegat/utility/my_constant.dart';
import 'package:ungegat/utility/my_dialog.dart';
import 'package:ungegat/widgets/show_icon_button.dart';
import 'package:ungegat/widgets/show_image.dart';
import 'package:ungegat/widgets/show_text.dart';

class Detail extends StatefulWidget {
  final JobModel jobModel;
  const Detail({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  JobModel? jobModel;

  @override
  void initState() {
    super.initState();

    jobModel = widget.jobModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
          title: ShowText(
            text: jobModel!.job,
            textStyle: MyConstant().h2Style(),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 238, 6, 6),
          foregroundColor: MyConstant.dark),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            children: [
              newImage(boxConstraints),
            ],
          ),
        );
      }),
    );
  }

  Container newImage(
    BoxConstraints boxConstraints,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        top: 36,
        bottom: 16,
      ),
      width: boxConstraints.maxWidth * 0.6,
      child: Stack(
        children: [
          const Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: ShowImage(
              Path: 'images/image.png',
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ShowIconButton(
              iconData: Icons.add_a_photo,
              pressFunc: () {
                MyDialog(context: context).normalDialog(
                  label: 'Camera',
                  label2: 'Gallery',
                  PressFunc: () {},
                  PressFunc2: () {},
                  title: 'Source Image',
                  subtitle: 'Please Tab Camera or Gallery',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
