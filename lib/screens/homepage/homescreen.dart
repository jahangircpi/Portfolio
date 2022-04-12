import 'package:flutter/material.dart';
import 'package:portfolio/constants/functions/gap.dart';
import 'package:portfolio/constants/functions/print.dart';
import 'package:portfolio/controllers/homecontroller.dart';
import 'package:portfolio/model/homeitemmodel.dart';
import 'package:portfolio/model/socialmediamodel.dart';
import 'package:portfolio/screens/responsivewidget.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import 'components/homeitems.dart';

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
    List<HomeItmesWidgetModel> homewidgetlists = [
      HomeItmesWidgetModel(
        widget: SingleChildScrollView(
          child: SizedBox(
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
                          gapY(100),
                          const Text('WELCOME TO MY PORTFOLIO! 👋'),
                          gapY(50),
                          const Text(
                            'Jahangir',
                            style: TextStyle(fontSize: 80),
                          ),
                          const Text(
                            'Alam',
                            style:
                                TextStyle(fontSize: 80, color: Colors.white38),
                          ),
                          const Text('➡️ Flutter Developer'),
                          gapY(50),
                          Row(
                            children:
                                List.generate(socialitems.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Column(
                                  children: [
                                    Icon(socialitems[index].icon!),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Image.asset(
                        'assets/images/photo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      HomeItmesWidgetModel(
        widget: const Text('About'),
      ),
      HomeItmesWidgetModel(
        widget: const Text('Services'),
      ),
      HomeItmesWidgetModel(
        widget: const Text('Projects'),
      ),
      HomeItmesWidgetModel(
        widget: const Text('Contacts'),
      ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                                    printer(homecontroller.currentIndex);
                                  },
                                  child: Text(list.title!),
                                );
                              }))),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
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
              ],
            ),
            Expanded(
              child: Consumer<HomeController>(
                builder: ((context, homecontroller, child) {
                  return homewidgetlists[homecontroller.currentIndex].widget!;
                }),
              ),
            ),
          ],
        ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(list.title!),
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
