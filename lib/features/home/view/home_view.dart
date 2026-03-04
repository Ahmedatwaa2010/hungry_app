import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/view/widgets/card_item.dart';
import 'package:hungry_app/features/home/view/widgets/food_category.dart';
import 'package:hungry_app/features/home/view/widgets/search_field.dart';
import 'package:hungry_app/features/home/view/widgets/user_header.dart';
import 'package:hungry_app/features/product/view/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = [
    "All",
    "Burger",
    "Pizza",
    "Salad",
    "Dessert",
    "Drinks",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 200,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Gap(30), UserHeader(), Gap(20), SearchField()],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    FoodCategory(
                      categories: categories,
                      selectedIndex: selectedIndex,
                    ),
                    Gap(30),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(),
                        ),
                      );
                    },
                    child: CardItem(
                      image: "assets/logo/test.png",
                      title: "Cheese Burger",
                      subtitle: "Fast Food",
                      rate: "4.5",
                    ),
                  ),
                  childCount: 10,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
