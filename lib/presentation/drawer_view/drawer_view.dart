import 'package:flutter/material.dart';
import 'package:team_app/presentation/drawer_view/widgets/client_detail_view_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/closed_deal_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/dashboard_view.dart';
import 'package:team_app/presentation/drawer_view/widgets/lead_conversation.dart';
import 'package:team_app/presentation/drawer_view/widgets/project_detail_view_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/user_list_widget.dart';
import 'package:team_app/presentation/notification_screen/notification_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

import 'widgets/recieview_links_widget.dart';
import 'widgets/your_target_widget.dart';

class DrawerViewScreen extends StatelessWidget {
  DrawerViewScreen({super.key});

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  String drawerButton = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: _drawerWidget(),
      appBar: AppBar(
        forceMaterialTransparency: true,
        excludeHeaderSemantics: true,
        // elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          // open drawer
                          _globalKey.currentState?.openDrawer();
                        },
                        child: Image.asset(AppImages.drawerIcon)))),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ));
                },
                child: Image.asset(AppImages.notificationsIcon)),
            const SizedBoxWidget(
              width: 12,
            ),
            Image.asset(AppImages.profileIcon),
          ],
        ),
      ),
      body: ClientDetailViewWidget(),
    );
  }

  _drawerWidget() {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    AppImages.profileIcon, // Replace with your image URL
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Nitish!",
                      color: AppColors.darkColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    TextWidget(
                     text:'Dashboard',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primarySkyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Drawer Menu Items
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(AppImages.dashboardIcon, 'Dashboard', (){}),
                _buildDrawerItem(AppImages.customerIcon, 'Customers', (){},),
                _buildDrawerItem(AppImages.leadIcon, 'Lead Conversions', (){},),
                _buildDrawerItem(AppImages.closedDealIcon, 'Closed Deals', (){}),
                _buildDrawerItem(AppImages.targetIcon, 'Targets', (){}),
                _buildDrawerItem(AppImages.paymentIcon, 'Payments', (){}),
                _buildDrawerItem(AppImages.pendingPayment, 'Pending Payments', (){}),
                _buildDrawerItem(AppImages.quatationIcon, 'Quotation', (){}),
                _buildDrawerItem(AppImages.referenceLink, 'Reference Links', (){}),
                _buildDrawerItem(AppImages.logoutIcon, 'Logout', (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String imgIcon, String title, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(imgIcon),
        title: TextWidget(text:title, fontSize: 16, fontWeight: FontWeight.w400, ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.backgroundDark, size: 16),
      ),
    );
  }
}
