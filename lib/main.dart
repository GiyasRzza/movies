import 'package:flutter/material.dart';
import 'package:movies/movie.dart';
import 'package:movies/movieDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Movie>> getMovie() async{
        var movieList = <Movie>[];
        var m1 = Movie(1, "Interstellar", "Interstellar.jpg", 10.0);
        var m2 = Movie(1, "Martian", "martian.jpg", 10.0);
        var m3 = Movie(1, "Smile", "smile.jpeg", 8.0);
        var m4 = Movie(1, "Avatar", "avatar.jpg", 7.0);
        movieList.add(m1);movieList.add(m2);movieList.add(m3);movieList.add(m4);
        return movieList;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Movies",style: TextStyle(
            color: Colors.white,fontSize: 32.0
          ),
        ),
        centerTitle: true,

      ),
      body: FutureBuilder<List<Movie>>(
        future: getMovie(),
        builder: (context, snapshot) {
            if(snapshot.hasData){
              var movieList =snapshot.data;
              return GridView.builder(
                  itemCount: movieList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/3.5,

                  ),
                  itemBuilder: (context, index) {
                    var movie = movieList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>
                            MovieDetails(movie: movie),));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("images/${movie.image_name}"),
                              Text(movie.movie_name,style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text("${movie.price.toString()} \u{20BC} ",style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
              );
            }
            else{
              return const Center();
            }
        },
      )

      );
  }
}
