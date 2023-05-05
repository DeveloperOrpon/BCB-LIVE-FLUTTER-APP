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

class Highlights with ChangeNotifier {
  final List<Highlight> _items = [
    Highlight(
        id: "h1",
        title:
            "DPDCL | Highlights | Abahani Limited Vs Mohammedan Sporting Club Ltd | Match 68",
        description:
            "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/crickbd-20121.appspot.com/o/highlights%2FDPDCL%20Highlights%20Abahani%20Limited%20Vs%20Mohammedan%20Sporting%20Club%20Ltd%20Match%2068.mp4?alt=media&token=4eea4b37-0849-4a41-a7d0-e1cc153e8d18"),
    Highlight(
        id: "h2",
        title:
            "DPDCL Highlights Prime Bank Cricket Club Vs Agrani Bank Cricket Club Match 62",
        description:
            "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/crickbd-20121.appspot.com/o/highlights%2FDPDCL%20Highlights%20Prime%20Bank%20Cricket%20Club%20Vs%20Agrani%20Bank%20Cricket%20Club%20Match%2062.mp4?alt=media&token=d118d8db-162e-4b53-9849-cb41876c5899"),
    Highlight(
        id: "h3",
        title:
            "DPDCL Highlights Gazi Group Cricketers Vs Brothers Union Limited 59",
        description:
            "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/crickbd-20121.appspot.com/o/highlights%2FDPDCL%20Highlights%20Gazi%20Group%20Cricketers%20Vs%20Brothers%20Union%20Limited%2059.mp4?alt=media&token=8b82e09b-6cf1-404a-b4f3-d8391a870383"),
    Highlight(
        id: "h4",
        title: "DPDCL Highlights Gazi Group Cricketers Vs City Club Match 52",
        description:
            "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/crickbd-20121.appspot.com/o/highlights%2FDPDCL%20Highlights%20Gazi%20Group%20Cricketers%20Vs%20City%20Club%20Match%2052.mp4?alt=media&token=9c4d8056-3eb6-4a67-bf85-fbe353890801"),
    Highlight(
        id: "h5",
        title:
            "DPDCL Highlights Rupganj Tigers Cricket Club Vs Brothers Union Limited Match 64",
        description: "Walton Dhaka Premier Division Cricket League 2022-23 | Super League",
        videoUrl: "https://firebasestorage.googleapis.com/v0/b/crickbd-20121.appspot.com/o/highlights%2FDPDCL%20Highlights%20Rupganj%20Tigers%20Cricket%20Club%20Vs%20Brothers%20Union%20Limited%20Match%2064.mp4?alt=media&token=eaec7e96-cb17-400b-bcc5-5f8fa08ccb01")
  ];

  List<Highlight> get items {
    return [..._items];
  }
}
