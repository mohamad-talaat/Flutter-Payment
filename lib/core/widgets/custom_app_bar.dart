import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar({required final String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: Center(
      child: SvgPicture.asset('assets/images/arrow.svg'),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
