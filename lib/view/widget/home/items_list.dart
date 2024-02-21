import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class MyItemsListHome extends GetView<HomeControllerImp> {
  final List items;
  final List<ItemsModel> listdatamodel;
  const MyItemsListHome(
      {super.key, required this.items, required this.listdatamodel});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ItemsHome(
                  itemsModel: ItemsModel.fromJson(controller.items[i]),
                )),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
              // height: 200,
              // width: 150,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
