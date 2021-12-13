
import 'package:elevenia_app/core/route/main_route.dart';
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:elevenia_app/core/utils/navigation_util.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/search/search_products_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/search/search_products_state.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/item_product/item_product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/search_bar/search_bar.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => di<SearchProductsCubit>(),
          child: Container(
            margin: EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: BlocConsumer<SearchProductsCubit, SearchProductsState>(
                    listener: (context, state) {
                      print('state');
                    },
                    builder: (context, state) {
                      if (state is Init) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchProductsCubit>().searchProducts(data);
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Center(
                                child: Text('Type something'),
                              ),
                            ),
                          ],
                        );
                      } else if (state is Loading) {
                        return Column(
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchProductsCubit>().searchProducts(data);
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.search,
                                      size: 96,
                                      color: AppColors.darkGrey,
                                    ),
                                    Text(
                                      'Finding products for you',
                                      style: TextStyle(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is Loaded) {
                        return _displayOnProductsFound(context, state.products);
                      } else if (state is Empty) {
                        return _displayOnRestaurantsNotFound(context, state.message);
                      } else if (state is Error) {
                        return Column(
                          children: [
                            SearchBar(
                              onSubmit: (data) {
                                context.read<SearchProductsCubit>().searchProducts(data);
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.no_food,
                                      size: 96,
                                      color: AppColors.darkGrey,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      state.message,
                                      style: TextStyle(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text('Empty'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayOnProductsFound(BuildContext context, List<Product> products) {
    return Column(
      children: [
        SearchBar(
          onSubmit: (data) {
            context.read<SearchProductsCubit>().searchProducts(data);
          },
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 0.8,
            ),
            children: List.generate(
              products.length,
                  (index) {
                return InkWell(
                  onTap: () {
                    _onProductSelected(context, products[index].productNumber);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: ItemProduct(product: products[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayOnRestaurantsNotFound(BuildContext context, String message){
    return Column(
      children: [
        SearchBar(
          onSubmit: (data) {
            context.read<SearchProductsCubit>().searchProducts(data);
          },
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Center(
            child: Text(message),
          ),
        ),
      ],
    );
  }

  _onProductSelected(BuildContext context, String productNumber) {
    NavigationUtil.navigateTo(ROUTE_DETAIL_PRODUCT_PAGE, arguments: productNumber);
  }
}
