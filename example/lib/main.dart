import 'package:flutter/material.dart';
import 'package:toastx/toastx.dart';
import 'line.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () =>
                    {Toastx.show(context, '顶部', location: ToastxLocation.TOP)},
                child: Text('顶部'),
              ),
              FlatButton(
                onPressed: () => {
                      Toastx.show(context, '中部',
                          location: ToastxLocation.CENTER)
                    },
                child: Text('中部'),
              )
            ],
          ),
          Line(),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                      Toastx.show(context, '底部2s',
                          duration: ToastxDuration.SHORT)
                    },
                child: Text('底部2s'),
              ),
              FlatButton(
                onPressed: () => {
                      Toastx.show(context, '底部5s',
                          duration: ToastxDuration.MIDDLE)
                    },
                child: Text('底部5s'),
              ),
              FlatButton(
                onPressed: () => {
                      Toastx.show(context, '底部10s',
                          duration: ToastxDuration.LONG)
                    },
                child: Text('底部10'),
              )
            ],
          ),
          Line(),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () =>
                    {Toastx.show(context, '红色背景', color: Colors.red)},
                child: Text('红色背景'),
              ),
              FlatButton(
                onPressed: () => {
                      Toastx.show(context, '字体', style: TextStyle(fontSize: 30))
                    },
                child: Text('大号字体'),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this._show(context),
        child: Icon(Icons.show_chart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 显示吐司
  void _show(BuildContext context) {
    Toastx.show(context, '测试');
  }
}
