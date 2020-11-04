import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiarchitecture/network/APIResponse.dart';

class GenericWidget extends StatefulWidget {
  Status status;
  Widget child;
  String errMsg;
  GenericWidget({this.status, this.child, this.errMsg});

  @override
  _GenericWidgetState createState() => _GenericWidgetState();
}

class _GenericWidgetState extends State<GenericWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case Status.COMPLETED:
        return widget.child;
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.ERROR:
        return Text("${widget.errMsg}");
      default:
        return Text("${widget.errMsg}");
    }
    return Container();
  }
}
