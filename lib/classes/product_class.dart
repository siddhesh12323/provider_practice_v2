
class Product {
  final String productname;
  bool isProductFavorite;
  bool isProductInCart;
  double productRating;
  double productCost;
  List<String> productImages;
  final String productInfo;
  int noOfProductsInCart;

  Product(
      {required this.productname,
      this.isProductFavorite = false,
      this.isProductInCart = false,
      required this.productRating,
      required this.productCost,
      required this.productImages,
      required this.productInfo,
      this.noOfProductsInCart = 0});
}
