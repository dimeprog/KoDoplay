import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension OnDouble on num {
  double get toPrecision => double.parse(toStringAsFixed(2));
  Widget get sW => SizedBox(height: w);
  Widget get sH => SizedBox(height: h);
}