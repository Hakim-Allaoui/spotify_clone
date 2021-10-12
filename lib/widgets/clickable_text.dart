import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/ads_helper.dart';

class ClickableText extends StatefulWidget {
  final String text;
  final String title;
  final TextStyle textStyle;

  const ClickableText({Key key, this.text, this.title, this.textStyle})
      : super(key: key);

  @override
  _ClickableTextState createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  TextEditingController textEditingController = new TextEditingController(text: '');
  String text = '';

  AdsHelper ads;

  @override
  void initState() {
    super.initState();
    ads = new AdsHelper();
    text = widget.text ?? '•••';
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            titlePadding: EdgeInsets.all(0.0),
            title: ads.getAdmobBanner(AdmobBannerSize.BANNER),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.title, style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Proxima Nova Bold',
                  ),),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: text.isNotEmpty ? text : '•••',
                      contentPadding: EdgeInsets.all(16.0),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  ads.showAdmobInter();
                  Navigator.of(context).pop(text.isNotEmpty ? text : '•••');
                },
              ),
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  ads.showAdmobInter();
                  Navigator.of(context).pop(textEditingController.text.isNotEmpty ? textEditingController.text : '•••');
                },
              )
            ],
          ),
        ).then((value) {
          setState(() {
            text = value;
          });
        });
      },
      child: Text(
        text != null ? text.isNotEmpty ? text : '•••' : '•••',
        textAlign: TextAlign.center,
        style: widget.textStyle,
      ),
    );
  }
}
