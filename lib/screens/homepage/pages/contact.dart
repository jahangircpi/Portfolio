import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/functions/gap.dart';
import '../../../model/socialmediamodel.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);
  final String phonenumber = '+8801713602901';
  final String emailaddress = 'jahangircpi@gmail.com';

  @override
  Widget build(BuildContext context) {
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
                            Clipboard.setData(ClipboardData(text: phonenumber))
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
                          Clipboard.setData(ClipboardData(text: emailaddress))
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
                            child: Center(child: Text('jahangircpi@gmail.com')),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            gapY(size.height * 0.03),
            textforabout("Social Links", 20.0),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6),
              child: Container(
                height: size.height * 0.003,
                width: size.width * 0.08,
                color: Colors.blue,
              ),
            ),
            // gapY(size.height * 0.01),
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
            gapY(size.height * 0.03),
            textforabout("Address", 20.0),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6),
              child: Container(
                height: size.height * 0.003,
                width: size.width * 0.08,
                color: Colors.blue,
              ),
            ),
            textforabout("60 feet, Agargaon,Dhaka ,Bangladesh", 18.0),
            gapY(size.height * 0.03),
            textforabout("Have a Question?", 20.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: textforabout("Feel free to keep in touch 😊", 18.0)),
          ],
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
