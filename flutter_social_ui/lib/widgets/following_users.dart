import 'package:app_social/data/data.dart';
import 'package:app_social/models/user_model.dart';
import 'package:flutter/material.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: Text(
                    'Folowing',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index){
                      User user = users[index];
                      return GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(user.profileImageUrl.toString()),
                              fit: BoxFit.cover,
                              height: 60.0,
                              width: 60.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
  }
}