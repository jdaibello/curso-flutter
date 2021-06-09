import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:xlo_mobx/models/ad.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel(this.ad, {Key key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Ver descrição completa',
            trimExpandedText: ' Ver menos',
            colorClickableText: Colors.purple,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
