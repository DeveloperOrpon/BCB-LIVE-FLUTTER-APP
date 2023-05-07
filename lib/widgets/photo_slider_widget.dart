import 'package:flutter/material.dart';

class AutoPhotoSlider extends StatefulWidget {
  final List<String> imageUrls;
  final Duration duration;

  AutoPhotoSlider({
    required this.imageUrls,
    this.duration = const Duration(seconds: 3),
  });

  @override
  _AutoPhotoSliderState createState() => _AutoPhotoSliderState();
}

class _AutoPhotoSliderState extends State<AutoPhotoSlider> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(widget.duration, () {
      if (_isPlaying) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          _startAutoPlay();
        });
      }
    });
  }

  void _pauseAutoPlay() {
    setState(() {
      _isPlaying = false;
    });
  }

  void _resumeAutoPlay() {
    setState(() {
      _isPlaying = true;
      _startAutoPlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              widget.imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              IconButton(
                icon: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                onPressed: () {
                  _isPlaying ? _pauseAutoPlay() : _resumeAutoPlay();
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
