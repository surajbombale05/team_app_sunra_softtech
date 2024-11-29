import 'package:team_app/utility/constants/app_strings.dart';

abstract class TabState {}

class TabInitial extends TabState {
   String selectedTab = AppStrings.dashboard;
  TabInitial(this.selectedTab);
}