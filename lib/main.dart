import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_goal/details.dart';

import 'json/json_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: "Lato",
          unselectedWidgetColor: const Color(0xFF0E3C6E),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xFF0E3C6E)),
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int dummy = 0;
  RxInt selected = RxInt(0);
  @override
  void initState() {
    var jsonData=JsonUtil.loadFromJsonAsync().then((value) {
      print(value[0].title);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selected.value == 0) {
          Navigator.pop(context);
        } else {
          selected.value = 0;
        }
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              unselectedItemColor: const Color(0xFFBBBBBB),
              selectedItemColor: Colors.white,
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/home.png")),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/tag.png")),
                    label: "saved"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.refresh_outlined), label: "saved"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/person.png")),
                    label: "account"),
              ],
              backgroundColor: const Color(0xFF0E3C6E),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 225,
                  decoration: const BoxDecoration(
                      color: Color(0xFF0E3C6E),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 37.0, top: 49),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Find your own way",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const ImageIcon(
                                      AssetImage("assets/images/Vector.png"),
                                      color: Colors.white,
                                    )),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 13.0, left: 10),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Ellipse7.png"),
                                    width: 8,
                                    height: 8,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Text(
                          "Search in 600 colleges around!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Row(
                            children: [
                              Container(
                                width: 279,
                                height: 53,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 58,
                                      child: Center(
                                          child: Image(
                                        image: AssetImage(
                                            "assets/images/magnify.png"),
                                        width: 15,
                                        height: 15,
                                      )),
                                    ),
                                    SizedBox(
                                        width: 198,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Search for colleges,schools....",
                                              hintStyle: TextStyle(
                                                  color: Color(0xFFD6D6D6),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                              border: InputBorder.none),
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  width: 55,
                                  height: 53,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/microphone.png"),
                                      width: 15,
                                      height: 20,
                                      color: Color(0xFF0E3C6E),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (selected.value == 0) {
                    return Expanded(
                        child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(37, 50, 37, 20),
                          child: InkWell(
                            onTap: () => openBottomNavBar(context),
                            child: Stack(alignment: Alignment.bottomRight,
                              children: [
                                ClipPath(
                                  clipper:CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/college.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                ClipPath(
                                  clipper: CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF000000),
                                          Color.fromRGBO(0, 0, 0, 0)
                                        ])),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 21, top: 19),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Top Colleges",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 202,
                                            child: Text(
                                              "Search through thousands of accredited colleges and universities online to find the right one for you. Apply in 3 min, and connect with your future",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "+126",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800)),
                                    TextSpan(
                                        text: "Colleges",
                                        style: TextStyle(
                                            color: Color(0xFF848484),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800))
                                  ])),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 37, right: 37, bottom: 20),
                          child: InkWell(
                            onTap: () => openBottomNavBar(context),
                            child: Stack(
                              alignment:Alignment.bottomRight,
                              children: [
                                ClipPath(
                                  clipper:CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/school.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                ClipPath(
                                  clipper: CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF000000),
                                          Color.fromRGBO(0, 0, 0, 0)
                                        ])),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 21, top: 19),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Top Schools",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 202,
                                            child: Text(
                                              "Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "+106",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800)),
                                    TextSpan(
                                        text: "Schools",
                                        style: TextStyle(
                                            color: Color(0xFF848484),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800))
                                  ])),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 37, right: 37, bottom: 20),
                          child: InkWell(
                            onTap: () => openBottomNavBar(context),
                            child: Stack(alignment: Alignment.bottomRight,
                              children: [
                                ClipPath(
                                  clipper: CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/exams.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                ClipPath(
                                  clipper: CustomContainerClipper(),
                                  child: Container(
                                    width: 354,
                                    height: 158,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF000000),
                                          Color.fromRGBO(0, 0, 0, 0)
                                        ])),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 21, top: 19),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Exams",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 202,
                                            child: Text(
                                              "Find an end to end information about the exams that are happening in India",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "+16",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800)),
                                    TextSpan(
                                        text: "Exams",
                                        style: TextStyle(
                                            color: Color(0xFF848484),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800))
                                  ])),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
                  } else {
                    return Expanded(
                        child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 27,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18.0,
                                  ),
                                  child: Container(
                                    width: 133,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromRGBO(0, 0, 0, 0.29),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        "MVSH Engineering college",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 18.0,
                                  ),
                                  child: Container(
                                    width: 133,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.29),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        "MVSH Engineering college",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: Container(
                                    width: 133,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.29),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Center(
                                      child: Text(
                                        "MVSH Engineering college",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const Details();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 29.0, left: 37, right: 37),
                            child: Container(
                              width: 354,
                              height: 243,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 8,
                                        color: Color.fromRGBO(0, 0, 0, 0.25))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    height: 116,
                                    width: 354,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/university.jpg"),
                                            fit: BoxFit.cover)),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, top: 13, right: 9),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36),
                                                    color: Colors.white),
                                                child: const Center(
                                                    child: Image(
                                                  image: AssetImage(
                                                      "assets/images/share.png"),
                                                  height: 15.6,
                                                  width: 14.3,
                                                )),
                                              ),
                                              Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36),
                                                    color: Colors.white),
                                                child: const Center(
                                                    child: Image(
                                                  image: AssetImage(
                                                      "assets/images/saved.png"),
                                                  height: 15.6,
                                                  width: 14.3,
                                                )),
                                              )
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, top: 9, right: 18),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "GHJK Engineering college",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          width: 52,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF27C200),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 7.1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 207,
                                          child: const Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu ut imperdiet sed nec ullamcorper.",
                                            style: TextStyle(
                                              color: Color(0xFF8E8E8E),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 9,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 8),
                                            width: 77.48,
                                            height: 21.58,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF0E3C6E),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.88462))),
                                            child: Center(
                                                child: Text(
                                              "Apply Now",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 11.99, left: 18, right: 18),
                                      child: Divider(
                                        thickness: 1,
                                      )),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 18, right: 18),
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/like.png"),
                                            width: 27,
                                            height: 25,
                                          ),
                                          Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing ",
                                            style: TextStyle(
                                              color: Color(0xFF8E8E8E),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 9,
                                            ),
                                          ),
                                          Spacer(),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/eye.png"),
                                                width: 14.67,
                                                height: 10.67,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/eyeBall.png"),
                                                width: 4,
                                                height: 4,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.67),
                                            child: Text(
                                              "468+ ",
                                              style: TextStyle(
                                                color: Color(0xFF8E8E8E),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 9,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
                  }
                })
              ],
            ) // This trailing comma makes auto-formatting nicer for build methods.
            ),
      ),
    );
  }

  openBottomNavBar(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 39, top: 28),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sort By",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Stack(
                          children: const [
                            Image(
                              image: AssetImage("assets/images/cross.png"),
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              width: 16,
                              height: 16,
                            ),
                            Image(
                              image: AssetImage("assets/images/cross2.png"),
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              width: 16,
                              height: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Divider(
                        thickness: 1,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 44.0),
                    child: InkWell(
                      onTap: ()
                      {
                        radioAction(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/education.png"),
                            width: 22,
                            height: 22,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Bachelor of Technology",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 1,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!);
                              })
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: ()
                      {
                        radioAction(2);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/sketch.png"),
                            width: 22,
                            height: 22,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Bachelor of Architecture",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 2,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!);
                              })
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: ()
                      {
                        radioAction(3);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/pharmacy.png"),
                            width: 22,
                            height: 22,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Pharmacy",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 3,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!);
                              })
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: ()
                      {
                        radioAction(4);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/balance.png"),
                            width: 22,
                            height: 22,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Law",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 4,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!);
                              })
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 56),
                    child: InkWell(
                      onTap: ()
                      {
                        radioAction(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/management.png"),
                            width: 22,
                            height: 22,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Management",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 5,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!);
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void radioAction(int i) {
    dummy = i;
    selected.value = 1;
    Navigator.pop(context);
  }
}
class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20;

    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width,size.height-38 )
      ..arcToPoint(Offset(size.width - radius, size.height-radius),radius: Radius.circular(radius))
      ..lineTo(size.width -59, size.height-radius)
      ..arcToPoint(Offset(size.width - 59-radius, size.height-10),radius:Radius.circular(radius),clockwise: false)
      ..lineTo(size.width - 59-radius-5, size.height-5)
      ..arcToPoint(Offset(size.width - 59-radius-radius, size.height),radius:Radius.circular(radius))
      // ..arcToPoint(Offset(size.width - 79, size.height+radius),radius:Radius.circular(radius),)
      ..lineTo(0, size.height)
      // ..arcToPoint(Offset(radius, 0), radius: Radius.elliptical(40, 20))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ClipPath(clipper:CustomContainerClipper(),child: Container(height: 158,width: 354,decoration: BoxDecoration(color: Colors.red,
borderRadius: BorderRadius.all(Radius.circular(20))
          ),)),
        ),
      ],
    ));
  }
}
