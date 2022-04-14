import 'package:flutter/material.dart';

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
                    style: TextStyle(fontSize: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
  }
}
