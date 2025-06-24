import 'package:flutter/material.dart';
import 'package:movie_app/Components/movie_card.dart';
import 'package:movie_app/Provider/movieProvider.dart';
import "package:provider/provider.dart";

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Movieprovider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),   
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  void initState() {
    Provider.of<Movieprovider>(context , listen: false)
    .loadMovies(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<Movieprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            final movie = movieData.movieList[index];
            return MovieCard(movie: movie, isDetails: true,); 

            // return ListTile(
            //   title: Text(movieData.movieList[index].title),
            //   subtitle: Text("Enjoy the show!"),
            //   leading: CircleAvatar(
            //     child: Text(movie.title[0]),
            // ),
            // );
          },
        ),
      ),
    );
  }
}

