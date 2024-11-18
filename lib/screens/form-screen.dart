
import 'package:flutter/material.dart';
import 'package:my_personal_challenges/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({required this.taskContext, super.key});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController dificultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value){
    if(value != null && value.isEmpty){
      if(int.parse(value) > 5 || int.parse(value) < 1){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 580,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if(valueValidator(value)){
                          return "Insira o nome da tarefa";
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if (difficultyValidator(value)){
                          return "Insira um valor entre 1 e 5";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: dificultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Dificuldade",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text){
                        setState(() {

                        });
                      },
                      validator: (value){
                        if(valueValidator(value)){
                          return "Insira uma URL de imagem";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Imagem",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                imageController.text,
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                  return Image.asset("assets/images/no-image.png");
                                },
                                fit: BoxFit.cover))

                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          // print(nameController.text);
                          // print(int.parse(dificultyController.text));
                          // print(imageController.text);
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(dificultyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Tarefa salva"),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Adicionar"),
                    ),
                  ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
