import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';

class MyCategoryList extends GetView<HomeControllerImp> {
  const MyCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
            i: index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print("===============id passed is ${categoriesModel.categoriesId!}");
        // controller.goToItems(
        //     controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          SizedBox(
            // decoration: BoxDecoration(
            //   color: AppColor.thirdColor,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            // padding: const EdgeInsets.symmetric(horizontal: 0),
            height: 70,
            width: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageCategory}/${categoriesModel.categoriesImage}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
