import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/products_list_controller.dart';
import 'package:food_ordering_app/views/components/product_container.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  ProductListController productListController =
  Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Favourite Product",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
            Obx(
                  () => SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  mainAxisExtent: 260,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int i) {
                    return productContainer(
                      productListController: productListController,
                      i: i,
                    );
                  },
                  childCount: productListController.favouriteProductList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
