import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({@required this.image, @required this.onDelete, Key key})
      : super(key: key);

  final dynamic image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image),
          FlatButton(
            child: const Text('Excluir'),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
