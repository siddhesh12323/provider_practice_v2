import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_class.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2'), centerTitle: true,),
      body: 
      // SingleChildScrollView(
      //   child: 
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<Level1Class>(
              builder: (context, page1classobject, child) {
                return Text('${page1classobject.x}',
                    style: Theme.of(context).textTheme.displayLarge);
              },
            ),
              const SizedBox(height: 40,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  IconButton.outlined(onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .decrement();
                  }, icon: const Icon(Icons.remove), iconSize: 40,),
                  const Spacer(),
                  IconButton.outlined(onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .increment();
                  }, icon: const Icon(Icons.add), iconSize: 40,),
                  const Spacer(),
                  IconButton.outlined(onPressed: () {
                    Provider.of<Level1Class>(context, listen: false)
                        .reset();
                  }, icon: const Icon(Icons.delete_outline), iconSize: 40,),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      //),
    );
  }
}