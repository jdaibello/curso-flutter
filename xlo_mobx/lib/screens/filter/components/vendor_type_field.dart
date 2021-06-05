import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField(this.filter, {Key key}) : super(key: key);

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle('Tipo de anunciante'),
      ],
    );
  }
}
