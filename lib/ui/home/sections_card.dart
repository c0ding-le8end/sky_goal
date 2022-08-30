import 'package:flutter/material.dart';

import '../../util/clippers.dart';
import '../../util/controller.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    Key? key,
    required this.jsonController,
    required this.index
  }) : super(key: key);

  final JsonController jsonController;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight,
      children: [
        ClipPath(
          clipper:CustomContainerClipper(),
          child: Container(
            width: 354,
            height: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:  DecorationImage(
                  image: AssetImage(
                      jsonController.sections[index].image!),
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
                children:  [
                  Text(
                    jsonController.sections[index].title!,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    width: 202,
                    child: Text(
                      jsonController.sections[index].description!,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1,
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
                text: "+${jsonController.sections[index].number}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w800)),
            TextSpan(
                text: jsonController.sections[index].type,
                style: const TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 12,
                    fontWeight: FontWeight.w800))
          ])),
        )
      ],
    );
  }
}