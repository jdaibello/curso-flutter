import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title) {
      return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.purple,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordenar por'),
        Row(
          children: [
            buildOption('Data'),
            const SizedBox(width: 12),
            buildOption('Preço'),
          ],
        ),
      ],
    );
  }
}
