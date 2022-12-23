import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class CategorySectionHeader extends StatelessWidget {
  final String label;
  const CategorySectionHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLabel(),
            _buildViewAll(),
          ],
        ),
      ),
    );
  }

//Build Label
  Widget _buildLabel() {
    return Text(
      label.toUpperCase(),
      style: AppTextStyle.bw16,
    );
  }

  //Build view all
  Widget _buildViewAll() {
    return Text(
      Constants.viewAll.toUpperCase(),
      style:
          AppTextStyle.bw12.copyWith(color: AppColors.white.withOpacity(0.7)),
    );
  }
}
