// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      country: json['country'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      vehicleLicense: json['vehicleLicense'] as String,
      nid: json['NID'] as String,
      nidImg: json['NIDImg'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      role: json['role'] as String,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.nid,
      'NIDImg': instance.nidImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      '_id': instance.id,
      'createdAt': instance.createdAt,
    };
