import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class form extends StatefulWidget {
  @override
  _formUserState createState() => _formUserState();
}

class _formUserState extends State<form> {
  final formKey = new GlobalKey<FormState>();

  final _controlnu = TextEditingController();
  final _controlpw = TextEditingController();
  final _controlco = TextEditingController();

  String _user;
  String _password;
  String _email;

  String uname = '';
  String pws = '';
  String mail = '';

  String saveuname = '';
  String savemail = '';

  @override
  Widget build(BuildContext context) {
    setState(() {
      GetPreferences();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text('Register Form',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Container(width: 100, height: 30),
            ),
          ),
          new Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new NetworkImage(
                        "https://images.vexels.com/media/users/3/135118/isolated/preview/676bf0e9f3c16649cd7f426c6dcd755a-signo-de-usuario-plana-con-fondo-redondo-by-vexels.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: TextFormField(
                              validator: (valor) =>
                                  valor.isEmpty ? "Field can't be empty" : null,
                              controller: _controlnu,
                              onSaved: (valor) => _user = valor,
                              decoration: InputDecoration(
                                hintText: 'UserName',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.pinkAccent,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  //No desaparece el borde
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                  ),
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: TextFormField(
                              controller: _controlco,
                              validator: (valor) => valor.contains("@") == false
                                  ? "Not a valid E-mail"
                                  : null,
                              onSaved: (valor) => _email = valor,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.pinkAccent,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                  ),
                                  child: Icon(Icons.mail),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: TextFormField(
                              controller: _controlpw,
                              validator: (valor) =>
                                  valor.isEmpty ? "Field can't be empty" : null,
                              onSaved: (valor) => _password = valor,
                              obscureText: true,
                              //Ocultar contraseña
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.pinkAccent,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                  ),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 60,
                          child: RaisedButton(
                            onPressed: () {
                              final form = formKey.currentState;
                              if (form.validate()) {
                                setState(() {
                                  uname = _controlnu.text;
                                  mail = _controlco.text;
                                  SavePreferences();
                                });
                                pushPage();
                              }
                            },
                            color: Colors.pinkAccent,
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //Data Screen
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future _checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('_session')) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'User data:', //Datos Usuario
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Name:" '$saveuname'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("E-Mail:" '$savemail'),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Logout'),
                            content: Text('Are you sure?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.of(context).pop('Yes');
                                },
                              ),
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop('No');
                                },
                              )
                            ],
                          ),
                        ).then((result) {
                          if (result == 'Yes') {
                            _logout();
                          }
                        });
                      },
                      color: Colors.pinkAccent,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }));
    }
  }

  void pushPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('_session', true);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                //Data Screen
                'User data:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(uname),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(mail),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 60,
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.of(context).pop('Yes');
                              },
                            ),
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop('No');
                              },
                            )
                          ],
                        ),
                      ).then((request) {
                        if (request == 'Yes') {
                          _logout();
                        }
                      });
                    },
                    color: Colors.pinkAccent,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }

  Future<void> SavePreferences() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    data.setString('UserName', _controlnu.text);
    data.setString('E-mail', _controlco.text);
  }

  Future<void> GetPreferences() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      saveuname = data.get('UserName') ?? uname;
      savemail = data.get('E-mail') ?? mail;
    });
  }

  Future<void> _logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('_session', false);
    setState(() {
      saveuname = '';
      savemail = '';
    });
    Navigator.pop(context);
  }
}
