import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_cubit.dart';
import 'package:elevenia_app/feature/elevenia/presentation/blocs/home/products_state.dart';
import 'package:elevenia_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di<ProductsCubit>(),
        child: Center(
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listener: (BuildContext context, ProductsState state) {},
            builder: (BuildContext context, ProductsState state) {
              if (state is Init) {
                context.read<ProductsCubit>().getRestaurants();
                return Text('Loading Products');
              } else if (state is Loaded) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          children: List.generate(
                            state.products.length,
                            (int index) {
                              return InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(10),
                                child: Text(
                                  state.products[index].productName,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('Something occur');
              }
            },
          ),
        ),
      ),
    );
  }
}
