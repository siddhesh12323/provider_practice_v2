import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/counter_class.dart';
import 'package:provider_practice_v2/providers/item_provider.dart';
import 'package:provider_practice_v2/providers/product_provider.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

Color brandColor = const Color.fromARGB(255, 52, 194, 226);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Level1Class>(
          create: (_) => Level1Class(),
        ),
        ChangeNotifierProvider<ItemListProvider>(
          create: (_) => ItemListProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider())
      ],
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        if (lightDynamic != null && dark != null) {
          lightColorScheme = lightDynamic.harmonized()..copyWith();
          lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
          darkColorScheme = dark.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
          darkColorScheme = ColorScheme.fromSeed(
              seedColor: brandColor, brightness: Brightness.dark);
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider Practice',
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme: ThemeData.dark(useMaterial3: true),
          home: const Home(),
        );
      }),
    );
  
  }
}
