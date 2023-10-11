import 'package:flutter/material.dart';
import 'package:movies/movie.dart';

class MovieDetails extends StatefulWidget {
   Movie movie;

  MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
            title: Text(widget.movie.movie_name,style: const TextStyle(
                color: Colors.white,fontSize: 32.0
            ),
            ),
            centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 350,
                  width: 350,
                  child: Image.asset("images/${widget.movie.image_name}")),
              Text(
                "${widget.movie.price.toString()} \u{20BC} ",
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                  onPressed: () {
                        print(widget.movie.movie_name);
                  },
                  child: const Text("Sifariş Et",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,color: Colors.white
                  ),)
              )
            ],
          ),
        ));
  }
}
