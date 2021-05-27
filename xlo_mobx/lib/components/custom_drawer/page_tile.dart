import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile(
      {this.label, this.iconData, this.onTap, this.highlighted, Key key})
      : super(key: key);

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: highlighted ? Colors.purple : Colors.black87,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.purple : Colors.black87,
      ),
      onTap: onTap,
    );
  }
}
