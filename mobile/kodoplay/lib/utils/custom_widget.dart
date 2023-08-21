import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextFormField customField({
  required TextEditingController controller,
  // required String label,
  required String hint,
  required IconData icon,
  required bool obscure,
  required TextInputType type,
  Function(String)? validator,
  Function(String)? onSaved,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    keyboardType: type,
    style: TextStyle(fontSize: 14.sp, color: Colors.white),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      // labelText: label,

      hintText: hint,
      hintStyle: TextStyle(
          color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.normal),
      contentPadding: EdgeInsets.only(left: 20.w),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(icon),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.grey.shade800,
    ),
    validator: validator == null ? null : (value) => validator(value!),
    onSaved: onSaved == null ? null : (value) => onSaved(value!),
  );
}
