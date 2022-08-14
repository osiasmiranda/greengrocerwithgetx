import 'package:flutter/material.dart';

import '../cart/cart_tab.dart';
import '../home/home_tab.dart';
import '../orders/orders_tab.dart';
import '../profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

int currentTabIndex = 0;
final pageController = PageController();

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Checkout',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'Pedidos',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      items: kBottomNavBarItems,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTabIndex,
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withAlpha(100),
      onTap: (int index) {
        setState(
          () {
            currentTabIndex = index;
            // pageController.jumpToPage(index);
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          },
        );
      },
    );
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
          // kTabPages[currentTabIndex],
        ],
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
