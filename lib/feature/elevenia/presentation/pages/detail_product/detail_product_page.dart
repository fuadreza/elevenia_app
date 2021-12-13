
import 'package:elevenia_app/core/extensions/string_extension.dart';
import 'package:elevenia_app/core/theme/app_colors.dart';
import 'package:elevenia_app/core/utils/icon_util.dart';
import 'package:elevenia_app/core/utils/navigation_util.dart';
import 'package:elevenia_app/feature/elevenia/domain/entities/detail_product/detail_product.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_state.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailProductPage extends StatelessWidget {
  final String productNumber;

  const DetailProductPage({
    Key? key,
    required this.productNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: () {
           NavigationUtil.back();
         },
       ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: BlocProvider(
              create: (_) => di<DetailProductCubit>(),
              child: Center(
                child: BlocConsumer<DetailProductCubit, DetailProductState>(
                  listener: (BuildContext context, DetailProductState state) {},
                  builder: (BuildContext context, DetailProductState state) {
                    if (state is Init) {
                      context.read<DetailProductCubit>().getDetailProduct(productNumber);
                      return Text('Loading Products');
                    } else if (state is Loaded) {
                      return _displayOnProductsFound(context, state.product);
                    } else {
                      return Text('Something\'s wrong');
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayOnProductsFound(BuildContext context, DetailProduct detailProduct) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    detailProduct.productImage,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if(loadingProgress == null) {
                        return child;
                      } else {
                        return Icon(
                          Icons.image,
                        );
                      }
                    },
                    fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return Icon(
                        IconUtil.getRandomIcon(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text(
              detailProduct.productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 4),
            Text(
              detailProduct.sellPrice.toRupiahFormat(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.danger,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if(detailProduct.isOnCart) {
                  context.read<DetailProductCubit>().removeProductFromCart(detailProduct);
                  NavigationUtil.back();
                } else {
                  context.read<DetailProductCubit>().addProductToCart(detailProduct);
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: detailProduct.isOnCart ? AppColors.snow : AppColors.primary,
                child: Icon(
                  detailProduct.isOnCart
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                  color: detailProduct.isOnCart
                      ? AppColors.primary
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 18,
              ),
            ),
            Html(
              data: detailProduct.productDescription,
            ),
          ],
        ),
      ),
    );
  }
}
