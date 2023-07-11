import 'package:flutter/material.dart';
import 'package:provider_practice_v2/apis/fetch_image.dart';
import 'package:provider_practice_v2/classes/image_class.dart';
import 'package:http/http.dart' as http;

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  //final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load images from APIs"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong :("),
            );
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250),
              itemBuilder: ((context, index) {
                return Image.network(snapshot.data![index].thumbnailUrl);
              }),
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
