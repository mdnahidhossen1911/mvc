import 'package:flutter/material.dart';

/// Extension to create SizedBox gaps easily
extension GapExt on num {
  SizedBox get hGap => SizedBox(height: toDouble());
  SizedBox get wGap => SizedBox(width: toDouble());
  SizedBox get sqGap => SizedBox(height: toDouble(), width: toDouble());
}
