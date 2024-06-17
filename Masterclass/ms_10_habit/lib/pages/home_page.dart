import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_10_habit/components/habit_tile.dart';
import 'package:ms_10_habit/components/heat_map.dart';
import 'package:ms_10_habit/components/my_drawer.dart';
import 'package:ms_10_habit/database/habit_database.dart';
import 'package:ms_10_habit/models/habit.dart';
import 'package:ms_10_habit/theme/theme_provider.dart';
import 'package:ms_10_habit/util/habit_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //text controller
  final TextEditingController textController = TextEditingController();


  @override
  void initState() {
    Provider.of<HabitDatabase>(context,listen: false).readHabits();
    super.initState();
  }
  //create new habit
  void createNewHabbit(){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: "Create a new habit"
        ),
      ),
      actions: [
        //save button
        MaterialButton(
          child: Text("Save"),
          onPressed: () {
          String newHabitName=textController.text;

          context.read<HabitDatabase>().addHabit(newHabitName);
          Navigator.pop(context);
          textController.clear();
        }),
        MaterialButton(
          child: Text("Cancel"),
          onPressed: () {
          Navigator.pop(context);
          textController.clear();
        }),

      ],
    ));
  }

  // check habit on and off
  void checkHabitOnAndOff(bool? value,Habit habit){
    //update habit completion status
    if(value !=null){
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }

  }

  //edit
  void editHabitBox(Habit habit){
    textController.text=habit.name;
    showDialog(context: context, builder:(context)=> AlertDialog(
      content: TextField(controller: textController),
      actions: [
        //save button
        MaterialButton(
          child: Text("Save"),
          onPressed: () {
          String newHabitName=textController.text;

          context.read<HabitDatabase>().updateHabitName(habit.id,newHabitName);
          Navigator.pop(context);
          textController.clear();
        }),
        MaterialButton(
          child: Text("Cancel"),
          onPressed: () {
          Navigator.pop(context);
          textController.clear();
        }),
      ],
    ));
  }
  //delete
  void deleteHabitBox(Habit habit){
     showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text("Are you sure you want to delete?"),
      actions: [
        //save button
        MaterialButton(
          child: const Text("Yes"),
          onPressed: () {
          context.read<HabitDatabase>().deleteHabit(habit.id);
          Navigator.pop(context);
        }),
        MaterialButton(
          child: const Text("Cancel"),
          onPressed: () {
          Navigator.pop(context);
        }),
      ],
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabbit,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
        //HEAT MAP
        _buildHeatMapList(),
        //Habit List
        _buildHabitList()
        ],

      ),
    );
  }

 Widget _buildHeatMapList(){
    // habit database
    final habitDatabase=context.watch<HabitDatabase>();
    //current habits

    List<Habit> currentHabits=habitDatabase.currentHabits;

    return FutureBuilder(
      future: habitDatabase.getFirstLaunchDate(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return MyHeatMap(startDate: snapshot.data!, datasets:prepHeatMapDataset(currentHabits) );
        }
        else{
          return Container();
        }
      },
    );
  }

  Widget _buildHabitList(){
    final habitDatabase=context.watch<HabitDatabase>();

    List<Habit> currentHabits=habitDatabase.currentHabits;

    return ListView.builder(
      itemCount: currentHabits.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        //get each individual habit
        final habit = currentHabits[index];

        //check if the habit is completed today
        bool isCompletedToday= isHabitCompletedToday(habit.completedDays);

        return MyHabitTile(
          isCompleted: isCompletedToday,
          text: habit.name,
          onChanged: (value) =>checkHabitOnAndOff(value,habit),
          editHabit: (context) => editHabitBox(habit),
          deleteHabit: (context) => deleteHabitBox(habit),
        );
    });
  }

 
}
