import 'dart:io';

import '../classes/album_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Album> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {HttpHeaders.authorizationHeader: "Insert your token here"});

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
