import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return ToggleSwitch(
                        totalSwitches: 2,
                        minWidth: constraints.biggest.width / 2.01,
                        labels: ['Particular', 'Profissional'],
                        cornerRadius: 20,
                        activeBgColor: [Colors.purple],
                        inactiveBgColor: Colors.grey,
                        activeFgColor: Colors.white,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        onToggle: (i) {},
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Nome*',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Telefone*',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Nova Senha',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Confirmar Nova Senha',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.orange,
                      elevation: 0,
                      textColor: Colors.white,
                      child: Text(
                        'Salvar',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      elevation: 0,
                      textColor: Colors.white,
                      child: Text(
                        'Sair',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
