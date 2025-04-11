import 'package:flutter/material.dart';
import 'package:watch_mode_flutter/presentation/search_movie_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchMoviePage()),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
      ),
    );
  }
}
