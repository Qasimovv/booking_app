import 'package:flutter/material.dart';
import 'package:test_app/core/constant/app_size.dart';
import 'package:test_app/core/constant/colors.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/constant/routes-names.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/widgets/button-widgets/rectangle_button.dart';
import 'package:test_app/core/widgets/button-widgets/text_button.dart';
import 'package:test_app/core/widgets/image-widgets/termin_image_widget.dart';
import '../../../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 // Keys key = new Keys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: AppSize.calculateHeight(context, 107)),
              Center(child: TerminImageWidget(height: 76, widgth: 184)),
              SizedBox(height: AppSize.calculateHeight(context, 59)),
              RectangleButton(
                  width: 259,
                  height: 32,
                  borderColor: ColorConst.programColor,
                  backgroundColor: ColorConst.programColor,
                  textColor: ColorConst.whiteTextColor,
                  title: 'login',
                  onPressed: () {
                    SetupRoutes.changeScreen(context, Routes.USER_LOGIN_PAGE);
                  }),
              SizedBox(
                height: calculateHeight(context, 17),
              ),
              RectangleButton(
                  width: 259,
                  height: 32,
                  borderColor: ColorConst.programColor,
                  backgroundColor: Colors.white,
                  textColor: ColorConst.programTextColor,
                  title: 'sign_up',
                  onPressed: () {
                    SetupRoutes.changeScreen(
                        context, Routes.USER_REGISTER_PAGE);
                  }),
              SizedBox(
                height: calculateHeight(context, 39),
              ),
              SizedBox(
                width: calculateWidth(context, 81),
                height: 1,
                child: Container(
                  color: programColor,
                ),
              ),
              SizedBox(
                height: calculateHeight(context, 16),
              ),
              CustomTextButton(
                text: 'continue_without_login',
                onPressed: () {},
              ),
              SizedBox(
                height: calculateHeight(context, 27),
              ),
              Text(
                'or'.tr(),
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: calculateHeight(context, 27),
              ),
              CustomTextButton(
                text: 'business_account',
                onPressed: () {
                  SetupRoutes.changeScreen(
                      context, Routes.COMPANY_EMPLOYEE_LOGIN);
                },
              ),
              SizedBox(
                height: calculateHeight(context, 162),
              ),
              Expanded(
                child: bottomText(context),
              ),
            ],
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }

  Container bottomText(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
          child: Column(
            children: [
              Text(
                'terms1'.tr(),
                style: TextStyle(fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Service Policy and Coookie use.'.tr(),
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ));
  }
}
