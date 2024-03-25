import 'package:educationapp/core/common/views/page_under_construction.dart';
import 'package:educationapp/core/extensions/context_extention.dart';
import 'package:educationapp/core/services/injection_container.dart';
import 'package:educationapp/src/auth/data/models/user_model.dart';
import 'package:educationapp/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:educationapp/src/auth/presentation/views/forgot_password_screen.dart';
//import 'package:educationapp/src/auth/presentation/views/forgot_password_screen.dart';
import 'package:educationapp/src/auth/presentation/views/sign_up_screen.dart';
import 'package:educationapp/src/dashboard/presentation/views/dashboard_screen.dart';
import 'package:educationapp/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:educationapp/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:educationapp/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/auth/presentation/views/sign_in_screen.dart';

part 'router.main.dart';