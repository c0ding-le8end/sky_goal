import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/clippers.dart';
import '../../util/json/dart_object.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.selectedImage,
    required this.reviews,
    required this.descLarge,
  }) : super(key: key);

  final RxInt selectedImage;
  final List<Reviews> reviews;
  final String descLarge;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            descLarge,
            style: const TextStyle(
                color: Color(0xFF969797),
                fontWeight: FontWeight.w700,
                fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding:const EdgeInsets.only(top: 34.0),
          child: Text(
            "Location",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image(
              image: const AssetImage("assets/images/map.png"),
              width: MediaQuery.of(context).size.width,
              height: 184,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 34.0),
          child: Text(
            "Student Review",
            style: Theme.of(context).textTheme.headline4,
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
                                    color: const Color(0xFFE7E6E6)),
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
                              const SizedBox(
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
                                        image:
                                        AssetImage(reviews[index].image!),
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
                              return const SizedBox(
                                width: 21,
                                height: 10,
                              );
                            })
                          ],
                        );
                      },
                      separatorBuilder: (context, count) => const SizedBox(
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
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviews[selectedImage.value].name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    reviews[selectedImage.value].review!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          reviews[selectedImage.value].fullStars! +
                              reviews[selectedImage.value].halfStars!, (index) {
                        if (index ==
                            reviews[selectedImage.value].fullStars! +
                                reviews[selectedImage.value].halfStars! -
                                1 &&
                            reviews[selectedImage.value].halfStars! > 0) {
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
              );
            }),
          ),
        )
      ],
    );
  }
}