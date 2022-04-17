import 'package:flutter/material.dart';
import 'package:portfolio/constants/AppAssets/projectassets.dart';
import 'package:portfolio/constants/AppAssets/projectcolors.dart';
import 'package:portfolio/controllers/homecontroller.dart';
import 'package:portfolio/model/homeitemmodel.dart';
import 'package:portfolio/screens/homepage/pages/about.dart';
import 'package:portfolio/screens/homepage/pages/contact.dart';
import 'package:portfolio/screens/homepage/pages/homeviewscreen.dart';
import 'package:portfolio/screens/homepage/pages/projects.dart';
import 'package:portfolio/screens/responsivewidget.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../constants/enums.dart';
import '../../constants/externallinks.dart';
import '../../model/socialmediamodel.dart';
import 'components/homeitems.dart';
import 'dart:html' as html;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      Provider.of<HomeController>(context, listen: false).getCurrentIndex(
          inde: itemPositionsListener.itemPositions.value.first.index);
      //homecontroller.hoverindexcategory
      Provider.of<HomeController>(context, listen: false)
          .gethoverbooleancategory(
              hoverCurrentIndex:
                  itemPositionsListener.itemPositions.value.first.index,
              values: true);
    });
  }

  late ItemScrollController itemScrollController = ItemScrollController();

  late ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  List<HomeItmesWidgetModel> homewidgetlistsdesktop = [
    HomeItmesWidgetModel(
      id: 1,
      widget: const HomeViewScreen(),
    ),
    HomeItmesWidgetModel(
      id: 2,
      widget: const AboutScreen(),
    ),
    HomeItmesWidgetModel(
      id: 3,
      widget: const ProjectScreen(),
    ),
    HomeItmesWidgetModel(id: 4, widget: const ContactScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: profileoption(type: TypeEnum.mobile, size: size),
      desktop: profileoption(type: TypeEnum.desktop, size: size),
    );
  }

  Widget profileoption({TypeEnum? type, size}) {
    return Scaffold(
      backgroundColor: ProjectColors.backgroundColor,
      appBar: type == TypeEnum.mobile ? AppBar() : null,
      drawer: type == TypeEnum.mobile
          ? Drawer(
              child: ListView(
                padding: const EdgeInsets.all(20),
              ),
            )
          : null,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: size.width * 0.05,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          html.window.location.reload();
                        },
                        child: Image.asset(
                          ProjectAssets.logo,
                          height: size.height * 0.03,
                          width: size.width * 0.02,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: socialitems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Consumer<HomeController>(
                                  builder: ((context, homecontroller, child) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: homecontroller
                                                          .hoverindexforsocialitems ==
                                                      index &&
                                                  homecontroller
                                                          .onhoverforsocialitems ==
                                                      true
                                              ? 10.0
                                              : 8),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: socialitems[index].onTap!,
                                            hoverColor: Colors.transparent,
                                            onHover: (value) {
                                              homecontroller
                                                  .gethoverbooleanforsocial(
                                                      values: value,
                                                      hoverCurrentIndex: index);
                                            },
                                            child: Transform.translate(
                                              offset: const Offset(0, 0),
                                              child: Transform.scale(
                                                scale: homecontroller
                                                                .hoverindexforsocialitems ==
                                                            index &&
                                                        homecontroller
                                                                .onhoverforsocialitems ==
                                                            true
                                                    ? 1.5
                                                    : 1,
                                                child: Image.asset(
                                                  socialitems[index].icon!,
                                                  height: size.height * 0.03,
                                                  width: size.width * 0.02,
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
                          SizedBox(
                            height: size.height * 0.1,
                            child: Padding(
                              padding: EdgeInsets.only(top: size.height * 0.03),
                              child: Center(
                                child: Container(
                                  color: Colors.white54,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBars(),
                  Expanded(
                    child: Consumer<HomeController>(
                      builder: ((context, homecontroller, child) {
                        return ScrollablePositionedList.builder(
                          itemCount: homewidgetlistsdesktop.length,
                          itemScrollController: itemScrollController,
                          itemPositionsListener: itemPositionsListener,
                          itemBuilder: (context, index) {
                            return homewidgetlistsdesktop[index].widget!;
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBars() {
    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: List.generate(
              homeitems.length,
              (index) {
                var list = homeitems[index];
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<HomeController>(
                        builder: ((context, homecontroller, child) {
                          return MouseRegion(
                            onHover: (v) {},
                            child: InkWell(
                              onTap: () {
                                homecontroller.getCurrentIndex(inde: index);

                                itemScrollController.scrollTo(
                                    index: homecontroller.currentIndex,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOutCubic);
                              },
                              onHover: (value) {
                                homecontroller.gethoverbooleancategory(
                                    hoverCurrentIndex: index, values: value);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color:
                                            homecontroller.currentIndex == index
                                                ? Colors.white
                                                : Colors.transparent),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    list.title!,
                                    style: TextStyle(
                                        color:
                                            homecontroller.hoverindexcategory ==
                                                    index
                                                ? ProjectColors.hoverColor
                                                : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {
                html.window.open(ExternalLinksofProjects.cvLink, "text");
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Resume'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
