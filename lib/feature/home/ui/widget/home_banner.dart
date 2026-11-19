
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/todaytask/ui/to_day_task.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.main,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'today_task_almost_done'.tr(context: context),
              style: AppTextStyle.bold16.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 100,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ToDayTask.routeName,
                );
              },
              child: Text(
                'view_task'.tr(context: context),
                style: AppTextStyle.bold16.copyWith(
                  color: AppColor.main,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
