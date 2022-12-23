import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:parallaxlogic/app/data/common/sliver_appbar_widget.dart';
import 'package:parallaxlogic/app/data/models/product_model.dart';
import 'package:parallaxlogic/app/modules/home/widgets/category_section_header.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';
import 'package:parallaxlogic/app/utils/spacer_widgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: controller.obx(
        (data) => _buildBody(),
        onLoading: _buildLoader(),
      ),
    );
  }

  //Build Body
  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        const SliverAppBarWidget(
          titleText: Constants.home,
          sliderImg: Constants.sliderImg1,
          showLeading: false,
        ),
        const CategorySectionHeader(label: Constants.menClothing),
        _buildProductList(controller.menClothingList),
        const CategorySectionHeader(label: Constants.womenClothing),
        _buildProductList(controller.womenClothingList),
        const CategorySectionHeader(label: Constants.electronics),
        _buildProductList(controller.electronicsProductList),
        const CategorySectionHeader(label: Constants.jewelery),
        _buildProductList(controller.jeweleryProductList),
        SliverToBoxAdapter(
          child: SpacerWidget.h20,
        ),
      ],
    );
  }

  //Build Category Product List
  Widget _buildProductList(List<ProductModel> list) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 230.sp,
          width: Get.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: list
                .asMap()
                .map((index, value) {
                  return MapEntry(
                    index,
                    _buildProduct(list[index]),
                  );
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

// //Build Product
  Widget _buildProduct(ProductModel product) {
    return GestureDetector(
      onTap: () => controller.goToDetailspage(product.id ?? 1),
      child: Container(
        height: Get.width * 0.5,
        width: Get.width * 0.33,
        margin: EdgeInsets.only(right: 10.sp),
        child: Stack(
          children: [
            _buildImage(product.image ?? ""),
            Positioned(
              right: 0,
              top: Get.width * 0.35 - 15.sp,
              child: _buildWishlistIcon(),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRating(),
                  SpacerWidget.h8,
                  SizedBox(
                    width: Get.width * 0.33,
                    child: Text(
                      product.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bw14,
                    ),
                  ),
                  SpacerWidget.h8,
                  Text(
                    "${product.price ?? 0} Tk",
                    style: AppTextStyle.bw14.copyWith(color: AppColors.red),
                  ),
                  SpacerWidget.h8,
                ],
              ),
            ),
          ],
        ),
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
      itemSize: 12.sp,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

//Build Wishlist Icon
  Widget _buildWishlistIcon() {
    return Container(
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
    );
  }

//Build Image
  Widget _buildImage(String url) {
    return Container(
      height: Get.width * 0.35,
      width: Get.width * 0.33,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.sp))),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        placeholder: (context, url) => _buildImgPlaceholder(),
        errorWidget: (context, url, error) => _buildImgPlaceholder(),
      ),
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
