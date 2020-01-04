import 'package:ataa/components/common.dart';
import 'package:ataa/components/constants.dart';
import 'package:ataa/components/linear_percent_indicator.dart';
import 'package:flutter/material.dart';

class CampaignDetails extends StatefulWidget {
  @override
  _CampaignDetailsState createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: _buildDonateSheet(context),
                ));
          },
          child: Container(
            height: 70,
            width: 70,
            child: Icon(Icons.attach_money, color: AppColors.white, size: 30),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: AppColors.shadow, offset: Offset(3, 3), blurRadius: 6)],
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [AppColors.lilac, AppColors.dustyBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
        ),
        body: Column(
          children: <Widget>[
            _buildAppBar(),
            _buildTopCard(context),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(height: 20),
                    DescriptionCard(
                      title: "Lorem Ipsum Dolor Sit Amet",
                      desc:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            _buildImageCard(),
                            SizedBox(width: 13),
                            _buildImageCard(),
                            SizedBox(width: 13),
                            _buildImageCard(),
                            SizedBox(width: 13),
                            _buildImageCard(),
                            SizedBox(width: 13),
                            _buildImageCard(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DescriptionCard(
                      title: "Lorem Ipsum Dolor Sit Amet",
                      desc:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildDonateSheet(BuildContext context) {
    return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Donate", style: TextStyle(fontSize: Dimens.header1)),
                    Text("Type the amount you wish to donate", style: TextStyle(color: AppColors.mineshaft),),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 45,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                            hintText: r"+1$",
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(color: AppColors.dust, fontSize: Dimens.header1),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: AppColors.dustyBlue)),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: AppColors.dust),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: AppColors.dust),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(width: 122, height: 45,child: BuildGradientButton(text: "DONATE", onPressed: (){}, radius: 4,)),
                    ]),
                    SizedBox(height: 20),
                    Align(alignment: Alignment.center,child: Text("ataa ensures a secure donation", style: TextStyle(color: AppColors.dust, fontStyle: FontStyle.italic),)),
                  ],
                );
  }

  Container _buildImageCard() {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(color: AppColors.lilac, boxShadow: [
        BoxShadow(color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 6)
      ]),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 6)
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 145, right: 145, top: 25),
              child: Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.lilac)),
            ),
            SizedBox(height: 5),
            Text("Lorem Ipsum",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: Dimens.mid)),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Text("52%",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: Dimens.mid)),
                  SizedBox(width: 5),
                  Text("of the donation goal has been reached",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: Dimens.semiMid,
                          color: AppColors.mineshaft)),
                ],
              ),
            ),
            LinearPercentIndicator(
              fillColor: AppColors.dust,
              linearGradient: LinearGradient(
                  colors: [AppColors.lilac, AppColors.dustyBlue]),
              lineHeight: 10,
              width: MediaQuery.of(context).size.width,
              percent: 0.52,
              alignment: MainAxisAlignment.start,
              linearStrokeCap: LinearStrokeCap.butt,
              padding: EdgeInsets.all(0),
              animation: true,
            )
          ],
        ),
      ),
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
        child: Text("Campaign details",
            style: TextStyle(fontSize: Dimens.mid, color: AppColors.white)),
      ),
    );
  }
}

class DescriptionCard extends StatefulWidget {
  final String title;
  final String desc;

  const DescriptionCard({Key key, @required this.title, @required this.desc})
      : super(key: key);

  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  String firstHalf, secondHalf;
  bool flag = true;
  IconData icon = Icons.keyboard_arrow_down;

  @override
  void initState() {
    if (widget.desc.length > 500) {
      firstHalf = widget.desc.substring(0, 500);
      secondHalf = widget.desc.substring(500, widget.desc.length);
    } else {
      firstHalf = widget.desc;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 6)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            textAlign: TextAlign.start,
            style:
                TextStyle(fontSize: Dimens.large, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15),
          secondHalf.isEmpty
              ? Text(firstHalf)
              : Column(
                  children: <Widget>[
                    Text(
                      flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                      style: TextStyle(color: AppColors.mineshaft),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(icon, color: AppColors.mineshaft),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          flag = !flag;
                          icon = flag
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
        ],
      ),
    );
  }
}
