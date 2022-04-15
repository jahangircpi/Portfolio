import 'package:flutter/material.dart';
import 'package:portfolio/constants/AppAssets/projecttexts.dart';
import 'package:portfolio/constants/externallinks.dart';

import '../../../constants/functions/gap.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: size.width * 0.14,
              child: Column(
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          gapY(size.height * 0.04),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: size.height,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    ExternalLinksofProjects.aboutPagePicture),
                                fit: BoxFit.cover),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: SizedBox(
                          height: size.height,
                          child: const Text(
                            ProjectTexts.aboutText,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
