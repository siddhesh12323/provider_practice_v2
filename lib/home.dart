import 'package:flutter/material.dart';
import 'package:provider_practice_v2/page_1.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true,),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const Page1()),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0, 1);
                      const end = Offset.zero;
                      var curve = Curves.easeIn;
                      var curveTween = CurveTween(curve: curve);
                      final tween =
                          Tween(begin: begin, end: end).chain(curveTween);
                      final offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    }));
              }, child: const Text('Level 1')),              
            ],
          ),
        ),
    );
  }
}