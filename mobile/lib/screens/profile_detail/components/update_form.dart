import 'package:flutter/material.dart';
import 'package:online_shop_app/components/custom_surfix_icon.dart';
import 'package:online_shop_app/components/default_button.dart';
import 'package:online_shop_app/components/form_error.dart';
import 'package:online_shop_app/models/UserUpdate.dart';
// import 'package:online_shop_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class UpdateForm extends StatefulWidget {
  final UserUpdate currentUserUpdate;
  const UpdateForm({Key? key, required this.currentUserUpdate})
      : super(key: key);
  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  final List<String?> errors = [];
  String? phoneNumber;
  String? fullname;
  String? email;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildFullNameFormField("${widget.currentUserUpdate.fullName}"),
            SizedBox(height: getProportionateScreenHeight(12)),
            buildEmailFormField("${widget.currentUserUpdate.email}"),
            SizedBox(height: getProportionateScreenHeight(12)),
            buildPhoneNumberFormField(
                "${widget.currentUserUpdate.phoneNumber}"),
            SizedBox(height: getProportionateScreenHeight(12)),
            buildAddressFormField("${widget.currentUserUpdate.address}"),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Cập nhật",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField(String Email) {
    return TextFormField(
      initialValue: "$Email",
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Nhập email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField(String Fullname) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      initialValue: "${Fullname}",
      style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Họ và tên",
        hintText: "Nhập họ và tên",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField(String Address) {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      initialValue: "${Address}",
      style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      decoration: InputDecoration(
        labelText: "Địa chỉ",
        hintText: "Nhập Địa chỉ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/pin.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(String PhoneNumber) {
    return TextFormField(
      initialValue: "${PhoneNumber}",
      keyboardType: TextInputType.phone,
      // onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     removeError(error: kEmailNullError);
      //   } else if (emailValidatorRegExp.hasMatch(value)) {
      //     removeError(error: kInvalidEmailError);
      //   }
      //   return null;
      // },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }
}
