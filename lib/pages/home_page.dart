import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photographer/utils/adpat.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final List<Map> _listItem = [
    {
      'title': '黑板',
      'subtitle': 'Website title',
      'download_num': 123,
      'image': 'assets/images/home/blackPanel.png'
    },
    {
      'title': '咖啡',
      'subtitle': 'Website title',
      'download_num': 2,
      'image': 'assets/images/home/cafeLife.png'
    },
    {
      'title': '舒适',
      'subtitle': 'Website title',
      'download_num': 3,
      'image': 'assets/images/home/enjoy.png'
    },
    {
      'title': '城市',
      'subtitle': 'Website title',
      'download_num': 1,
      'image': 'assets/images/home/city.png'
    },
    {
      'title': '家居室内',
      'subtitle': 'Website title',
      'download_num': 13,
      'image': 'assets/images/home/innerHome.png'
    },
    {
      'title': '马路',
      'subtitle': 'Website title',
      'download_num': 23,
      'image': 'assets/images/home/wall.png'
    },
  ];

  int _currentPage = 1;
  // static const int PAGE_SIZE = 20;

  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    _currentPage += 1;
    // print(_currentPage);
    _requestNewItems();
  }

  void _requestNewItems() async {
    // ignore: avoid_print
    print(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Container(
        padding: EdgeInsets.only(left: Adapt.px(40), right: Adapt.px(40)),
        child: EasyRefresh(
          onRefresh: () async {
            _refresh();
          },
          onLoad: () async {
            _load();
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
          child: StaggeredGridView.countBuilder(
            //滑动控制器
            primary: false,
            controller: _scrollController,
            //滑动方向
            scrollDirection: Axis.vertical,
            //纵轴方向被划分的个数
            crossAxisCount: 2,
            //item的数量
            itemCount: _listItem.length,
            /**
             * mainAxisSpacing:主轴item之间的距离（px）
             * crossAxisSpacing:纵轴item之间的距离（px）
             * */
            mainAxisSpacing: Adapt.px(60),
            crossAxisSpacing: Adapt.px(22),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) => SizedBox(
              // color: Colors.green,
              //随机生成高度
              // height: 100.0 + Random().nextInt(10) * 20.0,
              width: 20,
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      _listItem[index]['image'],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: Adapt.px(40),
                  ),
                  SizedBox(
                    child: Text(
                      _listItem[index]['title'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(32),
                          color: const Color.fromRGBO(2, 2, 2, 1)),
                    ),
                  ),
                  SizedBox(
                    height: Adapt.px(12),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            // width: Adapt.px(196),
                            child: Text(
                          _listItem[index]['subtitle'],
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: Adapt.px(28),
                              color: const Color.fromRGBO(223, 223, 223, 1)),
                        )),
                        Container(
                          margin: EdgeInsets.only(right: Adapt.px(10)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.download,
                                color: const Color.fromRGBO(223, 223, 223, 1),
                                size: Adapt.px(28),
                              ),
                              Text(_listItem[index]['download_num'].toString(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: Adapt.px(28),
                                      color: const Color.fromRGBO(
                                          223, 223, 223, 1)))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
