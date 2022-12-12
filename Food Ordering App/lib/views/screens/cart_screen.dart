import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/products_list_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed('/HomePage');
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                if (productListController.products[i].quantity > 0) {
                  return Stack(
                    children: [
                      Container(
                        height: 236,
                        width: 200,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Image.asset(
                              alignment: Alignment.center,
                              height: 100,
                              productListController.products[i].image,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              productListController.products[i].name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 15),
                                const Text(
                                  "20min",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade600,
                                  size: 26,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "\$ ${productListController.products[i].price}.00",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Qut : ${productListController.products[i].quantity}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    productListController.removeToCart(
                                        product:
                                            productListController.products[i]);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 25, right: 30),
                        alignment: AlignmentDirectional.topCenter,
                        child: Obx(
                          () => IconButton(
                            onPressed: () {
                              productListController.addToFavouriteAndRemove(
                                index: i,
                                product: productListController.products[i],
                                i: i,
                              );
                            },
                            icon: Icon(
                              (productListController.products[i].isLike ==
                                      false)
                                  ? Icons.favorite_outline
                                  : Icons.favorite,
                              color:
                                  (productListController.products[i].isLike ==
                                          false)
                                      ? null
                                      : Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
              itemCount: productListController.products.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 16),
            child: Row(
              children: [
                const Text(
                  "PRICE DETAILS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "(${productListController.totalCartProduct} Item)",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 16),
            child: Row(
              children: [
                const Text(
                  "Total Quantity    :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const Spacer(),
                Text(
                  "${productListController.totalCartProduct}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 16),
            child: Row(
              children: const [
                Text(
                  "Delivery fee        :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                Text(
                  "FREE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          const Divider(
            thickness: 0.90,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 16),
            child: Row(
              children: [
                const Text(
                  "Total Price          :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$ ${productListController.totalPrice}.00",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Buy",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
