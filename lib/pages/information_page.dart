import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(
            maxWidth: double.infinity, maxHeight: double.infinity),
        child: const Text('资讯页面'));
  }
}
