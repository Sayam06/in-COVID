import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_covid/screens/add_hospital.dart';
import 'package:in_covid/screens/add_your_service_screen.dart';
import 'package:in_covid/screens/complains_screen.dart';
import 'package:in_covid/screens/hospital_data_splash_screen.dart';
import 'package:in_covid/screens/hospital_discrepancy_screen.dart';
import 'package:in_covid/screens/hospitals_details_screen.dart';
import 'package:in_covid/screens/how_to_use_screen.dart';
import 'package:in_covid/screens/home_screen_splash_screen.dart';
import 'package:in_covid/screens/hospitals_screen.dart';

import 'package:in_covid/screens/intro_screen.dart';
import 'package:in_covid/screens/intro_screen_error_screen.dart';
import 'package:in_covid/screens/our_team_screen.dart';
import 'package:in_covid/screens/service_provider_details.dart';
import 'package:in_covid/screens/service_providers_screen.dart';
import 'package:in_covid/screens/services_screen.dart';
import 'package:in_covid/screens/splash_screen.dart';
import 'package:in_covid/screens/success_screen.dart';
import 'package:in_covid/screens/twitter_search_screen.dart';
import 'package:in_covid/screens/user_data_details_screen.dart';
import 'package:in_covid/screens/user_data_screen_list.dart';
import 'package:in_covid/screens/user_data_splash_screen.dart';

import './screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'in-COVID',
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Montserrat',
          highlightColor: Colors.red),
      home: IntroScreens(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ServicesScreen.routeName: (ctx) => ServicesScreen(),
        ServiceProvidersScreen.routeName: (ctx) => ServiceProvidersScreen(),
        HospitalsScreen.routeName: (ctx) => HospitalsScreen(),
        SplashScreen.routeName: (ctx) => SplashScreen(),
        HomeScreenSplashScreen.routeName: (ctx) => HomeScreenSplashScreen(),
        ServiceProviderDetails.routeName: (ctx) => ServiceProviderDetails(),
        HowToUse.routeName: (ctx) => HowToUse(),
        HospitalDataSplashScreen.routeName: (ctx) => HospitalDataSplashScreen(),
        OurTeam.routeName: (ctx) => OurTeam(),
        HospitalsDetails.routeName: (ctx) => HospitalsDetails(),
        IntroScreenErrorScreen.routeName: (ctx) => IntroScreenErrorScreen(),
        AddYourServiceScreen.routeName: (ctx) => AddYourServiceScreen(),
        SuccessScreen.routeName: (ctx) => SuccessScreen(),
        ComplainsScreen.routeName: (ctx) => ComplainsScreen(),
        HospitalDiscrepancyScreen.routeName: (ctx) =>
            HospitalDiscrepancyScreen(),
        UserDataSplashScreen.routeName: (ctx) => UserDataSplashScreen(),
        UserDataScreenList.routeName: (ctx) => UserDataScreenList(),
        UserDataDetailsScreen.routeName: (ctx) => UserDataDetailsScreen(),
        IntroScreens.routeName: (ctx) => IntroScreens(),
        AddHospital.routeName: (ctx) => AddHospital(),
        TwitterSearchScreen.routeName: (ctx) => TwitterSearchScreen(),
        // IntroScreen.routeName: (ctx) => IntroScreen(),
      },
    );
  }
}
