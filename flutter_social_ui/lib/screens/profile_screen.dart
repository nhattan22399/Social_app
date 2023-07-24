// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_social/widgets/custom_drawer.dart';
import 'package:app_social/widgets/post_carousel.dart';
import 'package:app_social/widgets/profile_clipper.dart';
import 'package:flutter/material.dart';

import 'package:app_social/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({
    required this.user,
  }) ;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _youPostsPageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _youPostsPageController = PageController(initialPage: 0,viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(image: AssetImage(widget.user.backgroundImageUrl.toString()),
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                  ),
                ),
                Positioned(child: IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ) ,
                  top: 50.0,
                  left: 20.0,
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ]
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(widget.user.profileImageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(widget.user.name.toString(),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Column(
                    children: [
                      Text('Folowing',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                      ),
                      SizedBox(height: 2.0,),
                      Text(widget.user.following.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      Text('Folower',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                      ),
                      SizedBox(height: 2.0,),
                      Text(widget.user.followers.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
              ],
            ),
            PostCarousel(
              pageController: _youPostsPageController, 
              title: 'Your Posts', 
              posts: widget.user.posts??[],
              ),

              PostCarousel(
              pageController: _favoritesPageController, 
              title: 'Favorites', 
              posts: widget.user.favorites??[],
              ),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}