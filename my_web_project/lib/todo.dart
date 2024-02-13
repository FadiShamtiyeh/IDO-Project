// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:my_web_project/component/appbar/myappbar.dart';
import 'package:my_web_project/component/body/mycolumn.dart';

import 'package:my_web_project/component/myheader.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<Map> items_todo = [
    /*  {
      'title': 'Prepare the assay',
      'category': 'Education',
      'duedate': '12-12-2022',
      'estimate': [
        {'number': 6, 'unit': 'hours'}
      ],
      'importance': 'High'
    },*/
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
  ];
  List<Map> items_doing = [
    {
      'title': 'Translate the resume',
      'category': 'Job Opportunity ',
      'duedate': '2022-10-10',
      'estimate': '2 hours',
      'importance': 'Low',
    },
    {
      'title': 'Fix the power button of the TV',
      'category': 'House improvement',
      'duedate': 'None',
      'estimate': '1 hour',
      'importance': 'Medium',
    },
  ];
  List<Map> items_done = [
    {
      'title': 'Prepare the XD design',
      'category': 'Final Year Project',
      'duedate': '2022-01-01',
      'estimate': '8 days',
      'importance': 'High',
    },
    {
      'title': 'Email the faculty director about the progress',
      'category': 'Final Year Project',
      'duedate': 'None',
      'estimate': '15 minutes',
      'importance': '',
    }
  ];

  List status = [
    {'status': 'To Do', 'image': 'images/todoicon.png'},
    {'status': 'Doing', 'image': 'images/doingicon.png'},
    {'status': 'Done', 'image': 'images/doneicon.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B5E60),
      body: Column(
        children: [
          const CustomAppBar(),
          Header(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomColumn(
                      items: items_todo,
                      index: 0,
                      status: status), // First column
                ),
                Expanded(
                  flex: 2,
                  child: CustomColumn(
                      items: items_doing,
                      index: 1,
                      status: status), // Second column
                ),
                Expanded(
                  flex: 2,
                  child: CustomColumn(
                      items: items_done,
                      index: 2,
                      status: status), // Third column
                ),
                Container(
                  width: 400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
