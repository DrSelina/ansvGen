// ignore_for_file: non_constant_identifier_names

//APACHE 2.0
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:randendgenerator/assets/asset_ph.dart';
import 'package:randendgenerator/custom_widgets/customChoiceItem.dart';
import 'package:randendgenerator/custom_widgets/customInDialogButton.dart';
import 'package:talker_flutter/talker_flutter.dart';

class HomePg extends StatefulWidget {
  const HomePg({
    super.key,
    required this.box,
  });
  final Box<dynamic> box;
  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  final talker = TalkerFlutter.init();
  void generate() {
    int generateIndexOne = Random().nextInt((f.length));
    int generateIndexTwo = Random().nextInt((s.length));
    setState(() {
      answer.text = "${first[generateIndexOne]} ${second[generateIndexTwo]}";
    });
  }

  void state1ch() {
    setState(() {
      if (value1_ishello == false) {
        value1_ishello = true;
      } else {
        value1_ishello = false;
      }
    });
  }

  void sayMyName() {
    if (value1_ishello == false) {
      setState(() {
        Hello = "${name.text},";
      });
    } else {
      setState(() {
        Hello = "${name.text}, здравствуйте.";
      });
    }
  }

  void state2ch() {
    setState(() {
      if (value2_iswaiting == false) {
        value2_iswaiting = true;
      } else {
        value2_iswaiting = false;
      }
    });
  }

  void waiting() {
    if (value2_iswaiting == true) {
      if (value1_ishello == true) {
        setState(() {
          wait = " Благодарю за ожидание. ";
        });
      } else {
        setState(() {
          wait = " благодарю за ожидание. ";
        });
      }
    } else {
      setState(() {
        wait = " ";
      });
    }
  }

  void hivePutAction() {
    widget.box.put("titles", liveTemplatesTitlesList);
    widget.box.put("contents", liveTemplatesList);
    widget.box.put("indexes", liveTemplatesIndexes);
  }

  void hiveGetAction() {
    final q = widget.box.get("titles");
    if (q != null) {
      setState(() {
        liveTemplatesTitlesList = q;
      });
    }
    final d = widget.box.get("contents");
    if (d != null) {
      setState(() {
        liveTemplatesList = d;
      });
    }
    final g = widget.box.get("indexes");
    if (g != null) {
      setState(() {
        liveTemplatesIndexes = g;
      });
    }

    talker.log(liveTemplatesTitlesList);
  }

  List<String> first = f;
  List<String> second = s;
  TextEditingController answer = TextEditingController();
  String GeneratedText = "";
  TextEditingController name = TextEditingController();
  String Hello = "";
  String wait = "";
  TextEditingController MainTheme = TextEditingController();
  TextEditingController templTitle = TextEditingController();
  TextEditingController templContent = TextEditingController();
  TextEditingController templAddContent = TextEditingController();
  TextEditingController templAddTitle = TextEditingController();
  bool value1_ishello = false;
  bool value2_iswaiting = false;
  List<String> liveTemplatesList = [];
  List<int> liveTemplatesIndexes = [];
  List<String> liveTemplatesTitlesList = [];
  // TextEditingController editTemp = TextEditingController();

  @override
  void initState() {
    hiveGetAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //hiveGetAction();
    return Scaffold(
      appBar: AppBar(
        title: const Text("ansvGen v1.0.0"),
        centerTitle: true,
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  child: Center(
                      child: Column(
                    children: [
                      //Here starts visible widgets tree ========================================
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        width: 600,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 40,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: SizedBox(
                                        height: 500,
                                        width: 360,
                                        child: Center(
                                          child: (liveTemplatesList != [])
                                              ? Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                          "Название шаблона"),
                                                      TextFormField(
                                                        controller:
                                                            templAddTitle,
                                                        decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30))),
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                      const Text("Содержимое"),
                                                      TextFormField(
                                                        controller:
                                                            templAddContent,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                        ),
                                                        minLines: 10,
                                                        maxLines: 10,
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height: 50,
                                                            width: 100,
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    liveTemplatesTitlesList.add(
                                                                        templAddTitle
                                                                            .text);
                                                                    liveTemplatesList.add(
                                                                        templAddContent
                                                                            .text);
                                                                    liveTemplatesIndexes.add(
                                                                        (liveTemplatesList.length) -
                                                                            1);
                                                                    templAddTitle
                                                                        .text = "";
                                                                    templAddContent
                                                                        .text = "";
                                                                    hivePutAction();
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                },
                                                                child: const Text(
                                                                    "Сохранить")),
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 100,
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    "Отменить")),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : const Text(
                                                  "Здесь будут ваши шаблоны",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                      child: SizedBox(
                                        height: 800,
                                        width: 400,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Center(
                                            child: ListView.builder(
                                              itemCount:
                                                  liveTemplatesIndexes.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Customindialogbutton(
                                                  editCallback: () {
                                                    setState(() {
                                                      templTitle.text =
                                                          liveTemplatesTitlesList[
                                                              liveTemplatesIndexes[
                                                                  index]];
                                                    });
                                                    setState(() {
                                                      templContent.text =
                                                          liveTemplatesList[
                                                              liveTemplatesIndexes[
                                                                  index]];
                                                    });
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          Dialog(
                                                        child: SizedBox(
                                                          height: 500,
                                                          width: 360,
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Column(
                                                                children: [
                                                                  const Text(
                                                                      "Название шаблона"),
                                                                  TextFormField(
                                                                    controller:
                                                                        templTitle,
                                                                    decoration:
                                                                        InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          30),
                                                                  const Text(
                                                                      "Содержимое"),
                                                                  TextFormField(
                                                                    controller:
                                                                        templContent,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                    minLines:
                                                                        10,
                                                                    maxLines:
                                                                        10,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 30,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            100,
                                                                        child: TextButton(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                liveTemplatesTitlesList.removeAt(liveTemplatesIndexes[index]);
                                                                                liveTemplatesTitlesList.insert(liveTemplatesIndexes[index], templTitle.text);
                                                                                liveTemplatesList.removeAt(liveTemplatesIndexes[index]);
                                                                                liveTemplatesList.insert(liveTemplatesIndexes[index], templContent.text);
                                                                                templTitle.text = "";
                                                                                templContent.text = "";
                                                                                hivePutAction();
                                                                                Navigator.pop(context);
                                                                              });
                                                                            },
                                                                            child: const Text("Сохранить изменения")),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            100,
                                                                        child: TextButton(
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text("Отменить")),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            100,
                                                                        child: TextButton(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                liveTemplatesTitlesList.removeAt(liveTemplatesIndexes[index]);
                                                                                liveTemplatesList.removeAt(liveTemplatesIndexes[index]);
                                                                                liveTemplatesIndexes.removeAt(index);
                                                                                hivePutAction();
                                                                              });
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text("Удалить")),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  callback: () {
                                                    setState(() {
                                                      MainTheme.text =
                                                          "${MainTheme.text} ${liveTemplatesList[liveTemplatesIndexes[index]]}";
                                                    });
                                                  },
                                                  text: liveTemplatesTitlesList[
                                                      liveTemplatesIndexes[
                                                          index]],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Шаблоны"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              const Text("Имя клиента"),
                              TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Условия"),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            //here the switches ==================================================
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    CustomChoiceItem(
                                      InnerItem: const Text("Приветствие?"),
                                      callback: () {
                                        state1ch();
                                        sayMyName();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    CustomChoiceItem(
                                      InnerItem: const Text("Ожидание?"),
                                      callback: () {
                                        state2ch();
                                        waiting();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Center(
                                child: Column(
                                  children: [],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: [
                            const Text("Основная мысль"),
                            TextFormField(
                              controller: MainTheme,
                              minLines: 10,
                              maxLines: 20,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          children: [
                            const Text("Заключение"),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              maxLines: 3,
                              minLines: 3,
                              controller: answer,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  answer.text = "";
                                });
                                generate();
                              },
                              child: const Text("Generate"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Column(
                          children: [
                            const Text("Ответ"),
                            TextFormField(
                              controller:
                                  TextEditingController(text: GeneratedText),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              minLines: 2,
                              maxLines: 50,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  sayMyName();
                                  waiting();
                                  GeneratedText = "";
                                  GeneratedText =
                                      "$Hello$wait${MainTheme.text}\n\n${answer.text}";
                                });
                              },
                              child: const Text("Generate"),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
