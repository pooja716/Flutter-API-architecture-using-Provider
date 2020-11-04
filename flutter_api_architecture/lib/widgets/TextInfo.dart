import 'package:flutter/cupertino.dart';

class TextInfo extends StatelessWidget {
  final String title;
  TextInfo(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 52,
          child: Text(
            title,
            style:
                const TextStyle(fontFamily: 'HKGrotesk-Regular', fontSize: 15),
          ),
        ));
  }
}
