import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/constants/functions/gap.dart';
import 'package:portfolio/constants/projectassets.dart';
import 'package:portfolio/controllers/homecontroller.dart';
import 'package:portfolio/model/homeitemmodel.dart';
import 'package:portfolio/model/socialmediamodel.dart';
import 'package:portfolio/screens/homepage/components/projectlists.dart';
import 'package:portfolio/screens/responsivewidget.dart';
import 'package:provider/provider.dart';
import '../../constants/enums.dart';
import 'components/homeitems.dart';
import 'dart:html';

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
        widget: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              Size size = MediaQuery.of(context).size;
              return SizedBox(
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
                                style: TextStyle(
                                    fontSize: 80, color: Colors.white38),
                              ),
                              const Text('➡️ Flutter Developer'),
                              gapY(size.height * 0.05),
                              Row(
                                children: List.generate(
                                  socialitems.length,
                                  (index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: socialitems[index].onTap!,
                                            child: Container(
                                              height: size.height * 0.06,
                                              width: size.width * 0.03,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      socialitems[index].icon!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
            },
          ),
        ),
      ),
      HomeItmesWidgetModel(
        widget: Builder(
          builder: (context) {
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
                            style: TextStyle(fontSize: 40),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
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
                                          "https://scontent.fdac110-1.fna.fbcdn.net/v/t1.6435-9/69283336_2382559755193903_3600516658134777856_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=qAXjqNwFDlwAX--9jCD&_nc_ht=scontent.fdac110-1.fna&oh=00_AT-FU68Cko3o_Apg6nxESG0QOhwdZ6aoMYY0Epb2gXCfGw&oe=627A939A",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: SizedBox(
                                  height: size.height,
                                  child: const Text(
                                    "Hello World!\nI am Jahangir Alam, a Flutter Developer. I love combining the worlds of logic and creative design to make eye-catching, accessible, and user-frindly mobile applications and websites.\n\n Technology leads, society follows. The move towards increasing inclusivity and diversity in the industry through representation is of importance to me.\n\nI'm excited to make the leap and continue refining my skills with the right company.",
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
          },
        ),
      ),
      HomeItmesWidgetModel(
        widget: const Text('Services'),
      ),
      HomeItmesWidgetModel(
        widget: GridView.builder(
          itemCount: ourapplists.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            var ourapps = ourapplists[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhysicalModel(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                child: Image.asset(ourapps.image!),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 12),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    ourapps.title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    child: Text(ourapps.description!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlign: TextAlign.justify),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: InkWell(
                                    onTap: () {
                                      // printer(lists.downloadLink);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'DownLoad Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      HomeItmesWidgetModel(widget: Builder(builder: (context) {
        String phonenumber = '+8801713602901';
        String emailaddress = 'jahangircpi@gmail.com';
        Size size = MediaQuery.of(context).size;
        return Stack(
          children: [
            ClipPath(
              clipper: PictureClipper(),
              child: Container(
                height: size.height,
                width: size.width,
                // color: Color(0xFFE3EAED),

                color: Colors.deepPurple,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gapY(size.height * 0.05),
                textforabout("CONTACT ME", 20.0),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 6),
                  child: Container(
                    height: size.height * 0.005,
                    width: size.width * 0.2,
                    color: Colors.yellow,
                  ),
                ),
                gapY(size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Clipboard.setData(
                                        ClipboardData(text: phonenumber))
                                    .then(
                                  (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '$phonenumber Copied to your clipboard !'),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(phonenumber),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.035),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                      ClipboardData(text: emailaddress))
                                  .then(
                                (_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '$emailaddress copied to your clipboard !'),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text('jahangircpi@gmail.com')),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                gapY(size.height * 0.04),
                textforabout("Social Links", 20.0),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 6),
                  child: Container(
                    height: size.height * 0.003,
                    width: size.width * 0.08,
                    color: Colors.blue,
                  ),
                ),
                gapY(size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    socialitems.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: socialitems[index].onTap!,
                              child: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.03,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(socialitems[index].icon!),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                gapY(size.height * 0.05),
                textforabout("Have a Question?", 20.0),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textforabout("Feel free to keep in touch 😊", 18.0)),
              ],
            ),
          ],
        );
      })),
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
                    // openDownloadLink(ProjectAssets.facebook, 'facebook');
                    downloadFile('lib/screens/facebook.png');
                    // html.window.open(
                    //     "https://drive.google.com/drive/folders/1GWa8HcoWb0cHEAYFOz1hMP_oujJzDMk7",
                    //     "text");
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
                return homewidgetlistsdesktop[4].widget!;
              }),
            ),
          ),
        ],
      ),
    );
  }

  downloadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "Flutter Logo";
    anchorElement.click();
  }

  void openDownloadLink(String href, String filename) {
    html.document.createElement('a') as html.AnchorElement
      ..href = href
      ..download = filename
      ..dispatchEvent(html.Event.eventType('MouseEvent', 'click'));
  }

  Uri getHref() => Uri.parse(html.window.location.href);

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

  Widget textforabout(text, double size) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Variable",
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}

class PictureClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        0.0, size.height * 0.6, size.width * 0.30, size.height * 0.6);
    path.lineTo(size.width * 0.65, size.height * 0.6);

    path.quadraticBezierTo(
        size.width, size.height * 0.60, size.width, size.height * 0.37);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
