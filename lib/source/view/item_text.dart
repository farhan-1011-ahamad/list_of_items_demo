import 'package:flutter/material.dart';

class ItemElement extends StatelessWidget {
  const ItemElement({
    Key? key,
    this.itemText,
    required this.title,
  }) : super(key: key);

  final String? itemText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "$title: ",
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(itemText ?? "NIL",style: const TextStyle(fontSize: 18,),overflow: TextOverflow.ellipsis,maxLines: 3,
                   ),
          ),
        ],
      ),
    );
  }
}
