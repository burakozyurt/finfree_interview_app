import 'package:finfree_interview_app/pages/home_page_items/home_page_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
FlutterSecureStorage flutterSecureStorage;

setupLocators() {
  getIt.registerFactory(() => HomePageBloc());
  flutterSecureStorage = FlutterSecureStorage();
}
