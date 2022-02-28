import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photographer/utils/adpat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  SvgPicture favourite = SvgPicture.asset(
    "assets/images/goBack.svg",
    width: Adapt.px(24.0),
    height: Adapt.px(24.0),
  );
  SvgPicture enterIcon = SvgPicture.asset(
    "assets/images/message/enter.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: Adapt.px(20)),
            child: favourite,
          ),
          onTap: () => {Navigator.of(context).pop()},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Adapt.px(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: Adapt.px(20)),
                  child: Text('与太酷不给撩聊天中',
                      style: TextStyle(
                        fontSize: Adapt.px(40),
                        fontWeight: FontWeight.bold,
                      ))),
              SizedBox(
                height: Adapt.px(60),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: 30,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index % 2 == 0
                          ? const leftChatContainer()
                          : const rightChatContainer();
                    }),
              ),
              Container(
                  height: Adapt.px(4),
                  color: const Color.fromRGBO(230, 230, 230, 100)),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Adapt.px(16), horizontal: Adapt.px(40)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: Adapt.px(26),
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(16, 16, 16, 100)),
                        decoration: InputDecoration(
                          hintText: '请输入聊天内容',
                          hintStyle: TextStyle(
                              fontSize: Adapt.px(26),
                              color: const Color.fromRGBO(16, 16, 16, 1),
                              fontWeight: FontWeight.bold),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(16, 16, 16, 100), //边线颜色为白色
                              width: 2, //边线宽度为2
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(16, 16, 16, 1),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 25),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Adapt.px(20)),
                      child: enterIcon,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class leftChatContainer extends StatelessWidget {
  const leftChatContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Adapt.px(66)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    //设置 child 居中
                    height: Adapt.px(100),
                    width: Adapt.px(100),
                    margin: EdgeInsets.only(right: Adapt.px(30)),
                    //边框设置
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                          width: 3.0,
                          color: const Color.fromRGBO(16, 16, 16, 1)),
                    ),
                    child: const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            ExactAssetImage('assets/images/avatar.jpeg'))),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        constraints: BoxConstraints(maxHeight: Adapt.px(420)),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(Adapt.px(15))),
                            border: Border.all(width: 1, color: Colors.black)),
                        // width: Adapt.px(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'nihaonihaoniha',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ]),
          Container(
            margin: EdgeInsets.only(left: Adapt.px(132)),
            child: Text(
              '2020-04-18 14:21',
              style: TextStyle(
                  color: const Color.fromRGBO(213, 213, 213, 1),
                  fontSize: Adapt.px(20)),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class rightChatContainer extends StatelessWidget {
  const rightChatContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Adapt.px(66)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        constraints: BoxConstraints(maxHeight: Adapt.px(420)),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(Adapt.px(15))),
                            border: Border.all(width: 1, color: Colors.black)),
                        // width: Adapt.px(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'nihaonihaoniha',
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                Container(
                    //设置 child 居中
                    height: Adapt.px(100),
                    width: Adapt.px(100),
                    margin: EdgeInsets.only(left: Adapt.px(30)),
                    //边框设置
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                          width: 3.0,
                          color: const Color.fromRGBO(16, 16, 16, 1)),
                    ),
                    child: const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            ExactAssetImage('assets/images/avatar.jpeg'))),
              ]),
          Container(
            margin: EdgeInsets.only(right: Adapt.px(132)),
            child: Text(
              '2020-04-18 14:21',
              style: TextStyle(color: Colors.grey[100], fontSize: Adapt.px(20)),
            ),
          ),
        ],
      ),
    );
  }
}
