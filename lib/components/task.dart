import 'package:flutter/material.dart';
import 'package:my_personal_challenges/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String img;
  final int dificuldade;
  Task(this.nome, this.img, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var cor = Colors.blue;

  bool assetOrNetwork(){
    if(widget.img.contains("http")){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),

                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork() ? Image.asset(widget.img,
                            fit: BoxFit.fill)
                       : Image.network(
                            widget.img,
                            fit: BoxFit.fill),
                        )
                      ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 180,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis
                                ),
                              )),
                          Difficulty(difficultyLevel: widget.dificuldade),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 52,
                      width: 70,
                      child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue), foregroundColor: WidgetStateProperty.all(Colors.white) ),
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                            //print(nivel);
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('UP', style: TextStyle(fontSize: 12),)
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          backgroundColor: Colors.white30,
                          color: Colors.white,
                          value: (widget.dificuldade > 0) ? (widget.nivel/widget.dificuldade)/10 : 1
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(12),
                    child:
                    Text("Nível: $widget.nivel", style: const TextStyle(color: Colors.white)),

                  )
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}