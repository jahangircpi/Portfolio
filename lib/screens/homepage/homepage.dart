// import 'dart:html' as html;

// import 'package:flutter/material.dart';

// import '../responsivewidget.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   List<Widget> navButtons() => [
//         NavButton(
//           text: "about",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),import 'dart:html' as html;

// import 'package:flutter/material.dart';

// import '../responsivewidget.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   List<Widget> navButtons() => [
//         NavButton(
//           text: "about",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),
//         NavButton(
//           text: "work",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),
//         NavButton(
//           text: "contact",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Responsive(
//       mobile: Container(),
//       desktop: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.black,
//         ),
//         // drawer: Responsive.desktop(context)
//         //     ? Drawer(
//         //         child: ListView(
//         //           padding: const EdgeInsets.all(20),
//         //           children: navButtons(),
//         //         ),
//         //       )
//         //     : null,
//         body: SingleChildScrollView(
//           child: AnimatedPadding(
//             duration: const Duration(seconds: 1),
//             padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
//             // child: ResponsiveWidget(
//             //   largeScreen: Column(
//             //     mainAxisAlignment: MainAxisAlignment.start,
//             //     children: <Widget>[
//             //       NavHeader(navButtons: navButtons()),
//             //       SizedBox(
//             //         height: MediaQuery.of(context).size.height * 0.1,
//             //       ),
//             //       ProfileInfo(),
//             //       SizedBox(
//             //         height: MediaQuery.of(context).size.height * 0.2,
//             //       ),
//             //       const SocialInfo(),
//             //     ],
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NavHeader extends StatelessWidget {
//   final List<Widget>? navButtons;

//   const NavHeader({Key? key, this.navButtons}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
//             ? MainAxisAlignment.center
//             : MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           PKDot(),
// //          Spacer(),
//           if (!ResponsiveWidget.isSmallScreen(context))
//             Row(
//               children: navButtons!,
//             )
//         ],
//       ),
//     );
//   }
// }

// class PKDot extends StatelessWidget {
//   const PKDot({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         const Text(
//           "PK MTECHVIRAL",
//           textScaleFactor: 2,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         AnimatedContainer(
//           duration: const Duration(seconds: 1),
//           height: 8,
//           width: 8,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.orange,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class NavButton extends StatelessWidget {
//   final String? text;
//   final Function()? onPressed;
//   final Color color;

//   const NavButton(
//       {Key? key,
//       @required this.text,
//       @required this.onPressed,
//       this.color = Colors.orange})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       child: Text(text!),
//       borderSide: BorderSide(
//         color: color,
//       ),
//       onPressed: onPressed,
//       highlightedBorderColor: color,
//     );
//   }
// }

// class ProfileInfo extends StatelessWidget {
//   profileImage(context) => Container(
//         height: ResponsiveWidget.isSmallScreen(context)
//             ? MediaQuery.of(context).size.height * 0.25
//             : MediaQuery.of(context).size.width * 0.25,
//         width: ResponsiveWidget.isSmallScreen(context)
//             ? MediaQuery.of(context).size.height * 0.25
//             : MediaQuery.of(context).size.width * 0.25,
//         decoration: const BoxDecoration(
//           backgroundBlendMode: BlendMode.luminosity,
//           color: Colors.deepOrange,
// //            borderRadius: BorderRadius.circular(40),
//           shape: BoxShape.circle,
//           // image: DecorationImage(
//           //   image: AssetImage("pk.jpg"),
//           //   alignment: Alignment.center,
//           //   fit: BoxFit.cover,
//           // ),
//         ),
//         child: const FlutterLogo(),
//       );

//   final profileData = Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       const Text(
//         "Hi there! My name is",
//         textScaleFactor: 2,
//         style: TextStyle(color: Colors.orange),
//       ),
//       const Text(
//         "Jahangir\nAlam",
//         textScaleFactor: 5,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       const Text(
//         "A Google Developer Expert for Flutter, Dart & Web Tech.\n"
//         "I am also a youtuber having MTechViral youtube channel\n"
//         "where I make tutorials for technology.",
//         softWrap: true,
//         textScaleFactor: 1.5,
//         style: TextStyle(color: Colors.white70),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           RaisedButton(
//             shape: const StadiumBorder(),
//             child: const Text("Resume"),
//             color: Colors.red,
//             onPressed: () {
//               html.window.open(
//                   "https://google-developers.appspot.com/community/experts/directory/profile/profile-pawan_kumar",
//                   "GDE");
//             },
//             padding: const EdgeInsets.all(10),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           OutlineButton(
//             borderSide: const BorderSide(
//               color: Colors.red,
//             ),
//             shape: const StadiumBorder(),
//             child: const Text("Say Hi!"),
//             color: Colors.red,
//             onPressed: () {
//               html.window.open("https://pawan.live", "Pk");
//             },
//             padding: const EdgeInsets.all(10),
//           )
//         ],
//       )
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[profileImage(context), profileData],
//       ),
//       smallScreen: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           profileImage(context),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.1,
//           ),
//           profileData
//         ],
//       ),
//     );
//   }
// }

// class SocialInfo extends StatelessWidget {
//   const SocialInfo({Key? key}) : super(key: key);

//   List<Widget> socialMediaWidgets() {
//     return [
//       NavButton(
//         text: "Github",
//         onPressed: () {
//           html.window.open("https://github.com/jahangircpi", "Git");
//         },
//         color: Colors.blue,
//       ),
//       NavButton(
//         text: "Twitter",
//         onPressed: () {
//           html.window.open("https://twitter.com/imthepk", "Twitter");
//         },
//         color: Colors.blue,
//       ),
//       NavButton(
//         text: "Facebook",
//         onPressed: () {
//           html.window.open("https://facebook.com/thepawankumaar", "Fb");
//         },
//         color: Colors.blue,
//       ),
//     ];
//   }

//   Widget copyRightText() => const Text(
//         "Pawan Kumar ©️2019",
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: Colors.grey,
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: socialMediaWidgets(),
//           ),
//           copyRightText(),
//         ],
//       ),
//       smallScreen: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           ...socialMediaWidgets(),
//           copyRightText(),
//         ],
//       ),
//     );
//   }
// }

//         NavButton(
//           text: "work",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),
//         NavButton(
//           text: "contact",
//           onPressed: () {
//             html.window.open("https://pawan.live", "Pk");
//           },
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Responsive(
//       mobile: Container(),
//       desktop: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.black,
//         ),
//         // drawer: Responsive.desktop(context)
//         //     ? Drawer(
//         //         child: ListView(
//         //           padding: const EdgeInsets.all(20),
//         //           children: navButtons(),
//         //         ),
//         //       )
//         //     : null,
//         body: SingleChildScrollView(
//           child: AnimatedPadding(
//             duration: const Duration(seconds: 1),
//             padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
//             // child: ResponsiveWidget(
//             //   largeScreen: Column(
//             //     mainAxisAlignment: MainAxisAlignment.start,
//             //     children: <Widget>[
//             //       NavHeader(navButtons: navButtons()),
//             //       SizedBox(
//             //         height: MediaQuery.of(context).size.height * 0.1,
//             //       ),
//             //       ProfileInfo(),
//             //       SizedBox(
//             //         height: MediaQuery.of(context).size.height * 0.2,
//             //       ),
//             //       const SocialInfo(),
//             //     ],
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NavHeader extends StatelessWidget {
//   final List<Widget>? navButtons;

//   const NavHeader({Key? key, this.navButtons}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
//             ? MainAxisAlignment.center
//             : MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           PKDot(),
// //          Spacer(),
//           if (!ResponsiveWidget.isSmallScreen(context))
//             Row(
//               children: navButtons!,
//             )
//         ],
//       ),
//     );
//   }
// }

// class PKDot extends StatelessWidget {
//   const PKDot({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         const Text(
//           "PK MTECHVIRAL",
//           textScaleFactor: 2,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         AnimatedContainer(
//           duration: const Duration(seconds: 1),
//           height: 8,
//           width: 8,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.orange,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class NavButton extends StatelessWidget {
//   final String? text;
//   final Function()? onPressed;
//   final Color color;

//   const NavButton(
//       {Key? key,
//       @required this.text,
//       @required this.onPressed,
//       this.color = Colors.orange})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       child: Text(text!),
//       borderSide: BorderSide(
//         color: color,
//       ),
//       onPressed: onPressed,
//       highlightedBorderColor: color,
//     );
//   }
// }

// class ProfileInfo extends StatelessWidget {
//   profileImage(context) => Container(
//         height: ResponsiveWidget.isSmallScreen(context)
//             ? MediaQuery.of(context).size.height * 0.25
//             : MediaQuery.of(context).size.width * 0.25,
//         width: ResponsiveWidget.isSmallScreen(context)
//             ? MediaQuery.of(context).size.height * 0.25
//             : MediaQuery.of(context).size.width * 0.25,
//         decoration: const BoxDecoration(
//           backgroundBlendMode: BlendMode.luminosity,
//           color: Colors.deepOrange,
// //            borderRadius: BorderRadius.circular(40),
//           shape: BoxShape.circle,
//           // image: DecorationImage(
//           //   image: AssetImage("pk.jpg"),
//           //   alignment: Alignment.center,
//           //   fit: BoxFit.cover,
//           // ),
//         ),
//         child: const FlutterLogo(),
//       );

//   final profileData = Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       const Text(
//         "Hi there! My name is",
//         textScaleFactor: 2,
//         style: TextStyle(color: Colors.orange),
//       ),
//       const Text(
//         "Jahangir\nAlam",
//         textScaleFactor: 5,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       const Text(
//         "A Google Developer Expert for Flutter, Dart & Web Tech.\n"
//         "I am also a youtuber having MTechViral youtube channel\n"
//         "where I make tutorials for technology.",
//         softWrap: true,
//         textScaleFactor: 1.5,
//         style: TextStyle(color: Colors.white70),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           RaisedButton(
//             shape: const StadiumBorder(),
//             child: const Text("Resume"),
//             color: Colors.red,
//             onPressed: () {
//               html.window.open(
//                   "https://google-developers.appspot.com/community/experts/directory/profile/profile-pawan_kumar",
//                   "GDE");
//             },
//             padding: const EdgeInsets.all(10),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           OutlineButton(
//             borderSide: const BorderSide(
//               color: Colors.red,
//             ),
//             shape: const StadiumBorder(),
//             child: const Text("Say Hi!"),
//             color: Colors.red,
//             onPressed: () {
//               html.window.open("https://pawan.live", "Pk");
//             },
//             padding: const EdgeInsets.all(10),
//           )
//         ],
//       )
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[profileImage(context), profileData],
//       ),
//       smallScreen: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           profileImage(context),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.1,
//           ),
//           profileData
//         ],
//       ),
//     );
//   }
// }

// class SocialInfo extends StatelessWidget {
//   const SocialInfo({Key? key}) : super(key: key);

//   List<Widget> socialMediaWidgets() {
//     return [
//       NavButton(
//         text: "Github",
//         onPressed: () {
//           html.window.open("https://github.com/jahangircpi", "Git");
//         },
//         color: Colors.blue,
//       ),
//       NavButton(
//         text: "Twitter",
//         onPressed: () {
//           html.window.open("https://twitter.com/imthepk", "Twitter");
//         },
//         color: Colors.blue,
//       ),
//       NavButton(
//         text: "Facebook",
//         onPressed: () {
//           html.window.open("https://facebook.com/thepawankumaar", "Fb");
//         },
//         color: Colors.blue,
//       ),
//     ];
//   }

//   Widget copyRightText() => const Text(
//         "Pawan Kumar ©️2019",
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: Colors.grey,
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: socialMediaWidgets(),
//           ),
//           copyRightText(),
//         ],
//       ),
//       smallScreen: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           ...socialMediaWidgets(),
//           copyRightText(),
//         ],
//       ),
//     );
//   }
// }
