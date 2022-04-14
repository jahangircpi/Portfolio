import 'package:flutter/material.dart';
import 'package:portfolio/controllers/homecontroller.dart';
import 'package:portfolio/model/homeitemmodel.dart';
import 'package:portfolio/screens/homepage/pages/about.dart';
import 'package:portfolio/screens/homepage/pages/contact.dart';
import 'package:portfolio/screens/homepage/pages/homeviewscreen.dart';
import 'package:portfolio/screens/homepage/pages/projects.dart';
import 'package:portfolio/screens/responsivewidget.dart';
import 'package:provider/provider.dart';
import '../../constants/enums.dart';
import 'components/homeitems.dart';
import 'dart:html' as html;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: profileoption(type: TypeEnum.mobile),
      desktop: profileoption(type: TypeEnum.desktop),
    );
  }

  Widget profileoption({TypeEnum? type}) {
    List<HomeItmesWidgetModel> homewidgetlistsdesktop = [
      HomeItmesWidgetModel(
        widget: const HomeViewScreen(),
      ),
      HomeItmesWidgetModel(
        widget: const AboutScreen(),
      ),
      HomeItmesWidgetModel(
        widget: const Text('Services'),
      ),
      HomeItmesWidgetModel(
        widget: const ProjectScreen(),
      ),
      HomeItmesWidgetModel(widget: const ContactScreen()),
    ];
    return Scaffold(
      appBar: type == TypeEnum.mobile ? AppBar() : null,
      drawer: type == TypeEnum.mobile
          ? Drawer(
              child: ListView(
                padding: const EdgeInsets.all(20),
              ),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                              return InkWell(
                                onTap: () {
                                  homecontroller.getCurrentIndex(inde: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          homecontroller.currentIndex == index
                                              ? Colors.blue
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(list.title!),
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
                    html.window.open(
                        "https://drive.google.com/file/d/1O3lSSnwDBAFCFeCo07mgqao5UhvwmLZ2/view?usp=sharing",
                        "text");
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
          Expanded(
            child: Consumer<HomeController>(
              builder: ((context, homecontroller, child) {
                return homewidgetlistsdesktop[homecontroller.currentIndex]
                    .widget!;
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        const Expanded(child: SizedBox.shrink()),
        Expanded(
          child: Row(
            children: List.generate(
              homeitems.length,
              (index) {
                var list = homeitems[index];
                return Row(
                  children: [
                    Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(list.title!),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
    );
  }
}
