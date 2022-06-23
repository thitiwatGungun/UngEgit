// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String? Path;
  const ShowImage({
    Key? key,
    this.Path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(Path ?? 'images/Logo2.png');
  }
}
