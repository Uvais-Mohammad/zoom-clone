import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/search_bar.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchBar(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: secondaryBackgroundColor,
          child: const Text('All Channels'),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    color: secondaryBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: const Text(
                  ' # ',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              title: const Text('Channel 1'),
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            )
          ],
        )
      ],
    );
  }
}
