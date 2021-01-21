import 'package:flultter_apis/Models/PostModel.dart';
import 'package:flutter/material.dart';
class PostDetails extends StatefulWidget {
  PostModel post ;
  PostDetails(this.post) ;

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String _title , _body ;
  int _id ;
  @override
  void initState() {
    super.initState();
    _title = widget.post.Title;
    _body = widget.post.Body ;
    _id = widget.post.Id ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: Card(
        elevation: 2.0,
        margin: EdgeInsets.only(top: 50,left: 10,right: 10,bottom: 15),
        child: ListTile(
          title: Text(_title),
          subtitle: Text(_body),
          trailing: Text(_id.toString()),
        ),
      ),
    );
  }
}
