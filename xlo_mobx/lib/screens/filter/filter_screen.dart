import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/filter/components/order_by_field.dart';
import 'package:xlo_mobx/screens/filter/components/price_range_field.dart';
import 'package:xlo_mobx/screens/filter/components/vendor_type_field.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:xlo_mobx/stores/home_store.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key key}) : super(key: key);

  final FilterStore filter = GetIt.I<HomeStore>().clonedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(filter),
                PriceRangeField(filter),
                VendorTypeField(filter),
                Observer(builder: (_) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 50,
                    child: RaisedButton(
                      color: Colors.orange,
                      disabledColor: Colors.orange.withAlpha(120),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'FILTRAR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: filter.isFormValid
                          ? () {
                              filter.save();
                              Navigator.of(context).pop();
                            }
                          : null,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
