
import 'package:app_social/data/data.dart';
import 'package:app_social/widgets/custom_drawer.dart';
import 'package:app_social/widgets/following_users.dart';
import 'package:app_social/widgets/post_carousel.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          title:    
            Text('FRENZY',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 10.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 3.0,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 18.0
            ),
            tabs: [
              Tab(
                 text: 'Trending',
              ),
               Tab(
                 text: 'Lastest',
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            FollowingUsers(),
            PostCarousel(
              pageController: _pageController,
              title: 'Posts',
              posts: posts,
            ),
          ],
        ),
      ),
    );
  }
}