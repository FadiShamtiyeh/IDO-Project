import 'package:flutter/material.dart';
import 'package:my_web_project/login.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({super.key});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  bool _isCardOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCardOpen = !_isCardOpen; // Toggle the card visibility
        });
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 25,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/avatar.png'),
              radius: 35,
            ),
          ),
          if (_isCardOpen)
            Positioned(
              bottom: -120,
              right: 10,
              child: Container(
                height: 130,
                width: 320,
                color: const Color.fromARGB(255, 68, 68, 68),
                //color: const Color.fromRGBO(35, 35, 35, 1),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/avatar.png'),
                          radius: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'user@example.com',
                          style: TextStyle(
                            color: Color(0xFFB6A3C2),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'HelveticaNeue',
                            letterSpacing: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'HelveticaNeue',
                                letterSpacing: 0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Login(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Image.asset(
                                'images/logout.png',
                                width: 24, // Adjust as needed
                                height: 24, // Adjust as needed
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
