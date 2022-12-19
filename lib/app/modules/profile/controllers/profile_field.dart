import 'package:flutter/material.dart';

class TLtextfieldProfile extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardTipe;
  final int? maxLenght;
  final double? height;
  const TLtextfieldProfile(
      {required this.label,
      required this.hint,
      this.controller,
      this.initialValue,
      required this.keyboardTipe,
      this.maxLenght,
      this.height});

  @override
  State<TLtextfieldProfile> createState() => _TLtextfieldProfileState();
}

class _TLtextfieldProfileState extends State<TLtextfieldProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: 307,
        child: TextFormField(
          initialValue: widget.initialValue,
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

class TLpasswordProfile extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardTipe;
  final double? height;
  const TLpasswordProfile(
      {required this.label,
      required this.hint,
      this.controller,
      required this.keyboardTipe,
      this.height});

  @override
  State<TLpasswordProfile> createState() => _TLpasswordProfileState();
}

class _TLpasswordProfileState extends State<TLpasswordProfile> {
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
