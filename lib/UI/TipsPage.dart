import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../ViewModels/ApiOfHealth.dart';
import '../providers/list_provider.dart';

class ApiManager {
  final String apiUrl;

  ApiManager({required this.apiUrl});

  Future<List<Glossary>> fetchHealthResources() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final apiOfHealth = ApiOfHealth.fromJson(jsonBody);
      return apiOfHealth.glossary ?? [];
    } else {
      throw Exception('Failed to fetch health resources');
    }
  }
}

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final apiManager = ApiManager(
      apiUrl:
      'https://www.healthcare.gov/api/glossary.json');

  late Future<List<Glossary>> resources;

  @override
  void initState() {
    super.initState();
    resources = apiManager.fetchHealthResources();
  }

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: listProvider.getBackgroundImage(),),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Health Tips",
                style: //TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
                listProvider.isDarkMode()?
            Theme.of(context).textTheme.titleLarge
            :
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 23)),
          ),
          body: FutureBuilder<List<Glossary>>(
            future: resources,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available.'));
              } else {
                final resources = snapshot.data!;
                return ListView.builder(
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 20.0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: //Colors.white.withOpacity(0.85),
                              listProvider.isDarkMode()?
                              MyTheme.n.withOpacity(0.80)
                              :
                              MyTheme.whiteColor.withOpacity(0.80)
                              ,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  resources[index].title ?? "",
                                  style: //TextStyle(
                                      //fontSize: 22, fontWeight: FontWeight.w600),
                                  Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  resources[index].content ?? "",
                                  style: //TextStyle(
                                     // fontSize: 16, fontWeight: FontWeight.normal),
                                  listProvider.isDarkMode()?
                                  Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor)
                                      :
                                  Theme.of(context).textTheme.titleSmall


                                ),
                                SizedBox(height: 10),
                                // Add more information as needed
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}