import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Screen/fav_movies.dart';
import 'package:provider_state_management/provider/movie_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var moives = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyListScreen(),
                ));
              },
              icon: Icon(Icons.favorite),
              label: Text(
                "Go to My List ${myList.length}",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: moives.length,
              itemBuilder: (context, index) {
                final currentMovie = moives[index];
                return Card(
                  key: ValueKey(currentMovie.title),
                  color: Colors.blueAccent,
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      currentMovie.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      currentMovie.duration ?? 'No information',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (!myList.contains(currentMovie)) {
                          context.read<MovieProvider>().addToList(currentMovie);
                        } else {
                          context
                              .read<MovieProvider>()
                              .removeToList(currentMovie);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: myList.contains(currentMovie)
                            ? Colors.red
                            : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
