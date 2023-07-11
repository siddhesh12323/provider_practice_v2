import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider_practice_v2/classes/todo_class.dart';

List<ToDo> parseToDo(String response1) {
  final parsed = jsonDecode(response1).cast<Map<String, dynamic>>();
  return parsed.map<ToDo>((json) => ToDo.fromJson(json)).toList();
}

Future<List<ToDo>> fetchToDo(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  return compute(parseToDo, response.body);
}
