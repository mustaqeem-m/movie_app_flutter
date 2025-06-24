import 'package:flutter/material.dart';
import 'package:movie_app/Pages/Movie_Details.dart';
import 'package:movie_app/models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.isDetails = false,
  });

  final Movie movie;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text(movie.genre), 
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie.images.isNotEmpty && movie.images[0].isNotEmpty ? movie.images[0] :  "https://via.placeholder.com/150" ),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 75),
            child: Column(
              children: [
                RichText(text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "Released: ",
                        style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: '${movie.released} \n',
                      ),TextSpan(
                        text: 'Plot: ',
                        style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: '${movie.plot} ',
                      ),
                    ]
                )
                ),
                isDetails ?  TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie:  movie,)));
                }, child: Text("Read More")) : const Text("") ,
              ],
            ), 
          )
        ],
        )
    );
  }
}
