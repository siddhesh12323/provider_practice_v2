// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider_practice_v2/classes/product_class.dart';

class ProductProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Product> _products = [
    Product(
        productname: "Samsung Galaxy S23 Ultra",
        productRating: 4.7,
        productCost: 125000,
        productImages: [
          "assets/s23u/s23u1.png",
          "assets/s23u/s23u2.png",
          "assets/s23u/s23u3.png",
          "assets/s23u/s23u4.png",
          "assets/s23u/s23u5.png"
        ],
        productInfo: "Samsung Galaxy S23 Ultra info"),
    Product(
        productname: "Nvidia GeForce RTX 3060",
        productRating: 4.8,
        productCost: 40000,
        productImages: [
          "assets/rtx3060/rtx30601.png",
          "assets/rtx3060/rtx30602.png",
          "assets/rtx3060/rtx30603.png",
          "assets/rtx3060/rtx30604.png",
          "assets/rtx3060/rtx30605.png"
        ],
        productInfo: "RTX 3060 info"),
    Product(
        productname: "Xiaomi 13 Ultra",
        productRating: 4.9,
        productCost: 95000,
        productImages: [
          "assets/x13u/x13u1.png",
          "assets/x13u/x13u2.png",
          "assets/x13u/x13u3.png",
          "assets/x13u/x13u4.png",
          "assets/x13u/x13u5.png"
        ],
        productInfo: "Xiaomi 13 Ultra info"),
    Product(
        productname: "MSI GF63 Thin",
        productRating: 4.3,
        productCost: 65000,
        productImages: [
          "assets/gf63thin/gf631.png",
          "assets/gf63thin/gf632.png",
          "assets/gf63thin/gf633.png",
          "assets/gf63thin/gf634.png",
          "assets/gf63thin/gf635.png"
        ],
        productInfo: "RTX 3060 info"),
    Product(
        productname: "Mac Pro Wheels",
        productRating: 5.0,
        productCost: 70000,
        productImages: [
          "assets/wheels/wheels1.png",
          "assets/wheels/wheels2.png",
          "assets/wheels/wheels3.png",
          "assets/wheels/wheels4.png",
          "assets/wheels/wheels5.png"
        ],
        productInfo: "Those are some really nice wheels")
  ];

  List<Product> _cartProducts = [];
  List<Product> _favoriteProducts = [];

  List<Product> get products => _products;

  List<Product> get cartProducts => _cartProducts;

  List<Product> get favoriteProducts => _favoriteProducts;

  void toggleFavorites(Product product) {
    product.isProductFavorite = !product.isProductFavorite;
    if (product.isProductFavorite) {
      _favoriteProducts.add(product);
    } else {
      _favoriteProducts.remove(product);
    }
    notifyListeners();
  }

  void toggleCart(Product product) {
    product.isProductInCart = !product.isProductInCart;
    if (product.isProductInCart) {
      _cartProducts.add(product);
      product.noOfProductsInCart = 1;
    } else {
      _cartProducts.remove(product);
      product.noOfProductsInCart = 0;
    }
    notifyListeners();
  }

  void addAnother(Product product) {
    product.noOfProductsInCart++;
    notifyListeners();
  }

  void reduceNumberOfProducts(Product product) {
    if (product.noOfProductsInCart > 1) {
      product.noOfProductsInCart--;
    }
    notifyListeners();
  }
}