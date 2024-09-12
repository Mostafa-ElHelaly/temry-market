import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';

import 'package:temry_market/presentation/blocs/home/navbar_cubit.dart';
import 'package:temry_market/presentation/views/main/Recipes/recipes_view.dart';
import 'package:temry_market/presentation/views/main/cart/cart_view.dart';
import 'package:temry_market/presentation/views/main/category/category_view.dart';
import 'package:temry_market/presentation/views/main/home/home_view.dart';
import 'package:temry_market/presentation/views/main/other/other_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavbarCubit, int>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: context.read<NavbarCubit>().controller,
                  children: const <Widget>[
                    HomeView(),
                    CategoryView(),
                    RecipesView(),
                    CartView(),
                    OtherView(),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 18,
            right: 18,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: BlocBuilder<NavbarCubit, int>(
                builder: (context, state) {
                  return SnakeNavigationBar.color(
                    behaviour: SnakeBarBehaviour.floating,
                    snakeShape: SnakeShape.indicator,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                    ),
                    backgroundColor: AppColors.secondary,
                    snakeViewColor: AppColors.secondary,
                    elevation: 4,
                    selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                        ? Colors.black87
                        : null,
                    unselectedItemColor: Colors.white,
                    selectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                    showUnselectedLabels: false,
                    showSelectedLabels: true,
                    currentIndex: state,
                    onTap: (index) => setState(() {
                      context.read<NavbarCubit>().controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                      context.read<NavbarCubit>().update(index);
                    }),
                    items: const [
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/home.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/categories.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Category'),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("assets/navbar_icons/cooking.png"),
                          color: Colors.white,
                          size: 26,
                        ),
                        activeIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            maxRadius: 4,
                          ),
                        ),
                        label: 'Recipes',
                      ),

                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("assets/navbar_icons/shopping-cart.png"),
                          color: Colors.white,
                          size: 26,
                        ),
                        activeIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            maxRadius: 4,
                          ),
                        ),
                        label: 'Cart',
                      ),

                      BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/navbar_icons/user.png"),
                            color: Colors.white,
                            size: 26,
                          ),
                          activeIcon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              maxRadius: 4,
                            ),
                          ),
                          label: 'Other'),
                      // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
