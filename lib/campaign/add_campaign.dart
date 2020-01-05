import 'package:ataa/components/common.dart';
import 'package:ataa/components/constants.dart';
import 'package:ataa/components/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class AddCampaign extends StatefulWidget {
  final String userId;

  const AddCampaign({Key key, this.userId}) : super(key: key);

  @override
  _AddCampaignState createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  List<dynamic> countries = [
    {
      "display": "jordan",
      "value": "jo",
    },
    {
      "display": "egypt",
      "value": "eg",
    },
    {
      "display": "saudi arabia",
      "value": "sa",
    },
    {
      "display": "united arab emirates",
      "value": "uae",
    },
    {
      "display": "lebanon",
      "value": "lb",
    },
    {
      "display": "tunisia",
      "value": "tu",
    },
  ];
  final _formKey = GlobalKey<FormState>();
  String _location;

  void _validateAndSave(){
    var form = _formKey.currentState;
    if (form.validate()){
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        _buildAppBar(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Form(
              key: _formKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(labelText: "Description"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(labelText: "Goal"),
                  ),
                  SizedBox(height: 30),
                  DropDownFormField(
                      value: _location,
                      onSaved: (value) {
                        setState(() {
                          _location = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _location = value;
                        });
                      },
                      titleText: "Location",
                      hintText: "choose a country",
                      dataSource: countries,
                      textField: 'display',
                      valueField: 'value'),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: BuildGradientButton(radius: 4, text: "Add new campaign", onPressed: (){},),
                  )
                ],
              ),
            ),
          ),
        ),
      ],)
    );
  }
  Container _buildAppBar() {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [AppColors.lilac, AppColors.dustyBlue])),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 20),
        child: Text("Add campaign",
            style: TextStyle(fontSize: Dimens.mid, color: AppColors.white)),
      ),
    );
  }
}
