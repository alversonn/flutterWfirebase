import 'package:flutter/material.dart';
import 'package:kicks/constants/colors.dart';
//import 'package:flutter_icons/flutter_icons.dart';


class TSettingsMenuTile2 extends StatelessWidget {
  const TSettingsMenuTile2({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final dynamic icon; // Menggunakan dynamic untuk menerima ikon berupa widget atau asset
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28,color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
