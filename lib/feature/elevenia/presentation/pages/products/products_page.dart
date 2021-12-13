import 'package:elevenia_app/core/route/main_route.dart';
import 'package:elevenia_app/core/utils/navigation_util.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_state.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/item_product/item_product.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/product/product.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  static const _pageSize = 24;

  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchPage(BuildContext context, int pageKey) async {
    print('PAGE KEY $pageKey');
    try {
      final List<Product> newItems = await context.read<ProductsCubit>().getProductsByPage(pageKey);
      final bool isLastPage = newItems.length < _pageSize;
      print('NEW ITEM SIZE ${newItems.length}');
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final int nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (err) {
      print(err);
      _pagingController.error = err;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 70, left: 20),
            child: Text(
              'Our Product',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => di<ProductsCubit>(),
              child: Center(
                child: BlocConsumer<ProductsCubit, ProductsState>(
                  listener: (BuildContext context, ProductsState state) {},
                  builder: (BuildContext context, ProductsState state) {
                    if (state is Init) {
                      context.read<ProductsCubit>().getProducts(1);
                      _pagingController.addPageRequestListener((pageKey) {
                        _fetchPage(context, pageKey);
                      });
                      return Text('Loading Products');
                    } else if (state is Loaded) {
                      return _displayOnProductsFound();
                    } else {
                      return Text('Something\'s wrong');
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayOnProductsFound() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PagedGridView<int, Product>(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 0.8,
              ),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, item, index) {
                  return ItemProduct(
                    product: item,
                    onItemPressed: () {
                      _onProductSelected(item.productNumber);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onProductSelected(String productNumber) {
    NavigationUtil.navigateTo(ROUTE_DETAIL_PRODUCT_PAGE, arguments: productNumber);
  }
}
