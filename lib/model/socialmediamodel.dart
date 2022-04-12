import 'package:flutter/material.dart';

class SocialMediaModel {
  String? title;
  Function()? onTap;
  IconData? icon;
  SocialMediaModel({this.onTap, this.title, this.icon});
}

List<SocialMediaModel> socialitems = [
  SocialMediaModel(title: 'Facebook', onTap: () {}, icon: Icons.facebook),
  SocialMediaModel(title: 'GitHub', onTap: () {}, icon: Icons.facebook),
  SocialMediaModel(title: 'Linkedin', onTap: () {}, icon: Icons.facebook),
  SocialMediaModel(title: 'Twitter', onTap: () {}, icon: Icons.facebook),
  SocialMediaModel(title: 'Instagram', onTap: () {}, icon: Icons.facebook),
];
