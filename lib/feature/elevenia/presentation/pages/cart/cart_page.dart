
import 'package:elevenia_app/core/route/main_route.dart';
import 'package:elevenia_app/core/utils/navigation_util.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_state.dart';
import 'package:elevenia_app/feature/elevenia/presentation/widgets/item_cart/item_cart.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 70, left: 20),
            child: Text(
              'My Cart',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => di<CartCubit>(),
              child: Center(
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (BuildContext context, CartState state) {},
                  builder: (BuildContext context, CartState state) {
                    if (state is Init) {
                      context.read<CartCubit>().getCartProducts();
                      return Text('Loading Products');
                    } else if (state is Loaded) {
                      return _displayOnProductsFound(state.products);
                    } else if (state is Error) {
                      return Text(state.message);
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

  Widget _displayOnProductsFound(List<DetailProduct> listDetailProduct) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: List.generate(
                listDetailProduct.length, (int index) {
                  return ItemCart(
                    detailProduct: listDetailProduct[index],
                    onItemPressed: () {
                      _onProductSelected(listDetailProduct[index].productNumber);
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
