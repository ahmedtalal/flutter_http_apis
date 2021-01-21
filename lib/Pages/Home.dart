import 'package:flultter_apis/ApiBuilder/HttpHelper.dart';
import 'package:flultter_apis/Models/PostModel.dart';
import 'package:flultter_apis/Pages/PostDetails.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String ID = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpHelper _helper;

  Future<List<PostModel>> _posts;

  @override
  void initState() {
    super.initState();
    _helper = HttpHelper.getInstance();
    _posts = _helper.getDataFromApi("https://jsonplaceholder.typicode.com/posts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Apis"),
      ),
      body: Center(
          child: FutureBuilder<List<PostModel>>(
            future: _posts,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                List<PostModel> post = snapshot.data ;
                return ListView(
                  children: post.map((item){
                    return Card(
                      elevation: 2.0 ,
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item.Title),
                        subtitle: Text(item.Body),
                        trailing: Text(item.Id.toString()),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (contex) => PostDetails(item)));
                        },
                      ),
                    );
                  }).toList(),
                );
              }else if(snapshot.hasError) {
                return Text("${snapshot.error}") ;
              }else {
                return CircularProgressIndicator();
              }
            },

          )
      ),
    );
  }
}
