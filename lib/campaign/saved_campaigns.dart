import 'package:ataa/components/constants.dart';
import 'package:ataa/util/navigation_util.dart';
import 'package:flutter/material.dart';

class SavedCampaigns extends StatefulWidget {
  @override
  _SavedCampaignsState createState() => _SavedCampaignsState();
}

class _SavedCampaignsState extends State<SavedCampaigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildAppBar(),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                ],
              ),
            ),
          ),
        ],
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
        child: Text("Saved campaigns",
            style: TextStyle(fontSize: Dimens.mid, color: AppColors.white)),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool flag = false;
  Color _iconColor = AppColors.dust;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        NavigationUtil().goToCampaignDetails(context);
      },
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: AppColors.white,
            border:
                Border(bottom: BorderSide(color: AppColors.shadow, width: 1))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 20),
            Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.lilac),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lorem Ipsum..",
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
            Icon(Icons.share, size: 20, color: AppColors.dust),
            SizedBox(width: 20),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    flag = !flag;
                    _iconColor = flag ? AppColors.lilac : AppColors.dust;
                  });
                },
                child: Icon(Icons.favorite,
                    size: 20, color: _iconColor)),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
