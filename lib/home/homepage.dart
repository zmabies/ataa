import 'package:ataa/components/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 6,
          flexibleSpace: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.lilac, AppColors.dustyBlue])),
           child: Image.asset("resources/images/grid.png", fit: BoxFit.cover,),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.location_on), text: "Local"),
              Tab(icon: Icon(Icons.public), text: "Global"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabPage(),
            _buildTabPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabPage() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20),
        CampaignCard(),
        SizedBox(height: 20),
        CampaignCard(),
        SizedBox(height: 20),
        CampaignCard(),
        SizedBox(height: 20),
        CampaignCard(),
        SizedBox(height: 20),
      ],
    );
  }
}

class CampaignCard extends StatefulWidget {
  final String title;
  final String img;
  final String desc;
  final String pfp;
  final String subtitle;

  const CampaignCard(
      {Key key, this.title, this.img, this.desc, this.pfp, this.subtitle})
      : super(key: key);

  @override
  _CampaignCardState createState() => _CampaignCardState();
}

class _CampaignCardState extends State<CampaignCard> {
  bool flag = false;
  bool colorFlag = false;
  IconData icon = Icons.keyboard_arrow_down;
  Color _iconColor = AppColors.dust;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstCurve: Curves.easeInOutCubic,
        firstChild: Container(height: 195, decoration: BoxDecoration(color: AppColors.lilac)),
        secondChild: Container(),
        crossFadeState: flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
      Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 6)
          ]),
          child: Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.lilac),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Lorem Ipsum Dolor..",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: Dimens.large, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Lorem Ipsum Dolor",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: Dimens.semiMid),
                    ),
                  ],
                ),
                SizedBox(width: 70),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Icon(
                      !flag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, color: AppColors.mute,),
                )
              ],
            ),
            SizedBox(height: 25),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore..", style: TextStyle(color: AppColors.mineshaft),),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.share, size: 20, color: AppColors.dust),
                SizedBox(width: 20),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        colorFlag = !colorFlag;
                        _iconColor = colorFlag ? AppColors.lilac : AppColors.dust;
                      });
                    },
                    child: Icon(Icons.favorite,
                        size: 20, color: _iconColor)),
              ],)
          ]))
    ],);
  }
}
