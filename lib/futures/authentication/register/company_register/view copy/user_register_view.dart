import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/constant/app_size.dart';
import 'package:test_app/core/constant/colors.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/validations/validations.dart';
import 'package:test_app/core/widgets/button-widgets/rectangle_button.dart';
import 'package:test_app/core/widgets/image-widgets/termin_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/core/widgets/loading_widgets/loading_widget.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/core/widgets/text-field-widgets/custom_text_form_filed_widget.dart';
import 'package:test_app/futures/authentication/register/user_register/view-model/user_register_view_model.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key key}) : super(key: key);

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  int selectIndex = 0;

  String name, surname, email, phone, password, rpass;
  int userTypesEnum = 1;

  //Keys keyy = new Keys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Keys.scaffoldKeyUserRegister,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: AppSize.calculateHeight(context, 95)),
                    Center(child: TerminImageWidget(height: 76, widgth: 184)),
                    SizedBox(height: AppSize.calculateHeight(context, 58)),
                    Center(child: selectedBar(context)),
                    SizedBox(height: AppSize.calculateHeight(context, 30)),
                    _form(),
                    SizedBox(
                      height: AppSize.calculateHeight(context, 30),
                    ),
                    RectangleButton(
                      backgroundColor: ColorConst.programColor,
                      borderColor: ColorConst.programColor,
                      textColor: ColorConst.whiteTextColor,
                      onPressed: () {
                        checkValidate(context);
                      },
                      title: 'register',
                      height: 32,
                      width: 153,
                    ),
                    SizedBox(
                      height: AppSize.calculateHeight(context, 13),
                    ),
                    TextButton(
                        onPressed: () {
                          // Route route = MaterialPageRoute(builder: (context) => SigninPage());
                          // Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          'do_you_have_an_account'.tr(),
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                  color: ColorConst.programColor,
                                  offset: Offset(0, -5))
                            ],
                            color: Colors.transparent,
                            fontSize: 16,
                            decorationColor: ColorConst.programColor,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      // Route route = MaterialPageRoute(builder: (context) => SigninBusinessPage());
                      // Navigator.pushReplacement(context, route);
                    },
                    child: Text(
                      'business_account'.tr(),
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: ColorConst.programColor,
                              offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        fontSize: 16,
                        decorationColor: ColorConst.programColor,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
          ),
        ));
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
                      Keys.formKeyUserRegister.currentState.reset();
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
                      Keys.formKeyUserRegister.currentState.reset();
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

  Form _form() {
    return Form(
      key: Keys.formKeyUserRegister,
      child: Column(
        children: [
          CustomTextFormField(
            obscureText: false,
            hintText: 'text',
            labelText: 'name',
            focusColor: ColorConst.programColor,
            defaultColor: Colors.black,
            validations: Validations.validateAll,
            onSaved: (data) {
              setState(() {
                name = data;
              });
            },
          ),
          CustomTextFormField(
            obscureText: false,
            hintText: 'text',
            labelText: 'surname',
            defaultColor: Colors.black,
            focusColor: ColorConst.programColor,
            validations: Validations.validateAll,
            onSaved: (data) {
              setState(() {
                surname = data;
              });
            },
          ),
          CustomTextFormField(
            obscureText: false,
            hintText: 'text',
            labelText: 'email',
            defaultColor: Colors.black,
            focusColor: ColorConst.programColor,
            validations: Validations.validateEmail,
            onSaved: (data) {
              setState(() {
                email = data;
              });
            },
          ),
          CustomTextFormField(
            obscureText: false,
            hintText: 'text',
            labelText: 'phone',
            defaultColor: Colors.black,
            focusColor: ColorConst.programColor,
            validations: Validations.validateAll,
            prefixText: '+',
            onSaved: (data) {
              setState(() {
                phone = data;
              });
            },
          ),
          CustomTextFormField(
            obscureText: true,
            hintText: 'text',
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
          CustomTextFormField(
            obscureText: true,
            hintText: 'text',
            labelText: 'rpass',
            defaultColor: Colors.black,
            focusColor: ColorConst.programColor,
            validations: Validations.validateAll,
            onSaved: (data) {
              setState(() {
                rpass = data;
              });
            },
          ),
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
    if (Keys.formKeyUserRegister.currentState.validate()) {
      Keys.formKeyUserRegister.currentState.save();
      if (password == rpass) {
        showLoaderDialog(context);
        Provider.of<UserRegisterViewModel>(context, listen: false).userSignUp(
            email,
            name,
            surname,
            phone,
            password,
            context,
            Keys.scaffoldKeyUserRegister);
      } else {
        
        MakeSnackBar.showInSnackBar(
            'register_completed', Colors.red, Keys.scaffoldKeyUserRegister);
      }
    } else {}
  }
}
