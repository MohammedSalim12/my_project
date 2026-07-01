import 'package:flutter/material.dart';

class CoustemAppar extends StatelessWidget {
  final String titalappar;

  final void Function()? onpreesIconfavorite;
  final void Function()? onpreesIconserrch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CoustemAppar({
    super.key,
    required this.titalappar,
    this.onpreesIconserrch,
    required this.onpreesIconfavorite,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onpreesIconserrch,
                  icon: Icon(Icons.search),
                ), 
                hintText: titalappar,
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            width: 55,
            padding: EdgeInsets.symmetric(vertical: 7.5),

            child: IconButton(
              onPressed: onpreesIconfavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 25,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
