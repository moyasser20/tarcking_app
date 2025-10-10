import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarcking_app/features/order_details/presentation/views/order_details_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/custom_Elevated_Button.dart';
import '../../../auth/domain/services/auth_services.dart';
import '../../../homescreen/presentation/view/home_screen.dart';
import '../../../homescreen/presentation/viewmodel/home_cubit.dart';
import '../../../../core/config/di.dart';
import '../cubits/nav_bar_cubit.dart';
import '../widgets/custom_nav_bar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      BlocProvider(
        create: (context) => getIt<HomeCubit>()..getOrders(),
        child: const HomeScreen(),
      ),

      OrderDetailsScreen(),
      const ProfileScreen(),
    ];

    return BlocProvider(
      create: (context) => NavBarCubit()..changeTab(context, 0),
      child: Builder(
        builder: (context) {
          return BlocBuilder<NavBarCubit, NavBarState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: screens[state.selectedIndex],
                bottomNavigationBar: SizedBox(
                  height: 80,
                  child: CustomBottomNavBarWidget(
                    currentIndex: state.selectedIndex,
                    onTap: (index) {
                      context.read<NavBarCubit>().changeTab(context, index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
