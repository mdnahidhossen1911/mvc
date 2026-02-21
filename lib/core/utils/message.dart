import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Message {
  static void toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void errorToast(Object? error) {
    final msg = _extractMessage(error ?? 'Unknown error from toast');
    Fluttertoast.showToast(msg: msg);
  }


  static void errorSnackBar({
    Object? message = 'Unknown error from snackbar',
    required BuildContext context,
  }) {
    final overlay = Overlay.maybeOf(context);
    if (overlay == null) return;

    final msg = _extractMessage(message!);

    showTopSnackBar(
      overlay,
      CustomSnackBar.error(message: msg),
    );
  }

  static String _extractMessage(Object input) {
    if (input is Map) {
      return _msgFromMap(input.cast<String, dynamic>());
    }

    final text = input.toString().trim();
    if (text.isEmpty) return 'An error occurred';

    try {
      final decoded = jsonDecode(text);
      if (decoded is Map) {
        return _msgFromMap(decoded.cast<String, dynamic>());
      }
    } catch (_) {
      // ignore
    }

    final match = RegExp(r'message:\s*([^,}]+)').firstMatch(text);
    if (match != null) {
      final extracted = match.group(1)?.trim();
      if (extracted != null && extracted.isNotEmpty) return extracted;
    }

    return text;
  }

  static String _msgFromMap(Map<String, dynamic> m) {
    final v = m['msg'] ?? m['message'];
    if (v is String && v.trim().isNotEmpty) return v.trim();
    if (v is Map) {
      final inner = v.cast<String, dynamic>();
      final innerMsg = inner['msg'] ?? inner['message'];
      if (innerMsg is String && innerMsg.trim().isNotEmpty) return innerMsg.trim();
    }

    return 'An error occurred';
  }


  static void infoSnackBar({
    required String message,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void successSnackBar({
    required String message,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}
