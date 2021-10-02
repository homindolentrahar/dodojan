import 'package:dodojan/core/common/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const FieldTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColor.primaryOpacity.withOpacity(0.15),
        highlightColor: AppColor.primaryOpacity.withOpacity(0.3),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Get.textTheme.headline5?.copyWith(
                  color: AppColor.dark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: Get.textTheme.bodyText1?.copyWith(
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(
                color: AppColor.light,
                height: 0,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
