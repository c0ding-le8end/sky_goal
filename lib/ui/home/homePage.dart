import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_goal/ui/details/details.dart';
import 'package:sky_goal/util/controller.dart';

import '../../util/animations.dart';
import 'details_card.dart';
import 'sections_card.dart';

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
  JsonController jsonController=Get.find<JsonController>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/college.jpg"), context);
    precacheImage(const AssetImage("assets/images/school.jpg"), context);
    precacheImage(const AssetImage("assets/images/exams.jpg"), context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selected.value == 0) {
          Get.back();
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
                        FadeAnimation(
                          1.0, Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Find your own way",
                              style: Theme.of(context).textTheme.headline2,
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
                        ),
                        FadeAnimation(
                          1.5, const Text(
                          "Search in 600 colleges around!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
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
                  if(jsonController.loading.value==true)
                    {
                      return Container();
                    }
                    // padding: const EdgeInsets.fromLTRB(37, 50, 37, 20),
                  if (selected.value == 0) {
                    return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(37, 50, 37, 20),
                          child: FadeAnimation(
                            2.0, ListView.separated(
                            itemCount: jsonController.sections.length,
                            separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                            itemBuilder: (context,index)
                            {
                              return InkWell(
                                onTap: () {
                                  openBottomNavBar(context,jsonController.sections[index].contentId!);
                                },
                                child: SectionCard(jsonController: jsonController,index:index),
                              );
                            },

                          ),
                          ),
                        ));
                  } else {
                    return Expanded(
                        child: FadeAnimation(
                          0.2, ListView.separated(
                          separatorBuilder: (context, index) =>const SizedBox(height: 15,),
                          itemBuilder: (context,index)
                          {
                            if(index==0)
                            {
                              return Column(children: [ Padding(
                                padding: const EdgeInsets.only(top: 26.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 27,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(3, (index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 18.0,right: index==2?18:0
                                        ),
                                        child: Container(
                                          width: 133,
                                          height: 27,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(0, 0, 0, 0.29),
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
                                      );
                                    }),
                                  ),
                                ),
                              ),
                                InkWell(
                                  onTap: () {
                                    Get.to(()=>Details(index: index,));
                                  },
                                  child: DetailsCard(jsonController: jsonController,index: index,),
                                )],);
                            }
                            return InkWell(
                              onTap: () {
                                Get.to(()=>Details(index: index,));
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
                                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                                      ),
                                      boxShadow: const [
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
                                        decoration:  BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    jsonController.details[index].image1!),
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
                                            Text(
                                              jsonController.details[index].name!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Container(
                                              width: 52,
                                              height: 22,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF27C200),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(6))),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    jsonController.details[index].rating!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 14),
                                                  ),
                                                  const Image(
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
                                              child:  Text(
                                                jsonController.details[index].descSmall!,
                                                style: const TextStyle(
                                                  color: Color(0xFF8E8E8E),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 9,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                margin: const EdgeInsets.only(top: 8),
                                                width: 77.48,
                                                height: 21.58,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF0E3C6E),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(5.88462))),
                                                child: const Center(
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
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              top: 11.99, left: 18, right: 18),
                                          child: Divider(
                                            thickness: 1,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(left: 18, right: 18),
                                          child: Row(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                    "assets/images/like.png"),
                                                width: 27,
                                                height: 25,
                                              ),
                                              Text(
                                                jsonController.details[index].trivia!,
                                                style: const TextStyle(
                                                  color: Color(0xFF8E8E8E),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 9,
                                                ),
                                              ),
                                              const Spacer(),
                                              Stack(
                                                alignment: Alignment.center,
                                                children: const [
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
                                              const Padding(
                                                padding: EdgeInsets.only(
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
                            );
                          },
                          itemCount: jsonController.details.length,
                        ),
                        ));
                  }
                })
              ],
            )// This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  openBottomNavBar(BuildContext context,String contentId) {
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
                          Get.back();

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
                        radioAction(1,contentId);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/education.png"),
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding:const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Bachelor of Technology",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 1,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!,contentId);
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
                        radioAction(2,contentId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/sketch.png"),
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Bachelor of Architecture",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 2,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!,contentId);
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
                        radioAction(3,contentId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/pharmacy.png"),
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding:const  EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Pharmacy",
                              style:Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 3,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!,contentId);
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
                        radioAction(4,contentId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/balance.png"),
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding:const  EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Law",
                              style:Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 4,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!,contentId);
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
                        radioAction(1,contentId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/management.png"),
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding:const  EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Management",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          const Spacer(),
                          Radio(
                              value: 5,
                              groupValue: dummy,
                              onChanged: (int? value) {
                                radioAction(value!,contentId);
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

  void radioAction(int i,String contentId) {
    dummy = i;
    selected.value = 1;
    jsonController.getDetailsObjects(contentId);
    Get.back();
  }
}



