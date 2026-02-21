import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color leadingBackgroundColor;
  final Color leadingIconColor;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double leadingRadius;
  final double leadingIconSize;
  final List<Widget>? actions;
  final double elevation;
  final bool centerTitle;
  final bool forceMaterialTransparency;
  final bool onlyTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.backgroundColor = Colors.white,
    this.leadingBackgroundColor = const Color(0xFFF5F5F5),
    this.leadingIconColor = Colors.black,
    this.titleColor = Colors.black,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w500,
    this.leadingRadius = 18,
    this.leadingIconSize = 18,
    this.actions,
    this.elevation = 0,
    this.centerTitle = true,
    this.forceMaterialTransparency = true,
    this.onlyTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      forceMaterialTransparency: forceMaterialTransparency,
      leading: onlyTitle ? null : _buildLeading(),
      title: _buildTitle(),
      actions: actions,
    );
  }

  Widget _buildLeading() {
    return Center(
      child: CircleAvatar(
        radius: leadingRadius,
        backgroundColor: leadingBackgroundColor,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: leadingIconColor,
            size: leadingIconSize,
          ),
          onPressed: onBackPressed ?? () => Get.back(),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
        fontSize: titleFontSize,
        fontWeight: titleFontWeight,
        color: titleColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
