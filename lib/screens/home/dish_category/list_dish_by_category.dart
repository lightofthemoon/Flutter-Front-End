import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:quanlyquantrasua/api/category/api_category.dart';
import 'package:quanlyquantrasua/configs/mediaquery.dart';
import 'package:quanlyquantrasua/model/category_model.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_appbar.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_input_textformfield.dart';

class DishByCategory extends StatefulWidget {
  final CategoryModel category;

  const DishByCategory({super.key, required this.category});
  @override
  DishByCategoryState createState() => DishByCategoryState();
}

class DishByCategoryState extends State<DishByCategory> {
  List<DishModel> _dishes = []; // initialize an empty list of dishes
  List<DishModel> _filteredDishes =
      []; // initialize an empty list of filtered dishes
  TextEditingController searchController =
      TextEditingController(); // initialize a text controller for the search field
  final categoryController = Get.find<CategoryApi>();
  @override
  void initState() {
    super.initState();
    loadDishes(); // load the dishes when the screen is initialized
  }

  Future<void> loadDishes() async {
    List<DishModel>? dishes =
        await categoryController.loadDishByCategory(widget.category.id ?? 0);
    setState(() {
      _dishes = dishes ?? [];
      _filteredDishes = dishes ?? [];
    });
  }

  String? searchDishes(String? query) {
    // filter the dishes based on the search query
    List<DishModel> filteredDishes = [];
    if (_filteredDishes.isEmpty) {
      setState(() {
        _filteredDishes = _dishes;
      });
      return 'Không tìm thấy món :((';
    }
    if (query != null || query != '') {
      filteredDishes = _dishes
          .where((dish) =>
              dish.dishName
                  ?.toLowerCase()
                  .contains(query?.toLowerCase() ?? '') ??
              false)
          .toList();
      setState(() {
        _filteredDishes = filteredDishes;
      });
      return 'Tìm thấy ${_filteredDishes.length}';
    } else {
      filteredDishes = _dishes;
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: '${widget.category.categoryName}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: mediaHeight(context, 50),
            ),
            CustomInputTextField(
              controller: searchController,
              labelText: 'Tìm món',
              hintText: 'Nhập gì đó đi...',
              onChanged: searchDishes,
            ),
            SizedBox(
              height: mediaHeight(context, 50),
            ),
            DishesGridView(dishes: _filteredDishes),
          ],
        ),
      ),
    );
  }
}

class DishesGridView extends StatelessWidget {
  final List<DishModel> dishes;

  const DishesGridView({Key? key, required this.dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('${dishes[index].image}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${dishes[index].dishName}',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${dishes[index].price}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '\$${dishes[index].categories?.categoryName}',
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
