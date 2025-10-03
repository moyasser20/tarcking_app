import 'package:flutter/material.dart';

import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entity/user_entity.dart';

class EditVehicleScreen extends StatefulWidget {
  final UserEntity vehicle;
  const EditVehicleScreen({super.key, required this.vehicle});

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          local.profileTitle,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          iconSize: 24,
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context, isEdit);
          },
        ),
      ),

    );
  }
}
