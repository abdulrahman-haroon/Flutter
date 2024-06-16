import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_9_offline_note/component/drawer.dart';
import 'package:ms_9_offline_note/component/note_tile.dart';
import 'package:ms_9_offline_note/models/note.dart';
import 'package:ms_9_offline_note/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // text controller to access what the user typed
  final textController=TextEditingController();

  @override
  void initState() {
    super.initState();
    //on app startup fetch the existing notes
    readNotes();
  }
  //create a note
  void createNote(){
      showDialog(context: context, builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //create button
          MaterialButton(onPressed: (){
            context.read<NoteDatabase>().addNote(textController.text);
            textController.clear();
            Navigator.pop(context);
          },
          child: Text("Create"),
          )
        ],
      ));
  }
  //read a note
  void readNotes(){
    context.read<NoteDatabase>().fetchNotes();
  }
  //update a note
  void updateNote(Note note){
    textController.text=note.text;
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Update Note"),
      content: TextField(
        controller: textController,
      ),
      actions: [
        MaterialButton(onPressed: (){
          context.read<NoteDatabase>().updateNote(note.id, textController.text);
          textController.clear();
          Navigator.pop(context);
        },
        child: Text("Update"),
        ),
      ],
    ));
  }
  //delete a note
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }
  @override
  Widget build(BuildContext context) {

    //note database
    final noteDatabase=context.watch<NoteDatabase>();

    List<Note> currentNotes=noteDatabase.currentNotes;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text("Notes",style: GoogleFonts.dmSerifText(
              fontSize: 48,
              color: Theme.of(context).colorScheme.inversePrimary
            )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final individualNote=currentNotes[index];
                return NoteTile(title: individualNote.text,onEditPressed: () => updateNote(individualNote),onDeletePressed: () => deleteNote(individualNote.id),); 
            }),
          ),
        ],
      ),
    );
  }
}
