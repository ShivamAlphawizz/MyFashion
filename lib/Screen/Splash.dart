// import 'dart:async';

// import 'package:eshop_multivendor/Provider/SettingProvider.dart';
// import 'package:eshop_multivendor/Screen/Intro_Slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// import '../Helper/Color.dart';
// import '../Helper/Session.dart';
// import '../Helper/String.dart';

// class Splash extends StatefulWidget {
//   @override
//   _SplashScreen createState() => _SplashScreen();
// }

// class _SplashScreen extends State<Splash> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top]);
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ));
//     _controller = VideoPlayerController.asset("assets/images/SplashSize.m4v");
//     _controller.initialize().then((_) {
//       //  _controller.setLooping(true);
//       Timer(Duration(seconds: 1), () {
//         setState(() {
//           _controller.play();
//           // _visible = true;
//         });
//       });
//     });

//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       return startTime();
//     });
//   }

//   _getVideoBackground() {
//     return AnimatedOpacity(
//       opacity: 1.0,
//       duration: Duration(milliseconds: 1000),
//       child: VideoPlayer(_controller),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  SystemChrome.setEnabledSystemUIOverlays([]);
//     return Scaffold(
//         backgroundColor: Colors.white,
//         //key: _scaffoldKey,
//         // bottomNavigationBar:Image.asset(
//         //   'assets/images/splash.png',
//         // ),
//         body: Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             // height: 150,
//             //  height: 150,
//             // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
//             alignment: Alignment.center,
//             // decoration: BoxDecoration(
//             //   image: DecorationImage(
//             //       image: AssetImage("assets/images/Logo.png"),
//             //       fit: BoxFit.fill
//             //   ),
//             // ),
//             child: _getVideoBackground(),
//           ),
//         ));
//   }

//   startTime() async {
//     return navigationPage();
//     // var _duration = Duration(seconds: 2);
//     // return Timer(_duration, navigationPage);
//   }

//   Future<void> navigationPage() async {
//     SettingProvider settingsProvider =
//         Provider.of<SettingProvider>(this.context, listen: false);

//     bool isFirstTime = await settingsProvider.getPrefrenceBool(ISFIRSTTIME);
//     if (isFirstTime) {
//       Navigator.pushReplacementNamed(context, "/home");
//     } else {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => IntroSlider(),
//           ));
//     }
//   }

//   setSnackbar(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//       content: new Text(
//         msg,
//         textAlign: TextAlign.center,
//         style: TextStyle(color: Theme.of(context).colorScheme.black),
//       ),
//       backgroundColor: Theme.of(context).colorScheme.white,
//       elevation: 1.0,
//     ));
//   }

//   @override
//   void dispose() {
//     //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     super.dispose();
//   }
// }

import 'dart:async';

import 'package:eshop_multivendor/Provider/SettingProvider.dart';
import 'package:eshop_multivendor/Screen/Intro_Slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Helper/Color.dart';
import '../Helper/Session.dart';
import '../Helper/String.dart';

class Splash extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    //  SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        backgroundColor: Colors.white,
        //key: _scaffoldKey,
        // bottomNavigationBar:Image.asset(
        //   'assets/images/splash.png',
        // ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 150,
            height: MediaQuery.of(context).size.height,
            // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/newSplash.jpeg"),
                  fit: BoxFit.fill),
            ),
          ),
        ));
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    SettingProvider settingsProvider =
        Provider.of<SettingProvider>(this.context, listen: false);

    bool isFirstTime = await settingsProvider.getPrefrenceBool(ISFIRSTTIME);
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroSlider(),
          ));
    }
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.black),
      ),
      backgroundColor: Theme.of(context).colorScheme.white,
      elevation: 1.0,
    ));
  }

  @override
  void dispose() {
    //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
}
