import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/search_bar.dart';

class MyContactScreen extends StatelessWidget {
  const MyContactScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SearchBar(),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'My Contacts',
            style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(),
        ),
        ListTile(
          dense: true,
          leading: Icon(Icons.chevron_right),
          title: Text('Starred'),
          trailing: Text('0'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(),
        ),
        ListTile(
          dense: true,
          leading: Icon(Icons.chevron_right),
          title: Text('Phone Contacts'),
          trailing: Text('0'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(),
        ),
        ListTile(
          dense: true,
          leading: Icon(Icons.chevron_right),
          title: Text('External Contacts'),
          trailing: Text('0'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(),
        ),
      ],
    );
  }
}