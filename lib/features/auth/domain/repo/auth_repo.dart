import '../entities/apply_entites/driver_entity.dart';
import '../entities/apply_entites/vehicle_enitity.dart';

abstract class AuthRepo {
  Future<DriverEntity> applyDriver({
    required String country,
    required String firstName,
    required String lastName,
    required String vehicleType,
    required String vehicleNumber,
    required String vehicleLicensePath,
    required String nid,
    required String nidImgPath,
    required String email,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  });
  Future<List<VehicleEntity>> getVehicles();
}
