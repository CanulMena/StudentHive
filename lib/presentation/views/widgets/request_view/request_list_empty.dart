import 'package:flutter/material.dart';

class ListEmptyRequest extends StatelessWidget {
  const ListEmptyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Add you Resquest',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Send requests to the publications you like',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
