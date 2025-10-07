import 'package:flutter/material.dart';
import 'package:tarcking_app/core/contants/app_icons.dart';
import 'package:tarcking_app/core/extensions/extensions.dart';
import 'package:tarcking_app/features/myorders/presentation/widgets/order_status_widget.dart';

import '../../../../core/l10n/translation/app_localizations.dart';
import '../widgets/myorders_container_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(height: 160,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    },
                    child: Image.asset(AppIcons.arrowBackIcon)),
                const SizedBox(width: 20,),
                Text("My orders", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ),)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrderStatusWidget(ordersNumber: '5', icon:AppIcons.cancelledIcon, status: 'Cancelled',),
                const SizedBox(width: 20,),
                OrderStatusWidget(ordersNumber: '100', icon:AppIcons.acceptedIcon, status: 'Completed',),
              ],
            ),
            const SizedBox(height: 30,),
            Text(
              local.recentOrder, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ),).setHorizontalPadding(context, 0.015),
            const SizedBox(height: 30,),
            MyOrderContainerWidget(),
            const SizedBox(height: 20,),
            MyOrderContainerWidget(),
            const SizedBox(height: 20,),
            MyOrderContainerWidget(),
            const SizedBox(height: 20,),
            MyOrderContainerWidget(),
            const SizedBox(height: 20,),
        
          ],
        ).setHorizontalPadding(context, 0.04),
      ),
    );
  }
}
