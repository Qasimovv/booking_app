import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_place/google_place.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/constant/app_size.dart';
import 'package:test_app/core/constant/colors.dart';
import 'package:test_app/core/constant/key.dart';
import 'package:test_app/core/models/location_model.dart' as location;
import 'package:test_app/core/validations/validations.dart';
import 'package:test_app/core/widgets/button-widgets/rectangle_button.dart';
import 'package:test_app/core/widgets/image-widgets/termin_image_widget.dart';
import 'package:test_app/core/widgets/loading_widgets/loading_widget.dart';
import 'package:test_app/core/widgets/sncakbar_widget/snackbar_widget.dart';
import 'package:test_app/core/widgets/text-field-widgets/custom_text_form_filed_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test_app/core/widgets/text-field-widgets/google_place_auto_complete_textfield.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/models/company_request_model.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/models/employee_request_model.dart';
import 'package:test_app/futures/authentication/register/company_employee_register/view-model/company_employee_view_model.dart';

class CompanyEmployeeRegisterPage extends StatefulWidget {
  const CompanyEmployeeRegisterPage({Key key}) : super(key: key);

  @override
  _CompanyEmployeeRegisterPageState createState() =>
      _CompanyEmployeeRegisterPageState();
}

class _CompanyEmployeeRegisterPageState
    extends State<CompanyEmployeeRegisterPage> {
  String name, surname, companyName, city, zip, country, buildingAddress;
  String email, phone, password, rpass, address;
  int selectIndex = 0;
  int userTypesEnum = 2;
  double lat, lng;

  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Keys.scaffoldKeyCompanyEmployeeRegister,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            Column(
              children: [
                SizedBox(height: AppSize.calculateHeight(context, 95)),
                Center(child: TerminImageWidget(height: 76, widgth: 184)),
                SizedBox(height: AppSize.calculateHeight(context, 58)),
                Center(child: selectedBar(context)),
                SizedBox(height: AppSize.calculateHeight(context, 30)),
                _form(),
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
              ],
            ),
          ])),
        ));
  }

  Container selectedBar(BuildContext context) {
    return Container(
      width: AppSize.calculateWidth(context, 326),
      height: AppSize.calculateHeight(context, 39),
      color: ColorConst.greyBackgroundColor,
      child: Center(
        child: Container(
          width: AppSize.calculateWidth(context, 326),
          height: AppSize.calculateHeight(context, 39),
          color: Color(0xFFFDFCFC),
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
                          userTypesEnum = 2;
                          selectIndex = 0;
                          Keys.formKeyComanyEmployeeRegister.currentState
                              .reset();
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
                            'employee'.tr(),
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
                    visible: true,
                    child: Container(
                      height: AppSize.calculateHeight(context, 22),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            userTypesEnum = 1;
                            selectIndex = 1;
                            Keys.formKeyComanyEmployeeRegister.currentState
                                .reset();
                          });
                        },
                        // color: Color(0xFFFDFCFC),
                        // elevation: 0,
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
                                    height:
                                        AppSize.calculateHeight(context, 13),
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
                              'employer'.tr(),
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
                    visible: true,
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
        ),
      ),
    );
  }

  Form _form() {
    return Form(
      key: Keys.formKeyComanyEmployeeRegister,
      child:
          (userTypesEnum == 2) ? _buildEmployeeColumn() : _buildCompanyColumn(),
    );
  }

  Column _buildEmployeeColumn() {
    return Column(
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
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
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
          labelText: 'company_name',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              companyName = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
          labelText: 'city',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              city = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
          labelText: 'zip',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              zip = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
          labelText: 'country',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              country = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
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
          obscureText: false,
          hintText: 'text',
          labelText: 'phone',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
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
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
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
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              rpass = data;
            });
          },
        ),
      ],
    );
  }

  void getDetils(context, String placeId) async {
    var googlePlace = GooglePlace("AIzaSyD1caUC_1LXjslxGkc6QaGk5jgrOqoUHbM");

    var result = await googlePlace.details.get(placeId);
    lat = result.result.geometry.location.lat;
    lng = result.result.geometry.location.lng;
    final coordinates = new Coordinates(lat, lng);
    var addressss =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    cityController.text = addressss.first.locality;
    countryController.text = addressss.first.countryName;
    print(addressss.first.postalCode);
    zipController.text = addressss.first.postalCode;
  }

  Column _buildCompanyColumn() {
    return Column(
      children: [
        CustomGooglePlaceAutoCompleteTextField(
          labelText: 'address',
          hintText: 'text',
          itmClick: (Prediction prediction) {
            addressController.text = prediction.description;
            addressController.selection = TextSelection.fromPosition(
                TextPosition(offset: prediction.description.length));
            getDetils(context, prediction.placeId);
          },
          onSaved: (data) {
            address = data;
          },
          getPlaceDetailWithLatLng: (data) {},
          textEditingController: addressController,
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
          labelText: 'company_name',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              companyName = data;
            });
          },
        ),
        CustomTextFormField(
          textEditingController: cityController,
          obscureText: false,
          hintText: 'text',
          labelText: 'city',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              city = data;
            });
          },
        ),
        CustomTextFormField(
          textEditingController: zipController,
          obscureText: false,
          hintText: 'text',
          labelText: 'zip',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              zip = data;
            });
          },
        ),
        CustomTextFormField(
          textEditingController: countryController,
          obscureText: false,
          hintText: 'text',
          labelText: 'country',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              country = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
          labelText: 'building_address',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              buildingAddress = data;
            });
          },
        ),
        CustomTextFormField(
          obscureText: false,
          hintText: 'text',
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
          obscureText: false,
          hintText: 'text',
          labelText: 'phone',
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
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
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
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
          focusColor: ColorConst.programColor,
          defaultColor: Colors.black,
          validations: Validations.validateAll,
          onSaved: (data) {
            setState(() {
              rpass = data;
            });
          },
        ),
      ],
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
    if (Keys.formKeyComanyEmployeeRegister.currentState.validate()) {
      Keys.formKeyComanyEmployeeRegister.currentState.save();
      if (password == rpass) {
        showLoaderDialog(context);
        if (userTypesEnum == 2) {
          print(1);
          EmployeeRegisterRequestModel employeeRegisterRequestModel =
              EmployeeRegisterRequestModel();
          Provider.of<CompanyEmployeeRegisterViewModel>(context, listen: false)
              .employeeRegister(employeeRegisterRequestModel, context);
        } else {
          print(2);
          CompanyRegisterRequestModel companyRegisterRequestModel =
              CompanyRegisterRequestModel(
                  addressDetails: buildingAddress,
                  email: email,
                  name: companyName,
                  password: password,
                  phoneNumber: phone,
                  location: location.Location(
                      address: addressController.text,
                      city: city,
                      country: country,
                      details: addressController.text,
                      latitude: lat,
                      longitude: lng,
                      postCode: zip));
          Provider.of<CompanyEmployeeRegisterViewModel>(context, listen: false)
              .companyRegister(companyRegisterRequestModel, context);
        }
      } else {
        MakeSnackBar.showInSnackBar('password_dont_match', Colors.red,
            Keys.scaffoldKeyCompanyEmployeeRegister);
      }
    } else {}
  }
}
