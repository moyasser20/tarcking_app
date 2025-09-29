import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/custom_Elevated_Button.dart';
import '../../../auth/domain/services/auth_services.dart';
import '../cubits/nav_bar_cubit.dart';
import '../widgets/custom_nav_bar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Center(child: Text("home")),
      Center(child: Text("orders")),
      Center(
        child: CustomElevatedButton(
          text: "Logout",
          onPressed: () async {
            await AuthService.logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          },
        ),
      ),
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
