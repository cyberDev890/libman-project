import 'package:flutter/material.dart';

class TFtextfield extends StatefulWidget {
  final String? label;
  final String? hint;
  final double? height;
  final TextEditingController? controller;
  const TFtextfield(
      {required this.label,
      required this.hint,
      required this.controller,
      this.height});

  @override
  State<TFtextfield> createState() => _TFtextfieldState();
}

class _TFtextfieldState extends State<TFtextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: 307,
        child: TextFormField(
          controller: widget.controller,
          maxLength: 4,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
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

class TftextfieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final double? height;

  const TftextfieldPassword({required this.controller, this.height});

  @override
  State<TftextfieldPassword> createState() => _TftextfieldPasswordState();
}

class _TftextfieldPasswordState extends State<TftextfieldPassword> {
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
          keyboardType: TextInputType.visiblePassword,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          maxLength: 15,
          obscureText: ishiddenpassword,
          decoration: InputDecoration(
            label: Text("Password"),
            suffixIcon: InkWell(
                onTap: togglePassword,
                child: ishiddenpassword == true
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: "Masukan Password anda ",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ));
  }
}
