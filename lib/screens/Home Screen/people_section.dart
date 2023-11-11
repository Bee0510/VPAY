// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:v_pay/models/user_class.dart';
import 'package:v_pay/screens/People%20Screen/people_screen.dart';

class PeopleSection extends StatefulWidget {
  const PeopleSection({Key? key, required this.peopleList}) : super(key: key);
  final List<Friend> peopleList;
  @override
  _PeopleSectionState createState() => _PeopleSectionState();
}

class _PeopleSectionState extends State<PeopleSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('People',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              widget.peopleList.length <= 8
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Colors.black),
                        height: 25,
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(isExpanded ? 'Less' : 'More',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 8),
          widget.peopleList.length <= 8
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  shrinkWrap: true,
                  itemCount: widget.peopleList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => people_screen(
                                frnd_uid: widget.peopleList[index].uid)));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: widget.peopleList[index].img_url.isEmpty
                                  ? Text(widget.peopleList[index].name[0])
                                  : Image.network(
                                      widget.peopleList[index].img_url)),
                          Text(
                            widget.peopleList[index].name,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Container(),
          // : GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 4,
          //     ),
          //     shrinkWrap: true,
          //     itemCount: isExpanded ? widget.peopleList.length : 8,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           CircleAvatar(child: Text('A')),
          //           Text(
          //             widget.peopleList[index].name,
          //             style: TextStyle(color: Colors.white),
          //           )
          //         ],
          //       );
          //     },
          //   ),
        ],
      ),
    );
  }
}
