import 'package:flutter/material.dart';
import 'package:mvc/core/extensions/space_gap.dart';
import 'app_text.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade500)),
        12.wGap,
        AppText(
          'Or',
          fontSize: 14,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
        ),
        12.wGap,
        Expanded(child: Divider(color: Colors.grey.shade500)),
      ],
    );
  }
}
