import 'package:flutter/material.dart';

///      TODO: - speech to text mic opcija

class SearchBar extends StatelessWidget {
  final TextField textField;
  final Widget icon;

  SearchBar({@required this.textField, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 8.0, right: 25.0),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: textField,
          trailing: icon,
        ),
      ),
    );
  }
}
