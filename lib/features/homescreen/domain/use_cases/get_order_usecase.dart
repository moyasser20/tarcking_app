
import 'package:injectable/injectable.dart';

import '../entities/order_response_entity.dart';
import '../repositories/home_repo.dart';

@injectable
class GetOrderUseCase {
  final HomeRepo _homeRepo;

  GetOrderUseCase(this._homeRepo);

  Future<OrdersResponseEntity> call() async {
    print("========================${_homeRepo.getOrders()}========================");
    return await _homeRepo.getOrders();

  }
}