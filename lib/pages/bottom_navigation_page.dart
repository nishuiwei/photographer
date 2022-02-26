import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photographer/controller/global.dart';
import 'package:photographer/pages/home_page.dart';
import 'package:photographer/pages/information_page.dart';
import 'package:photographer/pages/message_page.dart';
import 'package:photographer/pages/mine_page.dart';
import 'package:photographer/utils/adpat.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final globalStateController = Get.put(GlobalStateController());
  var mainState = Get.find<GlobalStateController>().state;
  List bodyPageList = [
    const HomePage(),
    const InformationPage(),
    const MessagePage(),
    const MinePage()
  ];
  SvgPicture home = SvgPicture.asset(
    "assets/images/home.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );

  SvgPicture homeActive = SvgPicture.asset(
    "assets/images/home_active.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );
  SvgPicture information = SvgPicture.asset(
    "assets/images/information.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );
  SvgPicture informationActive = SvgPicture.asset(
    "assets/images/information_active.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );
  SvgPicture message = SvgPicture.asset(
    "assets/images/message.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );
  SvgPicture messageActive = SvgPicture.asset(
    "assets/images/message_active.svg",
    width: Adapt.px(48.0),
    height: Adapt.px(48.0),
    allowDrawingOutsideViewBox: true,
  );

  bool isLoginStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Container(
            // decoration: BoxDecoration(backgroundBlendMode: ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: bodyPageList[mainState.bottombarIndex.value])),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: mainState.bottombarIndex.value,
                onTap: (int index) {
                  globalStateController.changeBottomBarIndex(index);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: mainState.bottombarIndex.value != 0
                          ? home
                          : homeActive,
                      label: ''),
                  BottomNavigationBarItem(
                      icon: mainState.bottombarIndex.value != 1
                          ? information
                          : informationActive,
                      label: ''),
                  BottomNavigationBarItem(
                      icon: mainState.bottombarIndex.value != 2
                          ? message
                          : messageActive,
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Center(
                        child: Container(
                            //设置 child 居中
                            height: Adapt.px(48),
                            width: Adapt.px(48),
                            //边框设置
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                  width: 2.0, color: const Color(0x9C101010)),
                            ),
                            child: CircleAvatar(
                                radius: 60,
                                backgroundImage: mainState.isLoginStatus.value
                                    ? const ExactAssetImage(
                                        'assets/images/avatar.jpeg')
                                    : const ExactAssetImage(
                                        'assets/images/isNotLogin.png'))),
                      ),
                      label: '')
                ])));
  }
}
