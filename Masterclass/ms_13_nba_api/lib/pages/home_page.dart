import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ms_13_nba_api/models/team.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Team> teams = [];
  Future getTeams() async {
    var response = await http.get(Uri.https('api.balldontlie.io', '/v1/teams'),
        headers: {'Authorization': 'c627f043-86c7-4bae-870d-01e27ab63354'});
    var jsonData = jsonDecode(response.body);
    for (var eachTeam in jsonData['data']) {
      final team =
          Team(abbreviation: eachTeam['abbreviation'], city: eachTeam['city']);
      teams.add(team);
    }

    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(teams[index].abbreviation),
                    subtitle: Text(teams[index].city),
                  );
                });
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
      
              );
            }
          },
        ),
      ),
    );
  }
}
