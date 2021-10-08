import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/futures/authentication/login/view-model/user_login_view_model.dart';
import 'package:test_app/futures/authentication/register/user_register/view-model/user_register_view_model.dart';
// import 'package:test_app/screens/sigin_and_signup/main/main_page.dart';
import 'core/routes/routes.dart';
import 'futures/authentication/login/recovery-password/view-model/recovery_password_view_model.dart';
import 'package:provider/provider.dart';
//
//
bool status = false;
var role;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  status = prefs.getBool('isLoggedIn') ?? false;
  role = prefs.getString('role');
  print(status);
  //runApp(MaterialApp(home: status == true ? Login() : Home()));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  /*
  ios protrait mode ucun bunu elave etmek lazim olacaq
  <array>
    <string>UIInterfaceOrientationPortrait</string>
</array>
  * */

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserLoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordRecoveryViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserRegisterViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',

        /*  localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      SfGlobalLocalizations.delegate,
        ],
        supportedLocales: [
      const Locale('en'),
      const Locale('zh'),
      const Locale('he'),
      const Locale('ru'),
      const Locale('fr', 'BE'),
      const Locale('fr', 'CA'),
      const Locale('ja'),
      const Locale('de'),
      const Locale('hi'),
      const Locale('ar'),
      const Locale('tr'),
        ],
        locale: const Locale('tr'),*/
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: SetupRoutes.initialRoute,
        routes: SetupRoutes.routes,
        theme: ThemeData(
          accentColor: Color(0xff1EC8E4),
          primaryColor: Colors.white,
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
        ),
        // home: (role=='3')? MainPage():(role=='0')?NavigationForUser():Navigation(),
        //home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
