import 'package:ataa/account/login_page.dart';
import 'package:ataa/account/signup_page.dart';
import 'package:ataa/campaign/add_campaign.dart';
import 'package:ataa/campaign/campaign_details.dart';
import 'package:ataa/campaign/saved_campaigns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationUtil{
  
  Future<Null> goToSigninScreen(BuildContext context) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
    return null;
  }

  Future<Null> goToSignupScreen(BuildContext context) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
    return null;
  }
  Future<Null> goToCampaignDetails(BuildContext context) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CampaignDetails()),
    );
    return null;
  }
  Future<Null> goToCampaignsList(BuildContext context, {String title = "Saved campaigns"}) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SavedCampaigns(title: title)),
    );
    return null;
  }

  Future<Null> goToAddCampaign(BuildContext context, {String userId = ""}) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCampaign(userId: userId)),
    );
    return null;
  }
}