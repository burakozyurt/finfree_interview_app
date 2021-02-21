import 'package:finfree_interview_app/locator.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page_bloc.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page_manage_model.dart';
import 'package:finfree_interview_app/shared/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          bloc: getIt<HomePageBloc>(),
          child: ChangeNotifierProvider.value(value: HomePageManageModel(), child: HomePage())),
    );
  }
}
