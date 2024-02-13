import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _isVisible = true;
  bool _isImageVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _isImageVisible = !_isImageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            MouseRegion(
              onHover: (event) {
                setState(() {
                  _isImageVisible = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isImageVisible = false;
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Visibility(
                        visible: _isVisible,
                        child: Container(
                          width: size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF6E4C85), Color(0xFF2D2B52)],
                            ),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 50, top: 12, bottom: 12),
                                    child: const Text(
                                      '"Anything that can go wrong, will go wrong!"',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          letterSpacing: 0,
                                          fontFamily: 'HelveticaNeue',
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                  const SizedBox(width: 920),
                                  GestureDetector(
                                    onTap: () {
                                      _toggleVisibility();
                                    },
                                    child: _isImageVisible
                                        ? Image.asset('images/removequote.png')
                                        : Container(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*     Visibility(
              visible: _isVisible,
              child: Positioned(
                top: 60,
                right: 20,
                child: _isVisible && !_isImageVisible
                    ? Image.asset('images/showquote.png')
                    : Container(),
              ),
            ),*/
          ],
        ),
      ],
    );
  }
}
