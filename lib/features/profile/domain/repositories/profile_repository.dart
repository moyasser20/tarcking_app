import 'dart:io';
import '../../../../core/errors/api_result.dart';
import '../../data/models/change_password_request_model.dart';
import '../../data/models/change_password_response_model.dart';
import '../../data/models/edit_profile_request_model.dart';
import '../../data/models/edit_profile_response_model.dart';
import '../../data/models/upload_photo_response.dart';
import '../entity/user_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<UserEntity>> getProfile();
  Future<ChangePasswordResponseModel> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  );
  Future<ApiResult<EditProfileResponseModel>> editProfile(
    EditProfileRequestModel model,
  );
  Future<ApiResult<UploadPhotoResponse>> uploadPhoto(File photo);
}
