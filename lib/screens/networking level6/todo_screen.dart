import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider_practice_v2/apis/fetch_todo.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Fetching"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 30,
            child: const Center(child: Text("ToDos")),
          ),
          FutureBuilder(
              future: fetchToDo(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('$index.')),
                            ),
                            const Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("UserID: ${snapshot.data![index].userId}"),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("ID: ${snapshot.data![index].id}"),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("Title: ${snapshot.data![index].title}")
                              ],
                            ),
                            const Spacer(),
                            snapshot.data![index].completed
                                ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.done),
                                )
                                : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.cancel),
                                )
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong :("),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
