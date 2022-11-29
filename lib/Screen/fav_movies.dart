import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${myList.length})"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          final currentMovie = myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text("${currentMovie.title}"),
              subtitle: Text(currentMovie.duration ?? ""),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeToList(currentMovie);
                },
                child: Text("Remove"),
              ),
            ),
          );
        },
      ),
    );
  }
}
