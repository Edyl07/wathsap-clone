
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Country _seletedFilterDialogCountry = CountryPickerUtils.getCountryByPhoneCode("222");
  String _countryCode = "+222";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(fontSize: 18, color: greenColor, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(height: 60,),
            Text("WhatsApp Clone will send and SMS Message (carrer change my appli) to verify your phone number. Entry your country codeand phone number:",
                style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30,),
            ListTile(
              onTap: _openFilteredCountryPickerDialog,
              title: _buildDialogItem(_seletedFilterDialogCountry),
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.50, color: greenColor,))
                  ),
                  width: 80,
                  height: 42,
                  alignment: Alignment.center,
                  child: Text("${_seletedFilterDialogCountry.phoneCode}"),
                ),
                SizedBox(width: 8.0,),
                Expanded(
                  child: Container(
                    height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                        ),
                      )
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: (){},
                  child: Text("Next", style: TextStyle(fontSize: 18, color: Colors.white),),

                ),
                ))
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(context: context, builder: (_) => Theme(
      data: Theme.of(context).copyWith(primaryColor: primaryColor, ),
      child: CountryPickerDialog(
        titlePadding: EdgeInsets.all(8.0),
        searchCursorColor: Colors.black,
        searchInputDecoration: InputDecoration(
          hintText: "Search",
        ),
        isSearchable: true,
        title: Text("Select your phone code"),
        onValuePicked: (Country country){
          setState(() {
            _seletedFilterDialogCountry = country;
            _countryCode = country.phoneCode;
          });
        },
        itemBuilder: _buildDialogItem,
      ),
    ));
  }

 Widget _buildDialogItem(Country country){
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: greenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(height: 8.0,),
          Text("+${country.phoneCode}"),
          SizedBox(height: 8.0,),
          Text("${country.name}"),
          Spacer(),
          Icon((Icons.arrow_drop_down))
        ],
      ),
    );
  }
}
