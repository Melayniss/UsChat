/*
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';//add this new line；step2

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'This is whole title',
      theme: new ThemeData.dark(),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}//step3

class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestion = <WordPair>[];
  //List类型的suggestion变量，初始化为空列表，其中的内容为单词对；step4

  final Set<WordPair> _saved = new Set<WordPair>();
  //Set 中不允许重复的值，故适用于创建收藏集合；step5

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  //TextStyle类型的biggerFont变量，初始化为静态的TextStyle变量，其中的fontSize属性值为18.0；step4
  //在 Dart 语言中，使用下划线为前缀标识的变量或函数，会强制其变为所在类的私有变量或函数；step4

  @override
  Widget build(BuildContext context){
    //RandomWordsState=>更新RandomWords=>更新MyApp中的child中的RandomWords()=>更新生成方式
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Get a new name'),
        //导航栏显示文字，默认居中；

        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
        //添加一个actions，其中包含一个icon，以及点击icon触发的页面跳转；step 7

      ),
      body: _buildSuggestions(),
    );
  }
  //使用_buildSuggestions方法生成text；step4

  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i){
          //BuildContext类型的context私有变量以及int型的i变量；step4
          //在每一列之前，添加一个1像素高的分隔线widget；step4
          if(i.isOdd){
            return new Divider();
            //新的方法前一定要用new声明；step4
            //偶数行时，单词对将被添加一个 ListTile row；step4
          }
          final int index = i ~/ 2;//即 (int)(i/2)；step4

          if(index >= _suggestion.length){
            //如果滑到了最底部，此时分割线的索引大于等于了suggestion List中的单词对数目，则继续生成单词对；step4
            _suggestion.addAll(generateWordPairs().take(10));
            //'.addAll()'函数表示向suggestion表中添加元素；step4
            //'generateWordPairs()'函数表示创建单词对；step4
            //'take(int i)'函数表示创建个数；step4
          }
          return _buildRow(_suggestion[index]);
          //将每个单词对都经过buildRow的处理后再输出；step4
        }
    );
  }

  Widget _buildRow(WordPair wordPair){
    final bool alreadySaved = _saved.contains(wordPair);
    //新建一个bool型值，检查收藏的列表中是否已经包含了某单词对；step5

    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        //生成的单词对要进行大驼峰式命名法美化；step4
        style: _biggerFont,
        //style属性的值设为之前声明的biggerFont变量改变字号大小；step4
      ),
      trailing: Icon(
        alreadySaved ? Icons.star : Icons.star_border,
        //if语句三段式，按照bool类型值来判断是否改变icon绘图；step5
        color: alreadySaved ? Colors.yellow : null,
        //if语句三段式，按照bool类型值来判断是否改变颜色；step5
      ),
      onTap: (){
        //增加一个onTap方法，在方法中调用setState() + if判断 来改变交互状态；step6
        setState(() {
          if(alreadySaved){
            _saved.remove(wordPair);
          }
          else{
            _saved.add(wordPair);
          }
          //setState()中用if语句来判断用户行为，从而改变_saved List中的值
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      //表示添加在导航栏部分添加 Navigator.push 调用，实现路由入栈（以后路由入栈均指推入到导航管理器的栈）；step7
      new MaterialPageRoute<void>(
        builder: (BuildContext context){
          //在push调用中新建MaterialPageRoute 及其 builder（构造器）；
          final Iterable<ListTile> tiles = _saved.map(
                  (WordPair pair){
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              }
          );
          //生成 ListTile 行；step7

          final List<Widget> divided = ListTile.divideTiles(
            //ListTile 的 divideTiles() 方法，使得每个 ListTile 之间有 1 像素的分割线；step7
            // divided 变量持有最终的列表项，并通过 toList()方法非常方便的转换成列表显示；step7
            context: context,
            tiles: tiles,
            //新建的tiles在此；step7
          ).toList(); //直接转换成List；step7

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestion'),
              //名为"Saved Suggestions"的新路由的应用栏;step7

            ),
            body: new ListView(
              children: divided,
              //body 中的children为divided，divided 包含 ListTiles 行的 ListView 和每行之间的分隔线；step7
            ),
          );
          //builder 返回一个 Scaffold；step7
        },
      ),
    );//Navigator（导航器）会在应用栏中自动添加一个"返回"按钮；step7
    //无需调用Navigator.pop，点击后退按钮就会返回到主页路由；step7
  }
//在类中直接添加方法
}//step3
*/

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Let Us Chat',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new PageCount(),
    );
  }
}

class PageCount extends StatefulWidget{
  @override
  PageOne createState() => new PageOne();
  //PageTwo createState() => new PageTwo();
  //PageThree createState() => new PageThree();
  //PageFour createState() => new PageFour();
}

class PageOne extends State<PageCount>{
  final List<WordPair> _friends = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final TextStyle _onSearchFont = const TextStyle(fontSize: 18.0,color: Colors.grey);
  //final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _controller = new TextEditingController();
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('UsChat(2)',textAlign: TextAlign.left),
        //导航栏显示文字，设置靠左；

        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.search),
            iconSize: 16,
            onPressed: _onSearch,
            alignment: Alignment.centerRight
          ),
          new PopupMenuButton(
            icon: new Icon(Icons.add_circle,size: 16),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                new PopupMenuItem(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.chat),
                      new Text('New Chat')
                    ],
                  ),
                ),
                new PopupMenuItem(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.contacts),
                      new Text('Add Contacts')
                    ],
                  ),
                ),
                new PopupMenuItem(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.scanner),
                      new Text('Scan')
                    ],
                  ),
                ),
                new PopupMenuItem(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.payment),
                      new Text('Money')
                    ],
                  ),
                ),
                new PopupMenuItem(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(Icons.mail),
                      new Text('Support'),
                    ],
                  ),
                )
              ]
          )
        ],
      ),
      body: _buildFriends(),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble_outline,color: Colors.black,),
            activeIcon: new Icon(Icons.chat_bubble,color: Colors.green),
            title: new Text('Chats'),
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.contacts,color: Colors.black),
              activeIcon: new Icon(Icons.contacts,color: Colors.green,),
              title: new Text('Contacts')
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.star_border,color: Colors.black),
              activeIcon: new Icon(Icons.star,color: Colors.green),
              title: new Text('Discover')
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.bookmark_border,color: Colors.black),
              activeIcon: new Icon(Icons.bookmark,color: Colors.green),
              title: new Text('Me')
          )
        ],
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          fixedColor: Colors.green,
      ),
    );
  }

  Widget _buildFriends(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i){
          //BuildContext类型的context私有变量以及int型的i变量；step4
          //在每一列之前，添加一个1像素高的分隔线widget；step4
          if(i.isOdd){
            return new Divider();
            //新的方法前一定要用new声明；step4
            //偶数行时，单词对将被添加一个 ListTile row；step4
          }
          final int index = i ~/ 2;//即 (int)(i/2)；step4

          if(index >= _friends.length){
            //如果滑到了最底部，此时分割线的索引大于等于了Friends List中的单词对数目，则继续生成单词对；step4
            new Text('No more to show');
          }
          return _buildRow(_friends[index]);
          //将每个单词对都经过buildRow的处理后再输出；step4
        }
    );
  }

  Widget _buildRow(WordPair friendsName){
    return new ListTile(
      leading: Icon(
        Icons.picture_in_picture,
      ),
      title: new Text(
        friendsName.asPascalCase,
        //生成的单词对要进行大驼峰式命名法美化；step4
        style: _biggerFont,
        //style属性的值设为之前声明的biggerFont变量改变字号大小；step4
      ),
      subtitle: new Text('Your friend $friendsName send you a message'),
      //onTap: _onTap,
      //onLongPress: _onLongPress,
    );
  }

  void _onSearch(){
    Navigator.of(context).push(
      //表示添加在导航栏部分添加 Navigator.push 调用，实现路由入栈（以后路由入栈均指推入到导航管理器的栈）；step7
      new MaterialPageRoute<void>(
        builder: (BuildContext context){
          //在push调用中新建MaterialPageRoute 及其 builder（构造器）；
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'Search...',
                textAlign: TextAlign.left,
                style: _onSearchFont,
              ),
            ),
            //body:
            bottomNavigationBar: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.text,
                  controller: _controller,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(  //添加边框
                      gapPadding: 10.0,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Search...',
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.send),
                      //onPressed: _handleSubmitted(_controller.text),
                    ),
                    contentPadding: const EdgeInsets.all(15.0)
                  ),
                  //onSubmitted: ,
                  textInputAction: TextInputAction.done,
                ),

                /*new RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        content: new Text(_controller.text),
                      ),
                    );
                  },
                  child: new Text(
                    'Search',
                    textAlign: TextAlign.right,
                  ),
                ),*/

              ],
            ),
          );
          //builder 返回一个 Scaffold；step7
        },
      ),
    );
  }

  /*void _handleSubmitted(String text) {
    _controller.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState((){
      _messages.insert(0, message);
    });
  }*/

}
