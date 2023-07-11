import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice_v2/providers/item_provider.dart';

class ListExamplePage1 extends StatelessWidget {
  const ListExamplePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: Consumer<ItemListProvider>(
        builder: (context, itemListProvider, _) {
          final items = itemListProvider.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    itemListProvider.toggleFavorite(item);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListExamplePage2()),
          );
        },
      ),
    );
  }
}

class ListExamplePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: Consumer<ItemListProvider>(
        builder: (context, itemListProvider, _) {
          final items = itemListProvider.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    itemListProvider.toggleFavorite(item);
                  },
                ),
                onLongPress: () {
                  itemListProvider.removeItem(item);
                },
              );
            },
          );
        },
      ),
    );
  }
}