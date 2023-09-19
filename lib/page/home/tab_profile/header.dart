import 'package:flutter/material.dart';

var loginRegisterStyle = TextStyle(fontSize: 20, color: Colors.white);

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('login');
                      },
                      child: Text(
                        'login',
                        style: loginRegisterStyle,
                      ),
                    ),
                    Text('/'),
                    GestureDetector(
                        child: Text(
                          'register',
                          style: loginRegisterStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('register');
                        }),
                  ],
                ),
              ),
              Text(
                'login to get more service',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget _loginBuilder(BuildContext context) {
    String userName = 'login username';
    String userImage =
        'https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg';
    ;
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(color: Colors.green),
      height: 95,
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(backgroundImage: NetworkImage(userImage)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
              ),
              Text(
                userName,
                style: loginRegisterStyle,
              ),
              Text(
                'check or update detail',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    // TODO: implement build
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
