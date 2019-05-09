import 'package:flutter/material.dart';

class FooWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "This is text!",
      style: TextStyle(
          color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

//图片，Image
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://ss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=4227888689,1856408924&fm=202&mola=new&crop=v1",
      width: 200,
      height: 100,
    );
  }
}

//Button按钮
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton   pressed'),
      child: Text('BUTTON'),
    );
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton   pressed'),
      child: Text('BUTTON'),
    );
    return flatBtn;
  }
}

//输入框 Input，弹出框
class MessageForm extends StatefulWidget {
  @override
  State createState() {
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //    Row、Expand    都是用于布局的控件，这里可以先忽略它们
    return Row(
      children: <Widget>[
        //Expanded占满一行里除 RaisedButton 外的所有空间
        Expanded(
          child: TextField(
            controller: editController,
          ),
        ),
        RaisedButton(
          child: Text("click"),
          onPressed: () {
            print('text    inputted:    ${editController.text}');
            showDialog(
                context: context,
                builder: (_) {
                  return new AlertDialog(
                    content: Text(editController.text),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  );
                });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }
}

//Container、Padding 和 Center
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('text'),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 80.0,
      decoration: BoxDecoration(
        // 背景色
        color: Colors.grey, borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

//Row、Column
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      //  只有一个子元素的  widget，一般使用  child  参数来设置；Row  可以包含多个子控件，对应的则是  children。
      children: <Widget>[
        Text('text1'),
        Text('text2'),
        Text('text3'),
        Text('text4'),
      ],
    );
  }
}

//Expanded
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          //  占一行的  2/3
          flex: 2,
          child: RaisedButton(
            child: Text('btn1'),
          ),
        ),
        Expanded(
          //  占一行的  1/3
          flex: 1,
          child: RaisedButton(
            child: Text('btn2'),
          ),
        ),
      ],
    );
  }
}

//Stack 布局
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //  Aligment  的取值范围为  [-1,  1]，Stack  中心为  (0,  0)，
      //  这里设置为  (-0.5,  -0.5)  后，可以让文本对齐到  Container  的  1/4  处
      alignment: const Alignment(-0.5, -0.5),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        Text('foobar'),
      ],
    );
  }
}

//综合
class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    //  为了给  title  section  加上  padding，这里我们给内容套一个  Container
    return Container(
      //  设置上下左右的  padding  都是  32。类似的还有  EdgeInsets.only/symmetric  等
      padding: EdgeInsets.all(32.0),
      height: 200,
      color: Colors.amber,
      child: Row(
        children: <Widget>[
          //  这里为了让标题占满屏幕宽度的剩余空间，用  Expanded  把标题包了起来
          Expanded(
            //  再次提醒读者，Expanded  只能包含一个子元素，使用的参数名是  child。接下来，
            //  为了在竖直方向放两个标题，加入一个  Column。
            child: Column(
              //  Column  是竖直方向的，cross  为交叉的意思，也就是说，这里设置的是水平方向
              //  的对齐。在水平方向，我们让文本对齐到  start（读者可以修改为  end  看看效果）
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //  聪明的你，这个时候肯定知道为什么突然加入一个  Container  了。
                //  跟前面一样，只是为了设置一个  padding
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ), //  这里是  Row  的第二个子元素，下面这两个就没用太多值得说的东西了。
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(starCount.toString())
        ],
      ),
    );
  }
}
