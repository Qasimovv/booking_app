import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/core/constant/app_size.dart';
import 'package:test_app/core/constant/colors.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/constant/routes-names.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:test_app/core/widgets/button-widgets/rectangle_button.dart';
import 'package:test_app/core/widgets/button-widgets/text_button.dart';
import 'package:test_app/core/widgets/image-widgets/termin_image_widget.dart';
import 'package:test_app/core/widgets/loading_widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/core/widgets/text-field-widgets/custom_text_form_filed_widget.dart';
import 'package:test_app/futures/authentication/login/view-model/user_login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:test_app/futures/authentication/login/recovery-password/view/recovery_password_view.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  int selectIndex = 0;
  String email, password;
  //Keys keyy = new Keys();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: AppSize.calculateHeight(context, 95)),
                Center(child: TerminImageWidget(height: 76, widgth: 184)),
                SizedBox(height: AppSize.calculateHeight(context, 58)),
                Center(child: selectedBar(context)),
                SizedBox(height: AppSize.calculateHeight(context, 30)),
                _form(),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildTextButton(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: calculateHeight(context, 30),
                ),
                RectangleButton(
                    width: 153,
                    height: 32,
                    borderColor: ColorConst.programColor,
                    backgroundColor: ColorConst.programColor,
                    textColor: ColorConst.whiteTextColor,
                    title: 'login',
                    onPressed: () {
                      checkValidate(context);
                    }),
                SizedBox(
                  height: AppSize.calculateHeight(context, 12),
                ),
                RectangleButton(
                    width: 153,
                    height: 32,
                    borderColor: ColorConst.programColor,
                    backgroundColor: Colors.white,
                    textColor: ColorConst.programTextColor,
                    title: 'sign_up',
                    onPressed: () {}),
                SizedBox(
                  height: calculateHeight(context, 173),
                ),
                CustomTextButton(
                  text: 'business_account',
                  onPressed: () {
                    SetupRoutes.replaceScreen(
                        context, Routes.COMPANY_EMPLOYEE_LOGIN);
                  },
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          //openAlertBox(context);
          //openAlertBox2(context);
          RecoveryPassword.openRecoveryPassword(context, Keys.scaffoldKey);
        },
        child: Text('forget_password'.tr(),
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            )));
  }

  Form _form() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            obscureText: false,
            hintText: 'email',
            labelText: 'email',
            focusColor: ColorConst.programColor,
            defaultColor: Colors.black,
            validations: Validations.validateEmail,
            onSaved: (data) {
              setState(() {
                email = data;
              });
            },
          ),
          CustomTextFormField(
            obscureText: true,
            hintText: 'password',
            labelText: 'password',
            defaultColor: Colors.black,
            focusColor: ColorConst.programColor,
            validations: Validations.validateAll,
            onSaved: (data) {
              setState(() {
                password = data;
              });
            },
          ),
        ],
      ),
    );
  }

  Container selectedBar(BuildContext context) {
    return Container(
      width: AppSize.calculateWidth(context, 326),
      height: AppSize.calculateHeight(context, 39),
      color: ColorConst.greyBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                height: AppSize.calculateHeight(context, 22),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      selectIndex = 0;
                      formKey.currentState.reset();
                    });
                  },
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (selectIndex == 0)
                                      ? ColorConst.programColor
                                      : Color(0xFFC5C5C5)),
                              height: AppSize.calculateHeight(context, 13),
                              width: AppSize.calculateHeight(context, 13),
                            ),
                          ),
                          Image.asset(
                            'assets/images/employee.png',
                            color: Colors.black,
                            width: AppSize.calculateWidth(context, 18),
                            height: AppSize.calculateHeight(context, 50),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: AppSize.calculateWidth(context, 14.5),
                      ),
                      Text(
                        'Customer'.tr(),
                        style: TextStyle(
                            fontSize: 14,
                            color: (selectIndex == 0)
                                ? ColorConst.programColor
                                : Color(0xFFC5C5C5)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.calculateWidth(context, 30),
              ),
              Visibility(
                visible: false,
                child: Container(
                  height: AppSize.calculateHeight(context, 22),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        selectIndex = 1;
                      });
                      formKey.currentState.reset();
                    },
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (selectIndex == 1)
                                        ? ColorConst.programColor
                                        : Color(0xFFC5C5C5)),
                                height: AppSize.calculateHeight(context, 13),
                                width: AppSize.calculateHeight(context, 13),
                              ),
                            ),
                            Image.asset(
                              'assets/images/employer.png',
                              color: Colors.black,
                              width: AppSize.calculateWidth(context, 18),
                              height: AppSize.calculateHeight(context, 50),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: AppSize.calculateWidth(context, 14.5),
                        ),
                        Text(
                          'Employer',
                          style: TextStyle(
                              fontSize: 14,
                              color: (selectIndex == 1)
                                  ? ColorConst.programColor
                                  : Color(0xFFC5C5C5)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.calculateHeight(context, 8),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: AppSize.calculateWidth(context, 163),
                height: 4,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (selectIndex == 0)
                          ? ColorConst.programColor
                          : Color(0xFFFDFCFC),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: (selectIndex == 0)
                        ? ColorConst.programColor
                        : Color(0xFFFDFCFC)),
              ),
              Visibility(
                visible: false,
                child: Container(
                  width: AppSize.calculateWidth(context, 163),
                  height: 4,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: (selectIndex == 1)
                            ? ColorConst.programColor
                            : Color(0xFFFDFCFC),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: (selectIndex == 1)
                          ? ColorConst.programColor
                          : Color(0xFFFDFCFC)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    LoadingWidget alert = LoadingWidget();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  checkValidate(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      showLoaderDialog(context);
      Provider.of<UserLoginViewModel>(context, listen: false)
          .login(context, email: email, password: password, userTypeEnum: 0);
    } else {}
  }
}
