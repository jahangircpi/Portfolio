import 'package:portfolio/constants/AppAssets/projectassets.dart';
import 'dart:html' as html;

class SocialMediaModel {
  String? title;
  Function()? onTap;
  String? icon;
  SocialMediaModel({this.onTap, this.title, this.icon});
}

List<SocialMediaModel> socialitems = [
  SocialMediaModel(
      title: 'GitHub',
      onTap: () {
        html.window.open("https://github.com/jahangircpi", "Github");
      },
      icon: ProjectAssets.github),
  SocialMediaModel(
      title: 'Facebook',
      onTap: () {
        html.window.open("https://www.facebook.com/Jahangircpi/", "Facebook");
      },
      icon: ProjectAssets.facebook),
  SocialMediaModel(
      title: 'Linkedin',
      onTap: () {
        html.window.open(
            "https://www.linkedin.com/in/jahangir-alam-138907163/", "Linkedin");
      },
      icon: ProjectAssets.linkdin),
  SocialMediaModel(
      title: 'Twitter',
      onTap: () {
        html.window.open("https://twitter.com/jahangircpi/", "Twitter");
      },
      icon: ProjectAssets.twitter),
  SocialMediaModel(
      title: 'Instagram',
      onTap: () {
        html.window.open("https://www.instagram.com/jahangircpi/", "Instagram");
      },
      icon: ProjectAssets.instagram),
];
