
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:sky_goal/util/controller.dart';


import 'about.dart';
import 'appBarDelegate.dart';
import 'hostelDetails.dart';

class Details extends StatefulWidget {
  const Details({Key? key, this.index=0}) : super(key: key);
  final int index;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late ScrollController _scrollController;
  late ScrollController _horizontalImageScrollController;
  double scrollControllerOffset = 0.0;
  RxDouble horizontalImageScrollControllerOffset = RxDouble(0.0);
  RxInt selectedImage = RxInt(0);
  RxInt selected = RxInt(0);
  Map coordinates = {
    0: {'start': 0, 'stop': 0},
    1: {'start': 0, 'stop': 0},
    2: {'start': 0, 'stop': 0},
    3: {'start': 0, 'stop': 0},
    4: {'start': 0, 'stop': 0},
    5: {'start': 0, 'stop': 0},
    6: {'start': 0, 'stop': 0},
  };
  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ].obs;
  List<String> userImages = [
    "assets/images/user1.png",
    "assets/images/user2.png",
    "assets/images/user3.png",
    "assets/images/user4.png"
  ];

  JsonController jsonController = Get.find<JsonController>();

  _scrollListener() {
    setState(() {
      scrollControllerOffset = _scrollController.offset;
    });
  }

  _horizontalScrollListener() {
    // print(horizontalImageScrollControllerOffset.ceil());
    setState(() {
      horizontalImageScrollControllerOffset.value =
          _horizontalImageScrollController.offset;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _horizontalImageScrollController = ScrollController();
    _horizontalImageScrollController.addListener(() {
      _horizontalScrollListener();
    });
    _scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  SliverPersistentHeader makeHeader(String headerText, {bool tabBar = true}) {
    if (tabBar == true) {
      return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          minHeight: MediaQuery.of(context).size.height * 0.04967602591 + 35.2,
          maxHeight: MediaQuery.of(context).size.height * 0.04967602591 + 35.2,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                  )
                ]),
            child: AppBar(
              backgroundColor: const Color(0xFFF8F8F8),
              elevation: 0,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: const Color(0xFF0E3C6E),
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "About College",
                  ),
                  Tab(
                    text: "Hostel facility",
                  ),
                  Tab(
                    text: "Q&A",
                  ),
                  Tab(
                    text: "Events",
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        maxHeight: 83,
        minHeight: 83,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color(0xFF0E3C6E), boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                color: Color.fromRGBO(0, 0, 0, 0.09))
          ]),
          child: scrollControllerOffset > 0
              ? Padding(
                  padding: const EdgeInsets.only(left: 19.0, bottom: 10),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        jsonController.details[widget.index].name!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(42)),
                            child: const Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/leftArrow.png"),
                                width: 16.73,
                                height: 14.64,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(42)),
                          child: const Center(
                            child: Image(
                              image: AssetImage("assets/images/saved.png"),
                              width: 24,
                              height: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                makeHeader('', tabBar: false),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 188,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    jsonController.details[widget.index].image2!),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 19, top: 16, right: 24),
                        child: SizedBox(
                          height: 146,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      jsonController.details[widget.index].name!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: SizedBox(
                                        width: 298,
                                        child: Text(
                                          jsonController
                                              .details[widget.index].descMedium!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 52,
                                    height: 74,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF27C200),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(6))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          jsonController
                                              .details[widget.index].rating!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                        const Image(
                                          image: AssetImage(
                                              "assets/images/star.png"),
                                          width: 23.02,
                                          height: 21.97,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ])),
                makeHeader(''),
                SliverPadding(
                    padding: const EdgeInsets.only(left: 32, right: 32, top: 30),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(controller: _tabController, children: [
                          About(
                            selectedImage: selectedImage,
                            reviews:
                                jsonController.details[widget.index].reviews!,
                            descLarge:
                                jsonController.details[widget.index].descLarge!,
                          ),
                          HostelDetails(selected: selected, horizontalImageScrollController: _horizontalImageScrollController, jsonController: jsonController, widgetIndex: widget.index, keys: keys, coordinates: coordinates, horizontalImageScrollControllerOffset: horizontalImageScrollControllerOffset,),
                          Container(),
                          Container()
                        ]),
                      )
                    ])))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 366,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF0E3C6E)),
                    child: TextButton(
                        onPressed: () {
                        },
                        child: const Center(
                          child: Text(
                            "Apply Now",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        )),
                  ),
                  Container(
                    height: 34,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









