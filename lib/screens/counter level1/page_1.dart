import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/providers/counter_provider.dart';
import 'package:provider_practice_v2/screens/counter%20level1/page_2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<Level1Class>(
              builder: (context, page1classobject, child) {
                return Text('${page1classobject.x}',
                    style: Theme.of(context).textTheme.displayLarge);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                IconButton.outlined(
                  onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .decrement();
                  },
                  icon: const Icon(Icons.remove),
                  iconSize: 40,
                ),
                const Spacer(),
                IconButton.outlined(
                  onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .increment();
                  },
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
                const Spacer(),
                IconButton.outlined(
                  onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .reset();
                  },
                  icon: const Icon(Icons.delete_outline),
                  iconSize: 40,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const Page2()),
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
                },
                child: const Text('Go Forward')),
          ],
        ),
      ),
      //),
    );
  }
}
