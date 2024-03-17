import 'package:app/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class PageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageState<T, B, AppBloc> {}
