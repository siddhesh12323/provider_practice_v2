import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/providers/product_provider.dart';
import 'package:provider_practice_v2/screens/amazonclone%20level3/product_cart.dart';
import 'package:provider_practice_v2/screens/amazonclone%20level3/product_favorite.dart';

int activeIndex = 0;

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const Cart()),
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
                icon: const Icon(Icons.shopping_cart)),
            IconButton(onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const Favorites()),
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
            }, icon: const Icon(Icons.favorite)),
          ],
          centerTitle: true,
        ),
        body: Consumer<ProductProvider>(
          builder: (context, value, child) {
            final productList = value.products;
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product1 = productList[index];
                return Container(
                  height: 480,
                  // color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 410,
                              child: CarouselSlider.builder(
                                  itemCount: product1.productImages.length,
                                  itemBuilder: (context, index2, realIndex) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Image.asset(
                                        product1.productImages[index2],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(height: 400))),
                          Positioned(
                              bottom: 40,
                              right: 10,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                    onPressed: () {
                                      value.toggleFavorites(product1);
                                    },
                                    icon: product1.isProductFavorite
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_outline)),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product1.productname,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  '${product1.productRating}/5',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    value.toggleCart(product1);
                                  },
                                  child: Text(
                                    product1.isProductInCart ? "Remove from Cart" :
                                    "Add to Cart",
                                    style: const TextStyle(fontSize: 24),
                                  )),
                              Text(
                                "₹${product1.productCost}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
