import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/products_list_controller.dart';
import 'package:food_ordering_app/global/global.dart';
import 'package:food_ordering_app/views/components/product_container.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Align(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Icon(Icons.menu),
            ),
          ),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              const SizedBox(width: 5),
              Text(
                "Surat",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1559893088-c0787ebfc084?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 210,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      const Text(
                        "Hey Sujal",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Find your food",
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(0.12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.search,
                                color: Colors.green, size: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Search Food",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green,
                              ),
                              child:
                                  const Icon(Icons.sort, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 0001,
                title: Row(
                  children: [
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 0),
                      child: const Text("Food"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 1),
                      child: const Text(
                        "Fruits",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 2),
                      child: const Text(
                        "Grocery",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: textButtonStyle(i: 3),
                      child: const Text(
                        "Vegetables",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  mainAxisExtent: 260,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        indexForDetailScreen = i;
                        Get.toNamed("/details_screen");
                      },
                      child: productContainer(
                        productListController: productListController,
                        i: i,
                      ),
                    );
                  },
                  childCount: productListController.products.length,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  textButtonStyle({required int i}) {
    return TextButton.styleFrom(
      foregroundColor: Colors.green,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
