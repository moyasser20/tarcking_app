import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/auth/domain/repositories/auth_repo.dart';

import '../../entities/vehicles_entity.dart';


@lazySingleton
class GetVehiclesUseCase {
  final AuthRepo _repository;

  GetVehiclesUseCase(this._repository);

  Future<List<VehicleEntity>> call() async {
    return await _repository.getVehicles();
  }
}
