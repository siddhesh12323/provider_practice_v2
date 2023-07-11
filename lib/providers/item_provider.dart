import 'package:flutter/foundation.dart';

import '../classes/item_class.dart';


class ItemListProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Item> _items = [
    Item('Item 1'),
    Item('Item 2'),
    Item('Item 3'),
    Item('Item 4'),
    Item('Item 5'),
  ];

  List<Item> get items => _items;

  void toggleFavorite(Item item) {
    item.isFavorite = !item.isFavorite;
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}