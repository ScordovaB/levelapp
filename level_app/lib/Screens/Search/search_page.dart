import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:level_app/Screens/Search/constants.dart';
import 'package:level_app/Screens/Search/search_data.dart';
import 'package:level_app/Screens/Widgets/app_bar_home.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<dynamic> profiles =[];
  List<dynamic> filteredProfiles =[];
  String currentFilter = 'All';
  bool deleteFilter = false;


  @override
  void initState(){
    super.initState();
    //loadJsonData();
    profiles = jsonDecode(PROFILES);
    filteredProfiles = List.from(profiles);
  }
  void filterProfiles(String query) {
    setState(() {
      filteredProfiles = profiles
          .where((profile) =>
              profile['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void filterByCategory(String category) {
    setState(() {
      currentFilter = category;
      if (category == 'All') {
        filteredProfiles = List.from(profiles); // Show all profiles
      } else if(category == 'Team' || category == 'Athlete') {
        filteredProfiles = profiles
            .where((profile) => profile['type'].toLowerCase() == category.toLowerCase())
            .toList();
      } else if(category == 'Soccer' || category == 'Basketball' || category == 'Football') {
        filteredProfiles = profiles
            .where((profile) => profile['discipline'].toLowerCase() == category.toLowerCase())
            .toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                padding:  const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text("Search for Athletes, Teams, and more!", 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    hintText: 'eg: Messi',
                    hintStyle:  MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.grey)),
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 15.0)),
                    onTap: () {
                      controller.openView();
                      
                    },
                    onChanged: (query) {
                      print("Query: $query");
                      filterProfiles(query);
                      //print(profiles);
                    },
                    onSubmitted: (value) {
                      print("Submitted: $value");
                      filterProfiles(value);
                    },
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(filteredProfiles.length, (int index) {
                    final String item = '${filteredProfiles[index]["name"]}';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
              ),
              Divider(thickness: 3, color: Theme.of(context).primaryColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filters:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: ListView(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              filterByCategory('Team');
                              deleteFilter = true;
                            },
                            child: const Text("Teams")),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              filterByCategory('Athlete');
                              deleteFilter = true;
                            },
                            child: const Text("Athletes")),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              filterByCategory('Soccer');
                              deleteFilter = true;
                            },
                            child: const Icon(Icons.sports_soccer)),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              filterByCategory('Basketball');
                              deleteFilter = true;
                            },
                            child: const Icon(Icons.sports_basketball)),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              filterByCategory('Football');
                              deleteFilter = true;
                            },
                            child: const Icon(Icons.sports_football)),
                      ],
                    ),
                  ),
                  if(deleteFilter)
                    Row(
                      children: [
                        const Text("Filtering by: "),
                        Text(currentFilter),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              deleteFilter = false;
                              filterByCategory('All');
                            });
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    )
                ],
              ),
              const SizedBox(height: 10,),
              Divider(thickness: 3, color: Theme.of(context).primaryColor),
              Expanded(
                //height: 400,
                child: ProfileList(profiles: filteredProfiles),
              )
            ],
          ),
        ),
      ),
    );
  }
}
