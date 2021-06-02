import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/home/components/bar_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarButton(
          label: 'Categorias',
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () {},
        ),
        BarButton(
          label: 'Filtros',
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
              left: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
