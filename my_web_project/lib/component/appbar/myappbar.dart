import 'package:flutter/material.dart';
//import 'package:my_web_project/component/appbar/myadd.dart';
import 'package:my_web_project/component/appbar/myavatar.dart';
//import 'package:my_web_project/component/appbar/mysearch.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: const Color.fromRGBO(35, 35, 35, 1),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(left: 45),
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 1030),
          Image.asset('images/search.png'),
          /* const CustomSearch(
            todoItems: [
              {
                'title': 'Prepare the assay',
                'category': 'Education',
                'duedate': '12-12-2022',
                'estimate': '6 hours',
                'importance': 'High'
              },
              {
                'title': 'Format the PC',
                'category': 'General cleanup',
                'duedate': '12-10-2022',
                'estimate': '3 hours',
                'importance': 'Low'
              },
              {
                'title':
                    'Contact the support team of XYZ software to ask about the guarantee pricing ',
                'category': 'Follow Up',
                'duedate': '2022-10-01',
                'estimate': '0.5 hours',
                'importance': 'Medium',
              }
            ],
          ),*/
          const SizedBox(width: 55),
          // const CustomAdd(),
          Stack(
            children: [
              Image.asset('images/circle.png'),
              Positioned(
                top: 6,
                right: 6,
                bottom: 6,
                child: Image.asset(
                  'images/add.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(width: 45),
          const CustomAvatar(),
        ],
      ),
    );
  }
}
