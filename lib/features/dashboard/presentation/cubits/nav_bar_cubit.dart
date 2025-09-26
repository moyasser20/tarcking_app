import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial(0));

  Future<void> changeTab(BuildContext context, int index) async {
    if (!isClosed) {
      emit(NavBarInitial(index));
    }
  }

  void navigateToCategories() {
    emit(NavBarInitial(1));
  }
}
