import 'package:injectable/injectable.dart';
import '../../data/datasource/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {}
