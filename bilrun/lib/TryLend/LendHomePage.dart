import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/TryLend/LendController.dart';
import 'package:bilrun/TryLend/LendView.dart';



class HomePage extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
        elevation: 0,
        leading: Icon(
        Icons.arrow_back_ios,
    ),
    actions: [
    IconButton(
    icon: Icon(
    Icons.shopping_cart,
    ),
    onPressed: () {},
    )
    ],
    ),

      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'ShopX',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
            ),
          ),
          IconButton(
              icon: Icon(Icons.view_list_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
        ],
      ),
    ),


            Expanded(
              child: Obx(() {
                if (productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return
                      GridView.count(
                        crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,

                        children: List.generate(3,
                            (index) {
                          return ProductTile(productController.productList[index]);
                            }

                        ),



                      );


                  //   listView.countBuilder(
                  //   crossAxisCount: 2,
                  //   itemCount: productController.productList.length,
                  //   crossAxisSpacing: 16,
                  //   mainAxisSpacing: 16,
                  //   itemBuilder: (context, index) {
                  //     return ProductTile(productController.productList[index]);
                  //   },
                  //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  // );

              }),
            )
          ],
      ),
    );







  }
}
