import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Foe/view/login.dart';
import 'package:Foe/animation/FadeAnimation.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Column(children: <Widget>[
                                FadeAnimation(
                                    1,
                                    Text("Registrarse",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(height: 15),
                                FadeAnimation(
                                    1.2,
                                    Text("Crea una cuenta, es gratis",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[700]))),
                                SizedBox(height: 70)
                              ]),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      FadeAnimation(
                                          1.2,
                                          makeInput(
                                              label: "Correo electrónico")),
                                      FadeAnimation(
                                          1.3,
                                          makeInput(
                                              label: "Contraseña",
                                              obscureText: true)),
                                      FadeAnimation(
                                          1.4,
                                          makeInput(
                                              label: "Confirmar contraseña",
                                              obscureText: true))
                                    ],
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.5,
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Container(
                                      padding: EdgeInsets.only(top: 3, left: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: MaterialButton(
                                        minWidth: double.infinity,
                                        height: 60,
                                        onPressed: () {},
                                        color: Colors.green[300],
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text("Registrarse",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.white)),
                                      )))),
                          SizedBox(height: 30),
                          FadeAnimation(
                              1.6,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("¿Ya tienes una cuenta?"),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: Text(" Inicia sesión",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18)))
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      children: [
        Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  TextField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        hintText: label,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey[400])),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey[400]))),
                  ),
                  SizedBox(height: 30),
                ]),
          ],
        ),
      ],
    );
  }
}
