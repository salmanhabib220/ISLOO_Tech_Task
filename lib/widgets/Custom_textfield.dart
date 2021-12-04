import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? conttroller;
  final IconButton data;
  final String? hinttext;
  final double? width;

  const CustomTextfield(
      {Key? key, this.conttroller, required this.data, this.hinttext, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: conttroller,
        cursorColor: Colors.black,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            suffixIcon: IconButton(
              padding: EdgeInsets.only(bottom: 10),
              onPressed: () {}, icon: data)
            ),
      ),
    );
  }
}
