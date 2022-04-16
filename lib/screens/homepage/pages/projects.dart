import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/AppAssets/projectcolors.dart';
import 'package:portfolio/constants/functions/gap.dart';
import 'package:portfolio/constants/functions/print.dart';
import 'package:portfolio/controllers/projectcontroller.dart';
import 'package:provider/provider.dart';

import '../../../constants/enums.dart';
import '../components/projectlists.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.2,
      ),
      child: ChangeNotifierProvider<ProjectContraoller>(
        create: (_) => ProjectContraoller(),
        child: Consumer<ProjectContraoller>(
          builder: ((context, projectcontroller, child) {
            return Column(
              children: [
                const Text(
                  "My Projects",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Container(
                    height: size.height * 0.002,
                    width: size.width * 0.2,
                    color: Colors.orange,
                  ),
                ),
                GridView.builder(
                  itemCount: projectcontroller.totalSize,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width < 1100 ? 1 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    var ourapps = ourapplists[index];
                    return InkWell(
                      onTap: () {},
                      onHover: (value) {
                        projectcontroller.gethoverbooleancategory(
                            values: value, hoverCurrentIndex: index);
                      },
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 300),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: projectcontroller.onhover == true &&
                                    projectcontroller.hoverIndex == index
                                ? 1.1
                                : 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: projectcontroller.onhover == true &&
                                        projectcontroller.hoverIndex == index
                                    ? size.height * 0.03
                                    : size.height * 0.01,
                                vertical: size.width * 0.03,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF112240),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.015,
                                      vertical: size.height * 0.005),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(ourapps.image!),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.exit_to_app))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.02),
                                        child: Text(
                                          ourapps.title!,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1100
                                                  ? 20
                                                  : 20,
                                              color:
                                                  projectcontroller.onhover ==
                                                              true &&
                                                          projectcontroller
                                                                  .hoverIndex ==
                                                              index
                                                      ? ProjectColors.hoverColor
                                                      : Colors.white),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(ourapps.description!),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 500,
                          width: 50,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  },
                ),
                gapY(size.height * 0.009),
                InkWell(
                  onTap: () {
                    projectcontroller.updatethelists();
                  },
                  hoverColor: ProjectColors.hoverColor.withOpacity(0.2),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ProjectColors.hoverColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.015,
                          vertical: size.height * 0.015),
                      child: Text(
                        projectcontroller.showMore == false
                            ? 'Show More'
                            : "Hide Some",
                        style: const TextStyle(color: ProjectColors.hoverColor),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
