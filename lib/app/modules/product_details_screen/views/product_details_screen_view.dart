import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';
import 'package:parallaxlogic/app/utils/spacer_widgets.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenView extends GetView<ProductDetailsScreenController> {
  ProductDetailsScreenView({super.key});
  @override
  final ProductDetailsScreenController controller =
      Get.put(ProductDetailsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: _appbar(),
      body: controller.obx(
        (data) => Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            _buildBody(),
            _buildSubmitButton(),
          ],
        ),
        onLoading: _buildLoader(),
      ),
    );
  }

  //Build Body
  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        _buildImage(),
        _buildTitleHeader(),
        _buildProductDetails(),
      ],
    );
  }

//Build Title header
  Widget _buildTitleHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLabel(),
            SpacerWidget.w10,
            _buildPrice(),
          ],
        ),
      ),
    );
  }

//Build Product details
  Widget _buildProductDetails() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRating(),
            SpacerWidget.h10,
            _buildDescription(),
          ],
        ),
      ),
    );
  }

//Build Submit Button
  Widget _buildSubmitButton() {
    return Positioned(
      bottom: 0,
      child: TextButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(AppColors.red),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 60.sp),
          child: Text(
            Constants.addToCart,
            style: AppTextStyle.bw16,
          ),
        ),
      ),
    );
  }

//Build Description
  Widget _buildDescription() {
    return Text(
      controller.product.value.description ?? "",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style:
          AppTextStyle.nw12.copyWith(color: AppColors.white.withOpacity(0.7)),
    );
  }

//Build Label
  Widget _buildLabel() {
    return Expanded(
      child: Text(
        controller.product.value.title ?? "",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.bw16,
      ),
    );
  }

  //Build Price
  Widget _buildPrice() {
    return SizedBox(
      width: 60.sp,
      child: Text(
        "\$${controller.product.value.price ?? ""}",
        style: AppTextStyle.bw14,
      ),
    );
  }

//Build rating
  Widget _buildRating() {
    return RatingBar.builder(
      initialRating: 3.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 15.sp,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

//Build Image
  Widget _buildImage() {
    return SliverToBoxAdapter(
      child: Stack(children: [
        Container(
          width: Get.width,
          height: 180.sp,
          padding: EdgeInsets.all(10.sp),
          color: AppColors.white,
          child: CachedNetworkImage(
            imageUrl: controller.product.value.image ?? '',
            fit: BoxFit.contain,
            placeholder: (context, url) => _buildImgPlaceholder(),
            errorWidget: (context, url, error) => _buildImgPlaceholder(),
          ),
        ),
        _buildWishlistIcon()
      ]),
    );
  }

//Build Wishlist Icon
  Widget _buildWishlistIcon() {
    return Positioned(
      top: 10.sp,
      right: 20.sp,
      child: Container(
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(20.sp),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 20.sp,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

//Build AppBar
  AppBar _appbar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: AppColors.white,
        ),
      ),
      title: Text(
        Constants.productDetails,
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

  //Build Loader
  Widget _buildLoader() {
    return Center(
      child: SpinKitThreeInOut(
        color: AppColors.grey,
        size: 25.sp,
      ),
    );
  }
}
