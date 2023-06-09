import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/api/product/api_product.dart';
import 'package:quanlyquantrasua/screens/product-detail/product-detail.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';
import '../banner/banner_list.dart';
import 'list_category.dart';

class GroceryContainer extends StatelessWidget {
  const GroceryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1300.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ///// HIEN THI DANH MUC TU WIDGET CATEGORY O DAY ////
          Column(
            children: [
              MenuCategoryList(),
            ],
          ),
          const SizedBox(
            height: 19.0,
          ),
          //WIDGET HIEN THI BANNER VOUCHER O DAY//
          const Column(
            children: [
              BannerList(),
            ],
          ),
          const SizedBox(
            height: 26.22,
          ),
          Container(
            height: 20.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Món Mới Về Nè...",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "Xem Tất Cả",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1CB069),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13.87,
          ),
          ListDishView(),
        ],
      ),
    );
  }
}

class ListDishView extends StatelessWidget {
  ListDishView({Key? key}) : super(key: key);

  final controller = Get.find<DishApi>();

  @override
  Widget build(BuildContext context) {
    controller.getAllDish();
    return Obx(() {
      if (controller.listDish.value != null) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 2,
              childAspectRatio: 160.06 / 190.42,
            ),
            itemCount: controller.listDish.value!.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = controller.listDish.value![index];
              var price = item.price ?? 0.0;
              double discount = (price * 10) / 100;
              double totalDiscount = price - discount;
              return InkWell(
                onTap: () {
                  slideinTransition(
                    context,
                    ProductDetailScreen(
                      dish: item,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFDFD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 97.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.network(
                                "${item.image}",
                                scale: 20,
                              ).image,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11.35,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item.dishName}",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8.65,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${item.categories?.categoryName}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff8B9E9E),
                                  ),
                                ),
                                const SizedBox(
                                  width: 22.0,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 13.2,
                            ),
                            Row(
                              children: [
                                Text(
                                  price.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff02A88A),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6.66,
                                ),
                                Text(
                                  "$totalDiscount",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                    color: const Color(0xffF25822),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
