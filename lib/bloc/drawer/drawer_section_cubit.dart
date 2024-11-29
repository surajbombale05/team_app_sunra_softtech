import 'package:team_app/bloc/drawer/drawer_section_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial('Dashboard'));

  void setSelectedTab(String tab) {
    emit(TabInitial(tab));
  }
}
