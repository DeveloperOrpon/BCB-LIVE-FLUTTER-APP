import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Highlight with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  Highlight(
      {required this.id,
      required this.title,
      required this.description,
      required this.videoUrl});
}

final List<Highlight> items = [
  Highlight(
      id: "h1",
      title:
          "DyyyyPDCL | Highlights | Abahani Limited Vs Mohammedan Sporting Club Ltd | Match 68",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://youtu.be/8wb3hiF20bQ"),
  Highlight(
      id: "h2",
      title:
          "DPDCL Highlights Prime Bank Cricket Club Vs Agrani Bank Cricket Club Match 62",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://youtu.be/e6R6VsgD8yQ"),
  Highlight(
      id: "h3",
      title:
          "DPDCL Highlights Gazi Group Cricketers Vs Brothers Union Limited 59",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: 'https://youtu.be/8T8FyuivG64'),
  Highlight(
      id: "h4",
      title: "DPDCL Highlights Gazi Group Cricketers Vs City Club Match 52",
      description:
          "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
      videoUrl: "https://youtu.be/hmsDXQtETns"),
];
