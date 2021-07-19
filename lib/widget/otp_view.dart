import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class OtpWidget extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  OtpWidget({this.onChanged, this.onCompleted});

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;
  late List<String> _pin;
  MaterialColor activeBorder = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNodes = List<FocusNode?>.filled(4, null, growable: false);
    _textControllers =
        List<TextEditingController?>.filled(4, null, growable: false);
    _pin = List.generate(4, (index) => "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [for (int i = 0; i < 4; i++) buildOtpView(context, i)],
      ),
    );
  }

  Widget buildOtpView(BuildContext context, int i) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null)
      _textControllers[i] = new TextEditingController();

    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Container(
        width: 40,
        height: 40,
        child: TextField(
          controller: _textControllers[i],
          focusNode: _focusNodes[i],
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: activeBorder),
            ),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              if (i == 0) return;
              _focusNodes[i]!.unfocus();
              _focusNodes[i - 1]!.requestFocus();
            }

            setState(() {
              _pin[i] = value;
            });

            print(value);
            if (value.isNotEmpty) {
              _textControllers[i]!.text = value[value.length - 1];
              _focusNodes[i]!.unfocus();
              if (i + 1 != 4) {
                FocusScope.of(context).requestFocus(
                  _focusNodes[i + 1],
                );
              }
            }

            String pin = _getPin();
            if (!_pin.contains(null) && !_pin.contains('')) {
              widget.onCompleted!(pin);
              setState(() {
                activeBorder = Colors.blue;
              });
            } else {
              setState(() {
                activeBorder = Colors.grey;
              });
            }

            widget.onChanged!(pin);
          },
        ),
      ),
    );
  }

  String _getPin() {
    String pin = "";
    _pin.forEach((element) {
      pin += element;
    });
    return pin;
  }
}
