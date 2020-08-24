import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            height: 160,
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.network(
                  'http://via.placeholder.com/350x150',
                );
              },
              pagination: SwiperPagination(),
              loop: true,
              duration: 300,
              autoplay: true,
            ))
      ],
    ));
  }
}
