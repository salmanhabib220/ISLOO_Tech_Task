import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageViewIndicator extends StatelessWidget {
  final _pageController;
  CustomPageViewIndicator(this._pageController);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3, 
              effect: SlideEffect(  
                      spacing:  8.0,  
                      radius:  6.0,  
                      dotWidth:  24.0,  
                      dotHeight:  8.0,  
                      paintStyle:  PaintingStyle.stroke,  
                      strokeWidth:  1.5,  
                      dotColor:  Colors.grey,  
                      activeDotColor:  Colors.amber 
                  ),  
               onDotClicked: (index) => _pageController.animateToPage(index,
                   duration: Duration(milliseconds: 500), curve: Curves.linear),
            ),
          ),
        ),
      ],
    );
  }
}
