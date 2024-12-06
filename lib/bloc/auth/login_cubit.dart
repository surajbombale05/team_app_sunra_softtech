// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:team_app/utility/constants/api_endpoints.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio _dio = Dio();

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    const url =
        ApiEndpoints.adminloginUrl;
    final payload = {"login": username, "password": password};
    try {
      final response = await _dio.post(url, data: payload);

      if (response.statusCode == 200) {
        emit(LoginSuccess("Login successful!"));
      } else {
        emit(LoginFailure("Login failed. Please check your credentials."));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
