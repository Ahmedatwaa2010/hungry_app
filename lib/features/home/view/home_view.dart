import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/features/home/view/data/product_model.dart';
import 'package:hungry_app/features/home/view/data/product_repo.dart';
import 'package:hungry_app/features/home/view/widgets/card_item.dart';
import 'package:hungry_app/features/home/view/widgets/food_category.dart';
import 'package:hungry_app/features/home/view/widgets/search_field.dart';
import 'package:hungry_app/features/home/view/widgets/user_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

  ProductRepo productRepo = ProductRepo();

  List<ProductModel>? products;

  Future<void> getProducts() async {
    final res = await productRepo.getProducts();
    setState(() {
      products = res;
    });
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Skeletonizer(
        enabled: products == null,
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
                    children: const [
                      Gap(30),
                      UserHeader(),
                      Gap(20),
                      SearchField(),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      FoodCategory(
                        categories: categories,
                        selectedIndex: selectedIndex,
                      ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = products?[index];
                    if (product == null) {
                      return const SizedBox();
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, productRouter);
                      },
                      child: CardItem(
                        image: product.image ?? "",
                        title: product.name ?? "",
                        subtitle: product.description ?? "",
                        rate: product.rating ?? "",
                      ),
                    );
                  }, childCount: products?.length ?? 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
