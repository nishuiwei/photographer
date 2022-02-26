import 'package:get/get.dart';

class MainState {
  //底部导航栏索引
  RxInt bottombarIndex = 0.obs;
  RxBool isLoginStatus = false.obs;
}

//全局状态控制器
class GlobalStateController extends GetxController {
  MainState state = MainState();
  //改变底部导航栏索引
  changeBottomBarIndex(int index) {
    state.bottombarIndex.value = index;
  }

  setLoginStatus(bool loginStatus) {
    state.isLoginStatus.value = true;
  }
}
