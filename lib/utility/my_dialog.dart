import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shops/utility/my_constant.dart';
import 'package:shops/widgets/show_image.dart';
import 'package:shops/widgets/show_title.dart';

class MyDialog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image4),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                //Navigator.pop(context);
                await Geolocator.openLocationSettings();
                exit(0);
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image1),
          title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
          subtitle:
              ShowTitle(title: message, textStyle: MyConstant().h3Style()),
        ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }
}
