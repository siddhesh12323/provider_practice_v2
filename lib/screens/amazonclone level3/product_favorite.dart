import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/providers/product_provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          final favoriteProducts = value.favoriteProducts;
          return favoriteProducts.isNotEmpty
              ? ListView.builder(
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final favoriteProduct = favoriteProducts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 480,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(favoriteProduct.productname),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(favoriteProduct.productInfo),
                              ],
                            ),
                            const Spacer(),
                            Stack(
                              children: [
                                Image.asset(
                                  favoriteProduct.productImages[0],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        value.toggleFavorites(favoriteProduct);
                                      },
                                      icon: const Icon(Icons.favorite)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("No favorites yet"),
                );
        },
      ),
    );
  }
}
