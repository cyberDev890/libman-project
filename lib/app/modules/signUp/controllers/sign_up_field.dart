import 'package:flutter/material.dart';

class TLtextfield extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardTipe;
  final int? maxLenght;
  final double? height;
  const TLtextfield(
      {required this.label,
      required this.hint,
      this.controller,
      required this.keyboardTipe,
      this.maxLenght,
      this.height});

  @override
  State<TLtextfield> createState() => _TLtextfieldState();
}

class _TLtextfieldState extends State<TLtextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: 307,
        child: TextFormField(
          maxLength: widget.maxLenght,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardTipe,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ));
  }
}

class TLpassword extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardTipe;
  final double? height;
  const TLpassword(
      {required this.label,
      required this.hint,
      this.controller,
      required this.keyboardTipe,
      this.height});

  @override
  State<TLpassword> createState() => _TLpasswordState();
}

class _TLpasswordState extends State<TLpassword> {
  bool ishiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    void togglePassword() {
      setState(() {
        ishiddenpassword = !ishiddenpassword;
      });
    }

    return Container(
        height: widget.height,
        width: 307,
        child: TextFormField(
          maxLength: 15,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyboardTipe,
          obscureText: ishiddenpassword,
          decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: InkWell(
                onTap: togglePassword,
                child: ishiddenpassword == true
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ));
  }
}
