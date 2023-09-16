import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hep_desk/bloc/user_bloc/user_bloc.dart';
import 'package:hep_desk/bloc/user_bloc/user_state.dart';
import 'package:hep_desk/drawer_page/drawer.dart';
import 'package:hep_desk/repo/UserModel.dart';
import 'package:hep_desk/repo/repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(UserRepository()),
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueAccent,
            toolbarHeight: 120.10,
            flexibleSpace: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DrawerPage()));
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_active,
                              size: 25,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Team bedrijifsbureau",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SizedBox(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Text(
                              "Verbetersuggesties",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.blue,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      //width: 320,
                      child: ListView(
                        children: [
                          Container(
                            height: 240.0,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(6, (int index) {
                                return Card(
                                  // color: Colors.blue[index * 100],
                                  child: Container(
                                    // width: 330,
                                    width: 340,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 335,
                                              //color: Colors.orangeAccent,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.blueAccent),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Startdatum",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Text("Einddatum")
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                "01-02-2021",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Text(
                                                "11-02-2021",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 15),
                                          child: Row(
                                            children: [
                                              Text("Status"),
                                              SizedBox(
                                                width: 95,
                                              ),
                                              Text(
                                                "Lopend",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 15),
                                          child: Row(
                                            children: [
                                              Text("Ok Status"),
                                              SizedBox(
                                                width: 75,
                                              ),
                                              Text(
                                                "In Orde",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 15),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Analyseer lange doorlooptijd",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                width: 35,
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_right),
                                                iconSize: 30,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      child: Row(
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            child: Container(
                              width: 325,
                              height: 78,
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 18, left: 18),
                                child: Column(
                                  children: [
                                    Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.scoreboard_sharp,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 200,
                                          ),
                                          Text(
                                            "65",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orangeAccent),
                                          )
                                        ]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Goed bezig ,#1 Emma Green!",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Moodindicator",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 120,
                          width: 350,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18),
                                        child: Text(
                                          "Hoevell plezier heb je momenteel ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          "in je werk? ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              Icon(Icons.keyboard_arrow_left)),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.insert_emoticon),
                                        iconSize: 30,
                                        color: Colors.amber,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.insert_emoticon_outlined),
                                        iconSize: 30,
                                        color: Colors.amber,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.insert_emoticon_sharp),
                                        iconSize: 30,
                                        color: Colors.amber,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.insert_emoticon_rounded),
                                        iconSize: 30,
                                        color: Colors.amber,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.insert_emoticon_rounded),
                                        iconSize: 30,
                                        color: Colors.amber,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              Icon(Icons.keyboard_arrow_right)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
