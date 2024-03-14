import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

class PatientHistory extends StatelessWidget {
  static final String routeName = "PatientHistory";

  // List suggestions=[];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Opening.png"),
          fit: BoxFit.cover,
        ),
      )),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 32)),
              title: Text(
                'Patient History',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              )),
          body: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding:  EdgeInsets.only(left: 15),
                child: SizedBox(
                    width: 360,
                    child: StandardSearchAnchor(
                      searchBar: StandardSearchBar(
                        bgColor: Colors.white,
                      ),
                      suggestions: StandardSuggestions(
                        suggestions: [
                          StandardSuggestion(text: 'Suggestion 1'),
                          StandardSuggestion(text: 'Suggestion 2'),
                          StandardSuggestion(text: 'Suggestion 3'),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 15.0, top: 20,right: 15.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 20.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffEDF2F3),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "Note");
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 16.0,top: 16,bottom: 16,right: 16),
                            child: Image(
                                image: AssetImage("assets/images/image 9.png")),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                            Text("Personal Notes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('Type what you want to remember',style: TextStyle(fontSize: 15),),


                          ],),
                          Spacer(),
                          Icon(Icons.edit_note,size: 40,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///Floating button
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 280, bottom: 50),
                child: FloatingActionButton(
                  elevation: 25.0,
                  onPressed: () {},
                  backgroundColor: Color(0xffEDF2F3),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Icon(
                      CupertinoIcons.cloud_upload,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ))
    ]);
  }
}
