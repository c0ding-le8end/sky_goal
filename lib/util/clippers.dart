import 'package:flutter/material.dart';

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
class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0) // move path point to (w/2,0)
      ..lineTo(0, size.width)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}