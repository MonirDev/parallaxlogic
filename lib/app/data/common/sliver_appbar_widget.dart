import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String titleText;
  final String sliderImg;
  final bool showLeading;
  const SliverAppBarWidget(
      {super.key,
      required this.titleText,
      required this.showLeading,
      required this.sliderImg});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
        builder: (context, constraints) => SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 180.sp,
              pinned: true,
              primary: true,
              flexibleSpace: _buildSLiderImageWithtitle(constraints),
              leading: showLeading ? _buildleading() : const SizedBox(),
              backgroundColor: AppColors.primaryColor,
            ));
  }

//Build Slider Image with title
  FlexibleSpaceBar _buildSLiderImageWithtitle(SliverConstraints constraints) {
    return FlexibleSpaceBar(
      background: CachedNetworkImage(
        imageUrl: sliderImg,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildImgPlaceholder(),
        errorWidget: (context, url, error) => _buildImgPlaceholder(),
      ),
      title: Text(
        constraints.scrollOffset > 130.sp ? titleText : "",
        style: AppTextStyle.bw16,
      ),
      centerTitle: true,
    );
  }

//Build Image PlaceHolder
  Widget _buildImgPlaceholder() {
    return Icon(
      Icons.broken_image,
      size: Get.width * 0.25,
      color: AppColors.grey.withOpacity(0.3),
    );
  }

  //Build Leading
  Widget _buildleading() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios,
        size: 20.sp,
        color: AppColors.white,
      ),
    );
  }
}
