import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/providers/product_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          final cartItems = value.cartProducts;
          double total = 0;
          for (int i = 0; i < cartItems.length; i++) {
            total = total +
                (cartItems[i].productCost * cartItems[i].noOfProductsInCart);
          }
          return cartItems.isNotEmpty
              ? Stack(
                  children: [
                    ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Container(
                            height: 480,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(cartItem.productname),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                        "${cartItem.productCost * cartItem.noOfProductsInCart}"),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: const Icon(Icons.remove),
                                          onTap: () {
                                            value.reduceNumberOfProducts(
                                                cartItem);
                                          },
                                        ),
                                        Text("${cartItem.noOfProductsInCart}"),
                                        GestureDetector(
                                          child: const Icon(Icons.add),
                                          onTap: () {
                                            value.addAnother(cartItem);
                                          },
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          value.toggleCart(cartItem);
                                        },
                                        child: const Text("Remove from cart"))
                                  ],
                                ),
                                const Spacer(),
                                Image.asset(
                                  cartItem.productImages[0],
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 60,
                        color: Colors.grey,
                        child: Row(
                          children: [
                            const Text("Total"),
                            const Spacer(),
                            Text(total.toString()),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : const Center(child: Text("Cart is empty"));
        },
      ),
    );
  }
}
