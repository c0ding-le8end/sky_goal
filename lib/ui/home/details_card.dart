import 'package:flutter/material.dart';

import '../../util/controller.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required this.jsonController,
    required this.index
  }) : super(key: key);

  final JsonController jsonController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: (){

                      },
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
    );
  }
}