import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/newscms/2019_17/2835276/190425-thor-avengers-endgame-ew-339p.jpg',
    'https://www.cnet.com/a/img/resize/8d159fb0c99a75843d3585dd2ae8cc9e6fa12773/hub/2017/08/03/75c3b0ae-5a2d-4d75-b72b-055247b4378f/marvelinfinitywar-captainamerica.jpg?auto=webp&fit=crop&height=1200&width=1200',
    'https://staticg.sportskeeda.com/editor/2023/07/1e42b-16888837576290-1920.jpg',
    'https://insomniac.games/wp-content/uploads/2018/09/Spider-Man_PS4_Selfie_Photo_Mode_LEGAL.jpg',
    'https://www.intofilm.org/intofilm-production/4293/scaledcropped/970x546/resources/4293/black-panther-ep-marvel-disney.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView with Images',),
          backgroundColor: Colors.blue,
        ),
        body: ListView.separated(
          itemCount: imageUrls.length,
          separatorBuilder: (_, __) => Divider(height: 10),
          itemBuilder: (_, index) {
            return ListTile(
              leading: ClipOval(
                child: Image.network(
                  imageUrls[index],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Avenger: ${index + 1}'),
              subtitle: Text('Avengers: Infinity War'),
              onTap: () {
                // Action when ListTile is tapped
                print('Tapped on Avenger ${index + 1}');
              },
            );
          },
        ),
      ),
    );
  }
}
