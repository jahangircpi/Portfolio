import 'package:flutter/material.dart';
import 'package:portfolio/constants/functions/print.dart';
import 'package:portfolio/screens/homepage/components/abouttextlists.dart';
import 'package:provider/provider.dart';

import '../../../constants/functions/gap.dart';
import '../../../constants/AppAssets/projectassets.dart';
import '../../../controllers/homecontroller.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: size.width * 0.1,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapY(size.height * 0.2),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: abouttextlists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          abouttextlists[index].title!,
                          style: TextStyle(
                              fontSize: abouttextlists[index].fontSize!),
                        );
                      },
                    ),
                    // gapY(size.height * 0.2),
                    // texting(text: 'WELCOME TO MY PORTFOLIO! 👋', fontsize: 16),
                    // gapY(size.height * 0.03),
                    // texting(text: 'Hi,', fontsize: 80),
                    // texting(text: "I'M Jahangir,", fontsize: 80),
                    // texting(text: "Flutter Developer", fontsize: 80),

                    // // const Text('➡️ Flutter Developer'),
                    // gapY(size.height * 0.05),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height,
                  child: Consumer<HomeController>(
                    builder: ((context, homecontroller, child) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.text,
                        onEnter: (v) {
                          // homecontroller.getTextHover(value: true);
                          // printer(homecontroller.texthover);
                        },
                        onExit: (value) {
                          // homecontroller.getTextHover(value: false);
                          // printer(homecontroller.texthover);
                        },
                        onHover: (value) {
                          //  homecontroller.getTextHover(value: value);
                        },
                        child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 300),
                            tween: Tween<double>(
                                begin: 1.0,
                                end:
                                    homecontroller.texthover == true ? 1.3 : 1),
                            builder: (_, size, __) {
                              return Transform.scale(
                                scale: 1.2,
                                child: Image.asset(
                                  ProjectAssets.photo,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget texting({text, fontsize}) {
    return Consumer<HomeController>(
      builder: ((context, homecontroller, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.text,
          onEnter: (v) {
            homecontroller.getTextHover(value: true);
            printer(homecontroller.texthover);
          },
          onExit: (value) {
            homecontroller.getTextHover(value: false);
            printer(homecontroller.texthover);
          },
          onHover: (value) {
            //  homecontroller.getTextHover(value: value);
          },
          child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 300),
              tween: Tween<double>(
                  begin: 1.0, end: homecontroller.texthover == true ? 1.3 : 1),
              builder: (_, size, __) {
                return Transform.scale(
                  scale: homecontroller.texthover == true ? 1.2 : 1,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: fontsize),
                  ),
                );
              }),
        );
      }),
    );
  }
}
