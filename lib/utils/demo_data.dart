import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Highlight with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String thumbnailUrl;

  Highlight(
      {required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.description,
      required this.videoUrl});
}

final List<Highlight> items = [
  Highlight(
      id: "1",
      title: "Bangladesh's top 5 memorable moments",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://youtu.be/TJmk31zvhLM",
      thumbnailUrl: "assets/ads/ads1.jpg"),
  Highlight(
      id: "2",
      thumbnailUrl: "assets/ads/ads2.jpg",
      title:
          "Shakib Stars In Huge Chase! | Windies vs Bangladesh - Match Highlights | ICC Cricket World Cup 2019",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://www.youtube.com/watch?v=LRtEJPSj2-8"),
  Highlight(
      id: "h3",
      thumbnailUrl: "assets/ads/ads3.jpg",
      title: "Pakistan vs Bangladesh 2020 | Full Highlights |1st T20I | PCB",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: 'https://www.youtube.com/watch?v=JXZyMUpYG88'),
  Highlight(
      id: "h4",
      thumbnailUrl: "assets/ads/ads4.jpg",
      title:
          "Highlights | HD | Bangladesh vs India | 2nd ODI | Cricket | T Sports",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://www.youtube.com/watch?v=iW2YvdDZ0fw"),
];
