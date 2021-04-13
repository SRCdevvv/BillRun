import 'package:bilrun/TryLend/LendModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'lend_controller.dart';
import 'lend_product_list.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/model/product_model.dart';


void main()=>runApp(LendMain());

class LendMain extends StatefulWidget {

  LendMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LendMainState createState() => _LendMainState();
}

class _LendMainState extends State<LendMain> {

  final ProductController productController = Get.put(ProductController());






  @override
  Widget build(BuildContext context) {



      return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child:
        BillrunAppbar(),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Obx(()
    {
          if (productController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else

            return
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                children: List.generate(
               productController.productList.length,


                        (index) {

                          return LendProductTile(productController.productList[index]);
                        }




                ),


              );
    }

            ),
    ),
        ],
      ),
    );


}



}

