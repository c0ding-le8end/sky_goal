import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/controller.dart';

class HostelDetails extends StatelessWidget {
  const HostelDetails({
    Key? key,
    required this.selected,
    required ScrollController horizontalImageScrollController,
    required this.jsonController,
    required this.widgetIndex,
    required this.keys,
    required this.coordinates,
    required this.horizontalImageScrollControllerOffset,

  }) : _horizontalImageScrollController = horizontalImageScrollController, super(key: key);

  final RxInt selected;
  final ScrollController _horizontalImageScrollController;
  final JsonController jsonController;
  final int widgetIndex;

  final List<GlobalKey<State<StatefulWidget>>> keys;
  final Map coordinates;
  final RxDouble horizontalImageScrollControllerOffset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: SizedBox(
            height: 31,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() => InkWell(
                    onTap: () {
                      selected.value = index;
                    },
                    child: Container(
                      width: 69,
                      height: 31,
                      decoration: BoxDecoration(
                          color: selected.value == index
                              ? const Color(0xFF0E3C6E)
                              : Colors.white,
                          border: Border.all(
                            color: const Color(0xFF0E3C6E),
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Image(
                              image:const AssetImage(
                                  "assets/images/bed.png"),
                              width: 20,
                              height: 20,
                              color: selected.value == index
                                  ? Colors.white
                                  : const Color(0xFF0E3C6E),
                            ),
                          ),
                          Flexible(
                              child: Text(
                                "${4 - index}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color:
                                    selected.value == index
                                        ? Colors.white
                                        : Colors.black,
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
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                controller:
                _horizontalImageScrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index ==
                      jsonController.details[widgetIndex]
                          .hostelImages!.length) {
                    return const  SizedBox(
                      height: 137,
                      width: 154,
                    );
                  }
                  return Image(
                    image: AssetImage(jsonController
                        .details[widgetIndex]
                        .hostelImages![index]),
                    height: 137,
                    width: 154,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 137,
                    width: 15,
                  );
                },
                itemCount: jsonController
                    .details[widgetIndex]
                    .hostelImages!
                    .length +
                    1),
          ),
        ),
        SizedBox(
          height: 137,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                jsonController.details[widgetIndex]
                    .hostelImages!.length, (index) {
              return Flexible(
                child: Padding(
                  padding:
                  const EdgeInsets.only(right: 8.0),
                  child: Container(
                    key: keys[index],
                    child: Obx(() {

                      if (index == 0) {
                        coordinates[index]['stop'] = 154;
                      } else {
                        coordinates[index]['start'] =
                        coordinates[index - 1]['stop'];
                        coordinates[index]['stop'] =
                            coordinates[index]['start'] +
                                154;
                      }
                      return Image(
                        image: const AssetImage(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              jsonController.details[widgetIndex].name!,
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              width: 52,
              height: 22,
              decoration: const BoxDecoration(
                  color: Color(0xFF27C200),
                  borderRadius:
                  BorderRadius.all(Radius.circular(6))),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    jsonController
                        .details[widgetIndex].rating!,
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
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Image(
                image: AssetImage(
                    "assets/images/locationTag.png"),
                width: 18,
                height: 18,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11.0),
              child: Text(
                jsonController
                    .details[widgetIndex].location!,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF4A4A4A)),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Text(
            jsonController.details[widgetIndex].descLarge!,
            style: const TextStyle(
                color: Color(0xFF969797),
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:const EdgeInsets.only(top: 35.0),
            child: Text(
              "Facilities",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage(
                    "assets/images/universityIcon.png"),
                width: 26,
                height: 26,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                jsonController.details[widgetIndex]
                    .facilities!.distance!,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF4A4A4A)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/images/bath.png"),
                width: 26,
                height: 26,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Bathrooms : ${jsonController.details[widgetIndex].facilities!.bathrooms!}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF4A4A4A)),
              ),
            ],
          ),
        )
      ],
    );
  }
}