import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userTODO = '';
  List todoList = [];

  void initFirebase() async{//async -  метод работает ассинхронно
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();//подключение к базе данных
  }

  @override
  void initState() {
    super.initState();

    initFirebase();

    todoList.addAll(
        ['Первое блюдо', 'Второе блодо', 'Десерт', 'Закуски', 'Напитки']);
  }

    void menuOpen(){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext){//выезжающее меню
          return Scaffold(
            appBar: AppBar(title: Text('Меню'),),
            body: Column(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context,'/', (route) => false);
                },
                    child:
                    Text('На главную')),
                Padding(padding: EdgeInsets.only(bottom: 20),),
                Text('Остальные разделы находятся в разработке'),
              ],
            )
          );
        })
      );
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
          appBar: AppBar(
          title: const Text('JustChoose'),
          centerTitle: true,
          actions: [
            IconButton(
               icon: Icon(Icons.fastfood_outlined),
                onPressed: menuOpen)

          ],
        ),
        body: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(todoList[index]),
                  child: Card(
                    child: ListTile(
                      title: Text(todoList[index]),
                    trailing: IconButton(
                        icon: Icon(
                        Icons.delete,
                      color: Colors.blueGrey
                    ),
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                    ),
                    ),
              ),
                  onDismissed: (direction){
                      setState(() {
                      todoList.removeAt(index);
                    });
                  },
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
        onPressed: (){
            showDialog(context: context, builder: (BuildContext context){//диалоговое окно
              return AlertDialog(
                title: Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value){
                    _userTODO = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: (){
                   //добавление в базу данных:
                    FirebaseFirestore.instance.collection('items').add({'item':_userTODO});
                    Navigator.of(context).pop();
                  }, child:  Text('Добавить'))
                ],
              );
            });
        },
        child: Icon(
            Icons.add_to_photos_sharp,
          color: Colors.white
        )
        ,
    ),
    );
  }
}

