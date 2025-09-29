import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/use_cases/get_order_usecase.dart';
import 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  final GetOrderUseCase _getOrdersUseCase;

  HomeCubit(this._getOrdersUseCase) : super(HomeInitialState());

  Future<void> getOrders() async {
    emit(HomeLoadingState());
    try {
      final ordersResponse = await _getOrdersUseCase();
      emit(HomeSuccessState(ordersResponse));
    } on Failure catch (failure) {
      emit(HomeErrorState(failure.errorMessage));
    } catch (e) {
      emit(HomeErrorState("Unexpected error: ${e.toString()}"));
    }
  }

}
