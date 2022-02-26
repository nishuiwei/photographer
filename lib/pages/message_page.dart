// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photographer/pages/chat_page.dart';
import 'package:photographer/utils/adpat.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // final _scrollController = ScrollController();

  SvgPicture deleteIcon = SvgPicture.asset(
    "assets/images/message/delIcon.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '消息通知',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: const Color.fromRGBO(16, 16, 16, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: Adapt.px(48)),
              ),
              deleteIcon
            ],
          ),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(
                Adapt.px(40), Adapt.px(60), Adapt.px(40), Adapt.px(60)),
            child: Column(
              children: [
                RowByTextWrapper(),
                SizedBox(
                  height: Adapt.px(68),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '全部私信',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: Adapt.px(30), fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Adapt.px(38),
                ),
                Expanded(
                  flex: 1,
                  // height: 200,
                  child: EasyRefresh(
                    onRefresh: () async {
                      // _refresh();
                      print('刷新');
                    },
                    onLoad: () async {
                      // _load();
                      print('加载');
                    },
                    header: ClassicalHeader(
                      refreshText: "下拉刷新",
                      refreshReadyText: "松开后开始刷新",
                      refreshingText: "正在刷新...",
                      refreshedText: "刷新完成",
                      bgColor: Colors.transparent,
                      textColor: Colors.black87,
                    ),
                    footer: ClassicalFooter(
                      loadText: "上拉加载更多",
                      loadReadyText: "松开后开始加载",
                      loadingText: "正在加载...",
                      loadedText: "加载完成",
                      noMoreText: "没有更多内容了",
                      bgColor: Colors.transparent,
                      textColor: Colors.black87,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      // itemExtent: Adapt.px(100),
                      itemBuilder: (context, index) {
                        return ChatItem(
                          index: index,
                        );
                      },
                    ),
                  ),
                )
              ],
            )));
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(bottom: Adapt.px(40)),
        child: (Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Center(
                  child: Container(
                      //设置 child 居中
                      height: Adapt.px(88),
                      width: Adapt.px(88),
                      //边框设置
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                            width: 3.0,
                            color: const Color.fromRGBO(1, 1, 1, 1)),
                      ),
                      child: const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              ExactAssetImage('assets/images/avatar.jpeg')))),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: Adapt.px(20),
                    width: Adapt.px(20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color.fromRGBO(232, 52, 52, 1)),
                    // child: ,
                  ))
            ]),
            Container(
              margin: EdgeInsets.only(left: Adapt.px(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '卫慧杰',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Adapt.px(30),
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(450),
                    child: Text(
                      'website blockwebsite blockwebsite blockwebsite blockwebsite blockwebsite blockwebsite block',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: const Color.fromRGBO(213, 213, 213, 1),
                          fontSize: Adapt.px(26),
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Text('1分钟前',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: const Color.fromRGBO(213, 213, 213, 1),
                        fontSize: Adapt.px(26),
                        fontWeight: FontWeight.normal))),
          ],
        )),
      ),
      // ignore: avoid_print
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            //没有传值
            builder: (context) => ChatPage(index: index)))
      },
    );
  }
}

class RowByTextWrapper extends StatelessWidget {
  RowByTextWrapper({Key? key}) : super(key: key);

  SvgPicture favourite = SvgPicture.asset("assets/images/message/favourite.svg",
      width: Adapt.px(32.0), height: Adapt.px(32.0), color: Colors.white);
  SvgPicture notice = SvgPicture.asset("assets/images/message/notice.svg",
      width: Adapt.px(32.0), height: Adapt.px(32.0), color: Colors.white);
  SvgPicture fans = SvgPicture.asset("assets/images/message/fans.svg",
      width: Adapt.px(32.0), height: Adapt.px(32.0), color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButtonItem(icon: notice, title: '通知'),
        TextButtonItem(icon: fans, title: '粉丝'),
        TextButtonItem(icon: favourite, title: '喜欢')
      ],
    );
  }
}

class TextButtonItem extends StatelessWidget {
  const TextButtonItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final SvgPicture icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => {},
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(Size(Adapt.px(176), Adapt.px(88))),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(16, 16, 16, 1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200)))),
        icon: icon,
        label: Text(
          title,
          style: TextStyle(fontSize: Adapt.px(28), color: Colors.white),
        ));
  }
}
