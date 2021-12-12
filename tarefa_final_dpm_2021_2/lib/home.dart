import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    TextEditingController nota1Controller = TextEditingController();
    TextEditingController nota2Controller = TextEditingController();
    TextEditingController nota3Controller = TextEditingController();
    TextEditingController mediaController = TextEditingController();
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String _infoText = "Informe as notas!";
    double nota1 = 0.0;
    double nota2 = 0.0;
    double nota3 = 0.0;
    double media = 0.0;/* 
    String nome = nomeController.text;
    String email = emailController.text; */

    void _calculaMedia(){
      setState((){
        double nota1 = double.parse(nota1Controller.text);
        double nota2 = double.parse(nota2Controller.text);
        double nota3 = double.parse(nota3Controller.text);
        double media = (nota1 + nota2 + nota3) / 3;
        mediaController.text = media.toString();
      });
    }
    

    void _limpaCampos(){
      nota1Controller.text = "";
      nota2Controller.text = "";
      nota3Controller.text = "";
      nomeController.text = "";
      emailController.text = "";
      mediaController.text = "";

      setState(() {
        _infoText = "Informe seus dados!";
        _formKey = GlobalKey<FormState>();
      });    
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefa Final DPM 2021.2"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0 , 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Divider(),
                Text("CALCULADOR DE MÉDIA", style: 
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,), 
                  textAlign: TextAlign.left,
                ),
                Divider(),
                TextFormField(
                      controller: nomeController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NOME',
                        labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                ),
                ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Digite o nome do Aluno!";
                    }
                  }
                ),
                Divider(),
                TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                ),
                      ),
                      controller: emailController,
                        validator: (value){
                    if(value!.isEmpty){
                      return "Digite o e-mail do Aluno!";
                    }
                  }
                ),
                Divider(),
                  TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nota 1",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: nota1Controller,
              validator: (value){
                if(value!.isEmpty){
                  return "Digite a primeira nota!";
                }
              },
            ),
                  Divider(),
                  TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nota 2",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: nota2Controller,
              validator: (value){
                if(value!.isEmpty){
                  return "Digite a segunda nota!";
                }
              },
            ),
                  Divider(),
                  TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nota 3",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: nota3Controller,
              validator: (value){
                if(value!.isEmpty){
                  return "Digite a terceira nota!";
                }
              },
            ),
              Divider(),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _calculaMedia();
                }
              },
              child: Text("CALCULA MÉDIA")
              ),
              Text("Resultado:",
                style: TextStyle(fontSize: 18.0,), 
                  textAlign: TextAlign.left,),
              Text("Nome: " + nomeController.text ,
                style: TextStyle(fontSize: 18.0,), 
                  textAlign: TextAlign.left,),
              Text("E-mail: " + emailController.text,
                style: TextStyle(fontSize: 18.0,), 
                  textAlign: TextAlign.left,),
              Text("Notas: ${nota1Controller.text} - ${nota2Controller.text} - ${nota3Controller.text}",
                style: TextStyle(fontSize: 18.0,), 
                  textAlign: TextAlign.left,),
              Text("Média: " + mediaController.text,
                style: TextStyle(fontSize: 18.0,), 
                  textAlign: TextAlign.left,),
              Divider(),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _limpaCampos();
                }
              },
              child: Text("APAGA OS CAMPOS")
              ),


            ],
          ),
        ),
      ),
    );
  }
}