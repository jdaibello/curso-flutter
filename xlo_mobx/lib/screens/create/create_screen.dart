import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/create/components/category_field.dart';
import 'package:xlo_mobx/screens/create/components/cep_field.dart';
import 'package:xlo_mobx/screens/create/components/hide_phone_field.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({Key key}) : super(key: key);

  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(createStore),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createStore.setTitle,
                    decoration: InputDecoration(
                      labelText: 'Título *',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      errorText: createStore.titleError,
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createStore.setDescription,
                    decoration: InputDecoration(
                      labelText: 'Descrição *',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      errorText: createStore.descriptionError,
                    ),
                    maxLines: null,
                  );
                }),
                CategoryField(createStore),
                CepField(createStore),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createStore.setPrice,
                    decoration: InputDecoration(
                      labelText: 'Preço *',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      prefixText: 'R\$ ',
                      errorText: createStore.priceError,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                  );
                }),
                HidePhoneField(createStore),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 50,
                    child: GestureDetector(
                      onTap: createStore.invalidSendPressed,
                      child: RaisedButton(
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        textColor: Colors.white,
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(120),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: createStore.sendPressed,
                      ),
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
