import 'package:elevenia_app/feature/elevenia/presentation/pages/cart/cart_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/products/products_page.dart';
import 'package:elevenia_app/feature/elevenia/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

enum _SelectedTab { home, search, cart }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedPage(_SelectedTab.values.indexOf(_selectedTab)),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Colors.orange,
          ),

          /// Cart
          DotNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage(int index){
    switch(index){
      case 0:
        return ProductsPage();
      case 1:
        return SearchPage();
      case 2:
        return CartPage();
      default:
        return ProductsPage();
    }
  }

}
