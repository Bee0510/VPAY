// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class funSection extends StatefulWidget {
  @override
  _PeopleSectionState createState() => _PeopleSectionState();
}

class _PeopleSectionState extends State<funSection> {
  bool isExpanded = false;
  List<Map<String, dynamic>> fun_list = [
    {
      'name': 'Request',
      'image':
          'https://img.freepik.com/free-vector/indian-rupee-money-bag_23-2148019023.jpg?w=826&t=st=1699534332~exp=1699534932~hmac=6f9dd8258eb8384bf3bc4d690e4afc3af9aba1c97b3461b24c50839217b9ccaf',
      'route': '/search_page'
    },
    {
      'name': 'Pending Request',
      'image':
          'https://img.freepik.com/free-vector/indian-rupee-money-bag_23-2148019023.jpg?w=826&t=st=1699534332~exp=1699534932~hmac=6f9dd8258eb8384bf3bc4d690e4afc3af9aba1c97b3461b24c50839217b9ccaf',
      'route': '/pending',
    },
    {
      'name': 'Pending Payment',
      'image':
          'https://img.freepik.com/free-vector/gold-coins-banknotes-3d-cartoon-style-icon-stack-coins-with-dollar-sign-wad-money-cash-savings-flat-vector-illustration-wealth-economy-finance-profit-currency-concept_74855-25998.jpg?w=826&t=st=1699534535~exp=1699535135~hmac=5046d7a79e6b32339c376a62b9938a32baef6460eb7ab301629e1e2c0caceee6',
      'route': '/pending _payment',
    },
    {
      'name': 'Reminder',
      'image':
          'https://img.freepik.com/free-vector/indian-rupee-money-bag_23-2148019023.jpg?w=826&t=st=1699534332~exp=1699534932~hmac=6f9dd8258eb8384bf3bc4d690e4afc3af9aba1c97b3461b24c50839217b9ccaf'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(height: 8),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: fun_list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(fun_list[index]['route']!);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(fun_list[index]['image']),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Center(
                          child: Text(
                            fun_list[index]['name'],
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
