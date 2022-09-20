import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: secondaryBackgroundColor,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
