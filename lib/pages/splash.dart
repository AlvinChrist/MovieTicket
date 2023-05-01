import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_ticket/main.dart';

import '../consts/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() =>  _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation spreadRadius;
    @override
    void initState() {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      );
      _controller.repeat(reverse: true);
      spreadRadius = Tween<double>(begin: 2.5, end: 8.0).animate(_controller)..addListener(() {
        setState(() {});
      });
      super.initState();
      
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(
              settings: const RouteSettings(name: "/"),
              builder: (context) => const RoutingPage()
            )
          );
        }
      );
    }

    @override
    void dispose(){
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: primaryBlack,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
                Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: primaryOrange,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: primaryOrange.withOpacity(0.45),
                          spreadRadius: spreadRadius.value,
                          blurRadius: spreadRadius.value * 2,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset(
                      'assets/images/triangle.svg',
                      semanticsLabel: 'Acme Logo'
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}