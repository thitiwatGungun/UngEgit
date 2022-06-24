// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungegat/models/job_model.dart';
import 'package:ungegat/widgets/show_progess.dart';

import 'package:ungegat/widgets/show_text.dart';

class FinishJob extends StatefulWidget {
  final String idOfficer;
  const FinishJob({
    Key? key,
    required this.idOfficer,
  }) : super(key: key);

  @override
  State<FinishJob> createState() => _FinishJobState();
}

class _FinishJobState extends State<FinishJob> {
  var jobmodels = <JobModel>[];

  bool load = true;
  bool? haveData;

  @override
  void initState() {
    super.initState();

    readData();
  }

  Future<void> readData() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereidOfficeSuccessKYI.php?isAdd=true&idOfficer=${widget.idOfficer}';

    await Dio().get(path).then((value) {
      print('value readData ==> $value');

      if (value.toString() == 'null') {
        haveData = false;
      } else {
        haveData = true;

        for (var element in json.decode(value.data)) {
          JobModel jobModel = JobModel.fromMap(element);
          jobmodels.add(jobModel);
        }
      }

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const ShowProgess()
        : haveData!
            ? GridView.builder(
                itemCount: jobmodels.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) => Card(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              jobmodels [index].pathImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ShowText(text: jobmodels[index].job),
                        ],
                      ),
                    ))
            : const Center(
                child: ShowText(text: 'No Data'),
              );
  }
}
