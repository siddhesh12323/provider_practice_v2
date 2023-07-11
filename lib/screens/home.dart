import 'package:flutter/material.dart';
import 'package:provider_practice_v2/screens/list%20level2/list_example.dart';
import 'package:provider_practice_v2/screens/counter%20level1/page_1.dart';
import 'package:provider_practice_v2/screens/api%20data%20fetching%20level4/album_screen.dart';
import 'package:provider_practice_v2/screens/loading%20large%20jsons%20level5/image_screen.dart';
import 'package:provider_practice_v2/screens/amazonclone%20level3/product_page.dart';
import 'package:provider_practice_v2/screens/networking%20level6/todo_screen.dart';

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
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        ListExamplePage1()),
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
              }, child: const Text('Level 2')),
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const ProductPage()),
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
              }, child: const Text('Level 3')),
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const AlbumScreen()),
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
              }, child: const Text('Fetching Data from APIs Level 4')),
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const ImageScreen()),
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
              }, child: const Text('Parse JSON in background Level 5')),   
              const SizedBox(height: 20,),
              TextButton(onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const ToDoScreen()),
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
              }, child: const Text('Networking Level 1')),             
            ],
          ),
        ),
    );
  }
}