import 'package:educationapp/core/common/app/providers/user_provider.dart';
import 'package:educationapp/core/res/colours.dart';
import 'package:educationapp/core/res/fonts.dart';
import 'package:educationapp/core/services/injection_container.dart';
import 'package:educationapp/core/services/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
  
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Education App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
          useMaterial3: true,
          fontFamily: Fonts.poppins,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

