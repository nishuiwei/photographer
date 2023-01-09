import 'package:flutter/material.dart';
import 'package:photographer/utils/adpat.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        ),
        body: ListView(
          children: [
            Container(
              height: Adapt.px(352),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Adapt.px(80)),
                    bottomRight: Radius.circular(Adapt.px(80))),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: Adapt.px(40),
                    left: Adapt.px(40),
                    right: Adapt.px(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '倾听他的事',
                                    style: TextStyle(
                                        fontSize: Adapt.px(52),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: Adapt.px(12),
                                  ),
                                  Text(
                                    '每个人都有快乐的时候,你呢?',
                                    style: TextStyle(
                                        fontSize: Adapt.px(28),
                                        color: const Color.fromRGBO(
                                            213, 213, 213, 100)),
                                  )
                                ],
                              )),
                          Container(
                            width: Adapt.px(176),
                            height: Adapt.px(176),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: Adapt.px(60),
                                      height: Adapt.px(60),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.black),
                                      child: Icon(Icons.edit,
                                          color: Colors.white,
                                          size: Adapt.px(32)),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Adapt.px(18),
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWrapper(
                            title: '人气',
                            num: 97,
                          ),
                          SizedBox(
                            width: Adapt.px(64),
                          ),
                          const TextWrapper(
                            title: '粉丝',
                            num: 624,
                          ),
                          SizedBox(
                            width: Adapt.px(64),
                          ),
                          const TextWrapper(
                            title: '关注',
                            num: 12,
                          ),
                        ])
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class TextWrapper extends StatelessWidget {
  const TextWrapper({
    Key? key,
    required this.num,
    required this.title,
  }) : super(key: key);
  final int num;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(num.toString(),
            style: TextStyle(
                color: const Color.fromRGBO(16, 16, 16, 1),
                fontSize: Adapt.px(40),
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: Adapt.px(12),
        ),
        Text(title,
            style: TextStyle(
                color: const Color.fromRGBO(213, 213, 213, 1),
                fontSize: Adapt.px(24),
                fontWeight: FontWeight.normal)),
      ],
    );
  }
}
