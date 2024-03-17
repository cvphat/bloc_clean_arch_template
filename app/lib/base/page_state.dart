import 'package:app/app/bloc/app_bloc.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:flutter/material.dart';

abstract class PageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageState<T, B, AppBloc> {}
