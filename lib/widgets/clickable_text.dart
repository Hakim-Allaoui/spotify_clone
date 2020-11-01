import 'package:flutter/material.dart';

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
  TextEditingController textEditingController = new TextEditingController();
  String text = '';

  @override
  void initState() {
    super.initState();
    text = widget.text;
    textEditingController.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
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
                    hintText: text,
                    contentPadding: EdgeInsets.all(16.0),
                    fillColor: Colors.grey,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(text);
                },
              ),
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop(textEditingController.text);
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
        text,
        style: widget.textStyle,
      ),
    );
  }
}
