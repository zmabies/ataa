import 'package:ataa/components/constants.dart';
import 'package:ataa/util/navigation_util.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return _buildPageContent();
  }

  Widget _buildPageContent() {
    return Scaffold(
      floatingActionButton: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          NavigationUtil().goToAddCampaign(context, userId: "1234");
        },
        child: Container(
          height: 70,
          width: 70,
          child: Icon(Icons.add, color: AppColors.white, size: 30),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(3, 3),
                    blurRadius: 6)
              ],
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [AppColors.lilac, AppColors.dustyBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildTopCard(name: "Lorem Ipsum", verified: true),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    NavigationUtil()
                        .goToCampaignsList(context, title: "My campaigns");
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 6,
                              offset: Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("My campaigns",
                            style: TextStyle(
                                fontSize: Dimens.large,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mineshaft)),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.dust,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildPaymentCard(
                  imageUrl:
                      "https://logos-download.com/wp-content/uploads/2016/03/PayPal_logo_logotype_emblem.png",
                  info: "email@domain.com",
                  date: "Added mm-dd-yy"),
              SizedBox(height: 20),
              _buildPaymentCard(
                  imageUrl:
                      "https://logos-download.com/wp-content/uploads/2016/02/Visa_logo.png",
                  info: "**** **** **** 2345",
                  date: "expires on mm/yy"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopCard({String name, bool verified}) {
    return Container(
      constraints: BoxConstraints.expand(width: double.infinity, height: 270),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.lilac, AppColors.dustyBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.menu, color: AppColors.white, size: 30),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white)),
              verified
                  ? Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                      child: Icon(Icons.check, color: AppColors.white))
                  : Container(),
            ],
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.large,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({String imageUrl, String info, String date}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.5),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadow, blurRadius: 6, offset: Offset(0, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 25,
                    child: Image.network(imageUrl, fit: BoxFit.fitHeight)),
                Icon(Icons.more_vert, color: AppColors.dust),
              ],
            ),
            SizedBox(height: 40),
            Text(info, style: TextStyle(color: AppColors.mineshaft)),
            SizedBox(height: 40),
            Text(date,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: AppColors.dust)),
          ],
        ),
      ),
    );
  }
}
