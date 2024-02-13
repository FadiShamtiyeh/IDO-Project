// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:my_web_project/component/body/mylisttile.dart';

class CustomColumn extends StatelessWidget {
  final List<Map> items;

  final int index;
  final List status;

  const CustomColumn({
    super.key,
    required this.items,
    required this.index,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(33, 37, 41, 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset(status[index]['image']),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        status[index]['status'],
                        style: const TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, itemIndex) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromRGBO(33, 37, 41, 1),
                ),
                child: CustomListTile(
                  title: items[itemIndex]['title'] ?? '',
                  category: items[itemIndex]['category'] ?? '',
                  dueDate: items[itemIndex]['duedate'] ?? '',
                  estimate: items[itemIndex]['estimate'] ?? '',
                  // number: items[itemIndex]['estimate']['number'] ?? 0.0,
                  //unit: items[itemIndex]['estimate']['unit'] ?? '',
                  importance: items[itemIndex]['importance'] ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
