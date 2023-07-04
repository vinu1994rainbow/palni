import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_new/data/models/dataaimodel.dart';


import '../../cubit_bloc/home_cubit/home_cubit.dart';
import '../../di/locator.dart';
import '../../utils/color_constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _countries = [];
  var _states = [];
  var _cities = [];

// these will be the values after selection of the item
  String? country;
  String? city;
  String? state_s;

// this will help to show the widget after
  bool isCountrySelected = false;
  bool isStateSelected = false;
  late TabController _controller;
  late List<DataApiModel> apiModel = [];
  var homeCubit = getIt<HomeCubit>();
  @override
  void initState() {

    homeCubit.getApi();
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: MultiBlocListener(
                  listeners:[
                    BlocListener<HomeCubit, HomeState>(
                      listener: (context, state) {
                        if (state is HBLoading) {
                          //LoaderWidget.showProgressIndicatorAlertDialog(context);
                        }
                      },

                    ),
                  ],
                  child:BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if(state is HBLoaded)
                      {
                        apiModel = state.response;

                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              //========================Country

                              if (_countries.isEmpty) const Center(child: CircularProgressIndicator()) else Card(
                                color: Colors.purple.withOpacity(0.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: DropdownButton<String>(
                                      underline: Container(),
                                      hint: Text("Select Country"),
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      isDense: true,
                                      isExpanded: true,
                                      items: _countries.map((ctry){
                                        return DropdownMenuItem<String>(
                                            value: ctry["name"],
                                            child: Text(ctry["name"])
                                        );
                                      }).toList(),
                                      value: country,
                                      onChanged: (value){
                                        setState(() {
                                          _states = [];
                                          country = value!;
                                          for(int i =0; i<_countries.length; i++){
                                            if(_countries[i]["name"] == value){
                                              _states = _countries[i]["states"];
                                            }
                                          }
                                          isCountrySelected = true;
                                        });
                                      }),
                                ),
                              ),

//======================================= State
                              if(isCountrySelected)
                                Card(
                                  color: Colors.purple.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  child: Container(

                                    padding: const EdgeInsets.all(15.0),
                                    child: DropdownButton<String>(
                                        underline: Container(),
                                        hint: Text("Select State"),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        isDense: true,
                                        isExpanded: true,
                                        items: _states.map((st){
                                          return DropdownMenuItem<String>(
                                              value: st["name"],
                                              child: Text(st["name"])
                                          );
                                        }).toList(),
                                        value: state_s,
                                        onChanged: (value){
                                          setState(() {

                                            _cities = [];
                                            state_s = value!;
                                            for(int i =0; i<_states.length; i++){
                                              if(_states[i]["name"] == value){
                                                _cities = _states[i]["cities"];
                                              }
                                            }
                                            isStateSelected = true;
                                          });
                                        }),
                                  ),
                                ) else Container(),


                              //=============================== City
                              if(isStateSelected)
                                Card(
                                  color: Colors.purple.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: DropdownButton<String>(
                                        underline: Container(),
                                        hint: Text("Select City"),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        isDense: true,
                                        isExpanded: true,
                                        items: _cities.map((ct){
                                          return DropdownMenuItem<String>(
                                              value: ct["name"],
                                              child: Text(ct["name"])
                                          );
                                        }).toList(),
                                        value: city,
                                        onChanged: (value){
                                          setState(() {


                                            city = value!;

                                          });
                                        }),
                                  ),
                                ) else Container(),

                            ],),
                        );
                      }
                      else{
                        return Container();
                      }

                    },
                  )
              ),
            )


        ));
  }
}

