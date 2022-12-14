import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield(
      {Key? key,
      this.hint,
      this.validator,
      this.controller,
      this.ontap,
      this.readOnly,
      this.obscureText,
      this.sicon,
      this.type})
      : super(key: key);

  final String? hint;
  final Widget? sicon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final Function()? ontap;
  final TextInputType? type;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: const Color.fromARGB(255, 112, 108, 108),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        autofocus: false,
        validator: validator,
        readOnly: readOnly ?? false,
        onTap: ontap,
        controller: controller,
        keyboardType: type,
        obscureText: obscureText ?? false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide.none
          // ),
          suffixIcon: sicon,
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
          hintText: hint,
        ),
      ),
    );
  }
}
