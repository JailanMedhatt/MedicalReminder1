import 'package:flutter/material.dart';

import '../HealthApi.dart';
import '../api.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final apiManager = ApiManager(
      apiUrl:
      'https://health.gov/myhealthfinder/api/v3/myhealthfinder.json?age=10&sex=male');

  late Future<List<Resource>> resources;

  @override
  void initState() {
    super.initState();
    resources = apiManager.fetchHealthResources();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/tipsBG.png"),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Health Tips",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          ),
          body: FutureBuilder<List<Resource>>(
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                resources[index].title ?? "",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Image.network(resources[index].imageUrl!),
                              ),
                              Text("${resources.length}"),
                              Text(
                                resources[index].myHFDescription ?? "",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.normal),
                              ),
                              SizedBox(height: 10),
                              // Add more information as needed
                            ],
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
