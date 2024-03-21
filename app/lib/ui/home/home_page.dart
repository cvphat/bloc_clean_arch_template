import 'package:app/app/bloc/app_bloc.dart';
import 'package:app/base/page_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:core/core.dart';

import 'bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage, HomeBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Text(state.count.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                appBloc.add(const AppThemeChanged(themeMode: ThemeMode.dark));
              },
              child: const Text('Change to Dark'),
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Text(state.themeMode.name);
              },
            ),
            ScreenTypeLayout.builder(
              desktop: (_) => const Text('desktop'),
              tablet: (_) => const Text('tablet'),
              mobile: (_) => const Text('mobile'),
            ),
            ElevatedButton(
              onPressed: () {
                appBloc.add(const AppThemeChanged(themeMode: ThemeMode.light));
              },
              child: const Text('Change to Light'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                navigator.replace(const LoginRouteInfo());
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<CommonBloc, CommonState>(
        bloc: bloc.commonBloc,
        builder: (context, state) {
          return Visibility(
            visible: !state.isLoading,
            child: FloatingActionButton(
              onPressed: () {
                bloc.add(
                  Plus1Emitted(),
                );
              },
              child: const Icon(Icons.plus_one_outlined),
            ),
          );
        },
      ),
    );
  }
}
