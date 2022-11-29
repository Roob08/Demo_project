import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeModel {
  String name;
  AssetImage image;
  Icon icon;
  String subtitle;

  HomeModel({
    required this.name,
    required this.image,
    required this.icon,
    required this.subtitle,
  });
}
