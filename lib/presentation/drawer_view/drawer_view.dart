import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/bloc/drawer/drawer_section_cubit.dart';
import 'package:team_app/bloc/drawer/drawer_section_state.dart';
import 'package:team_app/presentation/drawer_view/widgets/client_detail_view_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/closed_deal_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/dashboard_view.dart';
import 'package:team_app/presentation/drawer_view/widgets/lead_conversation.dart';
import 'package:team_app/presentation/drawer_view/widgets/payments_section_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/pending_paymnets_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/project_detail_view_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/send_quatation_widget.dart';
import 'package:team_app/presentation/drawer_view/widgets/user_list_widget.dart';
import 'package:team_app/presentation/login_screen/login_screen.dart';
import 'package:team_app/presentation/notification_screen/notification_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/constants/app_strings.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

import 'widgets/recieview_links_widget.dart';
import 'widgets/your_target_widget.dart';

class DrawerViewScreen extends StatelessWidget {
  DrawerViewScreen({super.key});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // String drawerButton = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: _drawerWidget(context),
      appBar: AppBar(
        forceMaterialTransparency: true,
        excludeHeaderSemantics: true,
        // elevation: 0,
        automaticallyImplyLeading: false,
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
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
            );
          }
        ),
      ),
      // body: ProjectDetailViewWidget(),
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          if (state is TabInitial) {
            switch (state.selectedTab) {
              case AppStrings.dashboard:
                return const DashboardScreen();
              case AppStrings.leadConversation:
                return const LeadConversationScreen();
              case AppStrings.closedDeals:
                return const ClosedDealWidgetScreen();
              case AppStrings.customer:
                return const UserListWidgetScreen();
              case AppStrings.targets:
                return const YourTargetWidget();
              case AppStrings.payments:
                return const PaymentsSectionWidget();
              case AppStrings.pendingPayments:
                return const PendingPaymnetsWidget();
              case AppStrings.quotation:
                return const SendQuatationWidget();
              case AppStrings.refferalLinks:
                return RecieviewLinksWidgetScreen();

              default:
                return const Center(child: Text('Invalid tab selected'));
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  _drawerWidget(BuildContext context) {
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
                      text: 'Dashboard',
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
                _buildDrawerItem(AppImages.dashboardIcon, 'Dashboard', () {
                  context.read<TabCubit>().setSelectedTab(AppStrings.dashboard);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(
                  AppImages.customerIcon,
                  'Customers',
                  () {
                    context
                        .read<TabCubit>()
                        .setSelectedTab(AppStrings.customer);
                    _globalKey.currentState?.closeDrawer();
                  },
                ),
                _buildDrawerItem(
                  AppImages.leadIcon,
                  'Lead Conversions',
                  () {
                    context
                        .read<TabCubit>()
                        .setSelectedTab(AppStrings.leadConversation);
                    _globalKey.currentState?.closeDrawer();
                  },
                ),
                _buildDrawerItem(AppImages.closedDealIcon, 'Closed Deals', () {
                  context
                      .read<TabCubit>()
                      .setSelectedTab(AppStrings.closedDeals);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.targetIcon, 'Targets', () {
                  context.read<TabCubit>().setSelectedTab(AppStrings.targets);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.paymentIcon, 'Payments', () {
                  context.read<TabCubit>().setSelectedTab(AppStrings.payments);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.pendingPayment, 'Pending Payments',
                    () {
                  context
                      .read<TabCubit>()
                      .setSelectedTab(AppStrings.pendingPayments);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.quatationIcon, 'Quotation', () {
                  context.read<TabCubit>().setSelectedTab(AppStrings.quotation);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.referenceLink, 'Reference Links',
                    () {
                  context
                      .read<TabCubit>()
                      .setSelectedTab(AppStrings.refferalLinks);
                  _globalKey.currentState?.closeDrawer();
                }),
                _buildDrawerItem(AppImages.logoutIcon, 'Logout', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      String imgIcon, String title, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(imgIcon),
        title: TextWidget(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: AppColors.backgroundDark, size: 16),
      ),
    );
  }
}
