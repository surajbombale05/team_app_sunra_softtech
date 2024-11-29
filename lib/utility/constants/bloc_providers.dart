
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/bloc/drawer/drawer_section_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blocProvider = [
  BlocProvider(create: (context) => TabCubit()),
];