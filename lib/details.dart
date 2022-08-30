import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

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
  List<String> hostelImages = [
    "assets/images/hostel1.png",
    "assets/images/hostel2.png",
    "assets/images/hostel1.png",
    "assets/images/hostel2.png",
    "assets/images/hostel1.png",
    "assets/images/hostel2.png",
    "assets/images/hostel1.png",
  ];

  _scrollListener() {
    setState(() {
      scrollControllerOffset = _scrollController.offset;
    });
  }

  _horizontalScrollListener() {
    print(horizontalImageScrollControllerOffset.ceil());
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
        delegate: _SliverAppBarDelegate(
          minHeight: MediaQuery
              .of(context)
              .size
              .height * 0.04967602591 + 35.2,
          maxHeight: MediaQuery
              .of(context)
              .size
              .height * 0.04967602591 + 35.2,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                  )
                ]),
            child: AppBar(
              backgroundColor: Color(0xFFF8F8F8),
              elevation: 0,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Color(0xFF0E3C6E),
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
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
      delegate: _SliverAppBarDelegate(
        maxHeight: 83,
        minHeight: 83,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                  "GHJK Engineering college",
                  style: TextStyle(
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
                  onTap: ()
              {
                Navigator.of(context).pop();
              },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(42)),
                      child: const Center(
                        child: Image(
                          image: AssetImage("assets/images/leftArrow.png"),
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
    return Scaffold(
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 188,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/images/university2.jpg"),
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
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: const [
                                      Text(
                                        "GHJK Engineering college",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16.0),
                                        child: SizedBox(
                                          width: 298,
                                          child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis consectetur nulla pharetra praesent hendrerit vulputate viverra. Pellentesque aliquam tempus faucibus est.",
                                            style: TextStyle(
                                              color: Color(0xFF8E8E8E),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
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
                                        children: const [
                                          Text(
                                            "4.3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18),
                                          ),
                                          Image(
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
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: TabBarView(
                              controller: _tabController, children: [
                            About(selectedImage: selectedImage,
                                images: userImages),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30.0,
                                  ),
                                  child: SizedBox(
                                    height: 31,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Obx(() =>
                                            InkWell(
                                                onTap: () {
                                                  selected.value = index;
                                                },
                                                child: Container(
                                                  width: 69,
                                                  height: 31,
                                                  decoration: BoxDecoration(
                                                      color: selected.value ==
                                                          index
                                                          ? Color(0xFF0E3C6E)
                                                          : Colors.white,
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xFF0E3C6E),
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(8))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      Flexible(
                                                        child: Image(
                                                          image: AssetImage(
                                                              "assets/images/bed.png"),
                                                          width: 20,
                                                          height: 20,
                                                          color: selected
                                                              .value == index
                                                              ? Colors.white
                                                              : const Color(
                                                              0xFF0E3C6E),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                            "${4 - index}",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                color:
                                                                selected
                                                                    .value ==
                                                                    index
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black,
                                                                fontSize: 16),
                                                          ))
                                                    ],
                                                  ),
                                                )));
                                      },
                                      itemCount: 4,
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          width: 9,
                                          height: 31,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 29.0),
                                  child: SizedBox(
                                    height: 137,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: ListView.separated(
                                        controller:
                                        _horizontalImageScrollController,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          if (index == hostelImages.length) {
                                            return SizedBox(
                                              height: 137,
                                              width: 154,
                                            );
                                          }
                                          return Image(
                                            image: AssetImage(
                                                hostelImages[index]),
                                            height: 137,
                                            width: 154,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 137,
                                            width: 15,
                                          );
                                        },
                                        itemCount: hostelImages.length + 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 137,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    List.generate(hostelImages.length, (index) {
                                      return Flexible(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            key: keys[index],
                                            child: Obx(() {
                                              // if (keys[index]
                                              //         .currentContext
                                              //         ?.findRenderObject() !=
                                              //     null) {
                                              //   // RenderBox renderBox = keys[index]
                                              //   //         .currentContext
                                              //   //         ?.findRenderObject()
                                              //   //     as RenderBox;
                                              //   // Offset offset = renderBox
                                              //   //     .localToGlobal(Offset.zero);
                                              //   // Size size = renderBox.size;
                                              //
                                              //   // print(index);
                                              //   // print(size.width);
                                              //   // print(offset);
                                              //   //Offset(140.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(156.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(172.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(188.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(204.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(220.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(236.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(140.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(156.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(172.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(188.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(204.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(220.4, 419.8)
                                              //   // I/flutter ( 2876): Offset(236.4, 419.8)
                                              //   if (index == 0) {
                                              //     coordinates[index]['stop'] =
                                              //     154;
                                              //   } else {
                                              //     coordinates[index]['start'] =
                                              //     coordinates[index-1]['stop'];
                                              //     coordinates[index]['stop'] =
                                              //         coordinates[index]['start']+154;
                                              //   }
                                              //   return Image(
                                              //     image: AssetImage(
                                              //         "assets/images/ellipse.png"),
                                              //     height: 8,
                                              //     width: 8,
                                              //     color: horizontalImageScrollControllerOffset
                                              //                     .value
                                              //                     .ceil() >=
                                              //                 coordinates[index]
                                              //                     ['start'] &&
                                              //             horizontalImageScrollControllerOffset
                                              //                     .value
                                              //                     .ceil() <
                                              //                 coordinates[index]
                                              //                     ['stop']
                                              //         ? Colors.black
                                              //         : Colors.grey,
                                              //   );
                                              // }
                                              if (index == 0) {
                                                coordinates[index]['stop'] =
                                                154;
                                              } else {
                                                coordinates[index]['start'] =
                                                coordinates[index - 1]['stop'];
                                                coordinates[index]['stop'] =
                                                    coordinates[index]['start'] +
                                                        154;
                                              }
                                              return Image(
                                                image: AssetImage(
                                                    "assets/images/ellipse.png"),
                                                height: 8,
                                                width: 8,
                                                color: horizontalImageScrollControllerOffset
                                                    .value
                                                    .ceil() >=
                                                    coordinates[index]
                                                    ['start'] &&
                                                    horizontalImageScrollControllerOffset
                                                        .value
                                                        .ceil() <
                                                        coordinates[index]
                                                        ['stop']
                                                    ? Colors.black
                                                    : Colors.grey,
                                              );
                                            }),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    const Text(
                                      "GHJK Engineering Hostel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      width: 52,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF27C200),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "4.3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                "assets/images/star.png"),
                                            width: 14.73,
                                            height: 14.06,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: const[
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/locationTag.png"),
                                        width: 18,
                                        height: 18,
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Padding(
                                      padding: EdgeInsets.only(top: 11.0),
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xFF4A4A4A)),),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: const EdgeInsets.only(top: 17.0),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.",
                                  style: TextStyle(color: Color(0xFF969797),fontWeight: FontWeight.w700,fontSize: 14),),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(top: 35.0),
                                  child:  Text(
                                    "Facilities",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                ),
                                 Padding(
                                  padding:  const EdgeInsets.only(top: 15.0),
                                  child:  Row(
                                    children: const [
                                      Image(
                                        image: AssetImage("assets/images/universityIcon.png"),
                                        width: 26,
                                        height: 26,
                                      ),
                                      Text(
                                        "College in 400mtrs",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xFF4A4A4A)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:  const EdgeInsets.only(top: 15.0),
                                  child:  Row(
                                    children: const [
                                      Image(
                                        image: AssetImage("assets/images/bath.png"),
                                        width: 26,
                                        height: 26,
                                      ),
                                      Text(
                                        "Bathrooms : 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xFF4A4A4A)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                      onPressed: () => null,
                      child: Center(
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
    );
  }
}

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.selectedImage,
    required this.images,
  }) : super(key: key);

  final RxInt selectedImage;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.",
            style: TextStyle(
                color: Color(0xFF969797),
                fontWeight: FontWeight.w700,
                fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 34.0),
          child: Text(
            "Location",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image(
              image: AssetImage("assets/images/map.png"),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 184,
            )),
        const Padding(
          padding: EdgeInsets.only(top: 34.0),
          child: Text(
            "Student Review",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: SizedBox(
                  height: 60,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        if (index == 4) {
                          return Column(
                            children: [
                              Container(
                                height: 50,
                                width: 77,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFE7E6E6)),
                                child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "+12",
                                      style: TextStyle(
                                          color: Color(0xFF0E3C6E),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                selectedImage.value = index;
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(images[index]),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Obx(() {
                              if (index == selectedImage.value) {
                                return ClipPath(
                                  clipper: CustomTriangleClipper(),
                                  child: Container(
                                    width: 21,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(11, 6, 90, 0.4),
                                            Colors.white
                                          ],
                                          stops: [
                                            0.2,
                                            0.5
                                          ]),
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                width: 21,
                                height: 10,
                              );
                            })
                          ],
                        );
                      },
                      separatorBuilder: (context, count) =>
                      const SizedBox(
                        width: 18,
                      ),
                      itemCount: 5),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 368,
          height: 120,
          decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-8, -8),
                    blurRadius: 16,
                    color: Color.fromRGBO(158, 158, 158, 0.1)),
                BoxShadow(
                    offset: Offset(8, 8),
                    blurRadius: 16,
                    color: Color.fromRGBO(158, 158, 158, 0.1))
              ],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 7, right: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Arun Sai",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec sed lorem nunc varius rutrum eget dolor, quis. Nulla sit magna suscipit tellus malesuada in facilisis a.",
                  style: TextStyle(
                      color: Color(0xFF8E8E8E),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      if (index == 4) {
                        return const Image(
                          image: AssetImage("assets/images/gstar2.png"),
                          width: 14,
                          height: 14,
                        );
                      }
                      return const Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Image(
                          image: AssetImage("assets/images/gstar.png"),
                          width: 14,
                          height: 14,
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double? minHeight;
  final double? maxHeight;
  final Widget? child;

  @override
  double get minExtent => minHeight!;

  @override
  double get maxExtent => math.max(maxHeight!, minHeight!);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0) // move path point to (w/2,0)
      ..lineTo(0, size.width)..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
//SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: SizedBox(height: MediaQuery.of(context).size.height,
//             child: Stack(
//               children: [
//
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 83,
//                       decoration:
//                       const BoxDecoration(color: Color(0xFF0E3C6E), boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 4),
//                             blurRadius: 8,
//                             color: Color.fromRGBO(0, 0, 0, 0.09))
//                       ]),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 28.0, right: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: 42,
//                                 height: 42,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(42)),
//                                 child: const Center(
//                                   child: Image(
//                                     image: AssetImage("assets/images/leftArrow.png"),
//                                     width: 16.73,
//                                     height: 14.64,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 42,
//                                 height: 42,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(42)),
//                                 child: const Center(
//                                   child: Image(
//                                     image: AssetImage("assets/images/saved.png"),
//                                     width: 24,
//                                     height: 24,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 188,
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage("assets/images/university2.jpg"),
//                               fit: BoxFit.cover)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 19, top: 16, right: 24),
//                       child: SizedBox(
//                         height: 146,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: const [
//                                   Text(
//                                     "GHJK Engineering college",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 20,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 16.0),
//                                     child: SizedBox(
//                                       width: 298,
//                                       child: Text(
//                                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis consectetur nulla pharetra praesent hendrerit vulputate viverra. Pellentesque aliquam tempus faucibus est.",
//                                         style: TextStyle(
//                                           color: Color(0xFF8E8E8E),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 12,
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 35.0),
//                               child: Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Container(
//                                   width: 52,
//                                   height: 74,
//                                   decoration: const BoxDecoration(
//                                       color: Color(0xFF27C200),
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(6))),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: const [
//                                       Text(
//                                         "4.3",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w800,
//                                             fontSize: 18),
//                                       ),
//                                       Image(
//                                         image: AssetImage("assets/images/star.png"),
//                                         width: 23.02,
//                                         height: 21.97,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height,
//                   child: DraggableScrollableSheet(
//                     initialChildSize: 0.4,
//                     minChildSize: 0.4,
//                     maxChildSize: 1,
//                     builder:(context,ScrollController controller) {
//                       return CustomScrollView(
//                         controller: controller,
//                         slivers: [
//                           makeHeader('hello')
//
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
