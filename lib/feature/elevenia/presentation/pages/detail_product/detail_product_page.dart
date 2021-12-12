
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/detail_product/detail_product_state.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatelessWidget {
  final String productNumber;

  const DetailProductPage({
    Key? key,
    required this.productNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    return Container(
                      child: Center(
                        child: Text('Product : ${state.product.productName}'),
                      ),
                    );
                  } else {
                    return Text('Something occur');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
