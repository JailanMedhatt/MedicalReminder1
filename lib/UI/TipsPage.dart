import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:magnifying_glass/magnifying_glass.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  ValueNotifier<int> diameter = ValueNotifier(150);
  ValueNotifier<double> distortion = ValueNotifier(2.0);
  ValueNotifier<double> magnification = ValueNotifier(1.5);
  ValueNotifier<GlassPosition> glassPosition =
  ValueNotifier(GlassPosition.touchPosition);
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    MagnifyingGlassController magnifyingGlassController =
    MagnifyingGlassController();
    return  MagnifyingGlass(
      controller: magnifyingGlassController,
      glassPosition: glassPosition.value,
      borderThickness: 8.0,
      borderColor: Colors.transparent,
      elevation: 12,
      shadowOffset: const Offset(8, 8),
      glassParams: GlassParams(
        diameter: diameter.value,
        distortion: distortion.value,
        magnification: magnification.value,
        padding: const EdgeInsets.all(10),
      ),
      child: Stack(
        children: [
          listProvider.isDarkMode()?
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/darkBk.png"),
                  fit: BoxFit.cover),),
          )
          :
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
               image: AssetImage("assets/images/tipsBG.png"),
                    fit: BoxFit.cover),),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(AppLocalizations.of(context)!.health_Tips,
                  style: //TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
                  listProvider.isDarkMode()?
              Theme.of(context).textTheme.titleLarge
              :
                  Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 23)),
              actions: [
                InkWell(
                    child: Padding(
                      padding:  EdgeInsets.only(right: 10.0),
                      child: Icon(
                        //FontAwesomeIcons.magnifyingGlass,
                        Icons.search,
                        size: 35,
                        color: Color(0xff5D65B0),
                      ),
                    ),
                    onTap: () {
                      magnifyingGlassController.openGlass();
                    })
              ],
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
      ),
    );
  }
}