
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/cart/cart_state.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          children: List.generate(
                            state.products.length, (int index) {
                              return InkWell(
                                onTap: () {

                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Text(state.products[index].productName),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is Error) {
                return Text(state.message);
              } else {
                return Text('Something\'s wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
