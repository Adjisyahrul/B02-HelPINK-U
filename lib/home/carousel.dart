import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://pbs.twimg.com/media/FHwqvhvUUAENuDi?format=jpg&name=large',
  'https://pbs.twimg.com/media/FHwrQuFVcAQeABI?format=jpg&name=large',
  'https://pbs.twimg.com/media/FHwrWUoVUAAdtsE?format=jpg&name=large',
  'https://pbs.twimg.com/media/FHwrZqNVEAAIFW-?format=jpg&name=large'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
          margin: EdgeInsets.all(15.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[Image.network(item)],
                )),
          ),
        ))
    .toList();

class CarouselHome extends StatefulWidget {
  const CarouselHome({Key key}) : super(key: key);

  @override
  _CarouselHomeState createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: /*imageSliders*/[Image.network('https://pbs.twimg.com/media/FHwqvhvUUAENuDi?format=jpg&name=large'), Image.network('https://pbs.twimg.com/media/FHwrQuFVcAQeABI?format=jpg&name=large'), Image.network('https://pbs.twimg.com/media/FHwrWUoVUAAdtsE?format=jpg&name=large'),Image.network('https://pbs.twimg.com/media/FHwrZqNVEAAIFW-?format=jpg&name=large')]);
  }
}