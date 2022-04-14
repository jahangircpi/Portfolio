import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/functions/gap.dart';
import '../../../constants/projectassets.dart';
import '../../../controllers/homecontroller.dart';
import '../../../model/socialmediamodel.dart';

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
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapY(size.height * 0.2),
                    const Text('WELCOME TO MY PORTFOLIO! 👋'),
                    gapY(size.height * 0.03),
                    const Text(
                      'Jahangir',
                      style: TextStyle(fontSize: 80),
                    ),
                    const Text(
                      'Alam',
                      style: TextStyle(fontSize: 80, color: Colors.white38),
                    ),
                    const Text('➡️ Flutter Developer'),
                    gapY(size.height * 0.05),
                    Row(
                      children: List.generate(
                        socialitems.length,
                        (index) {
                          return Consumer<HomeController>(
                            builder: ((context, homecontroller, child) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        homecontroller.hoverindex == index &&
                                                homecontroller.onhover == true
                                            ? 15.0
                                            : 8),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: socialitems[index].onTap!,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        homecontroller.gethoverboolean(
                                            values: value,
                                            hoverCurrentIndex: index);
                                      },
                                      child: Transform.translate(
                                        offset: homecontroller.hoverindex ==
                                                    index &&
                                                homecontroller.onhover == true
                                            ? const Offset(0, 0)
                                            : const Offset(0, 0),
                                        child: Transform.scale(
                                          scale: homecontroller.hoverindex ==
                                                      index &&
                                                  homecontroller.onhover == true
                                              ? 2
                                              : 1,
                                          child: Image.asset(
                                            socialitems[index].icon!,
                                            height: size.height * 0.06,
                                            width: size.width * 0.03,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Image.asset(
                  ProjectAssets.photo,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
