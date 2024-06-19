import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:ms_9_offline_note/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;
  //Initialize Database
  static Future<void> initialize() async{
    final dir=await getApplicationDocumentsDirectory();
    isar=await Isar.open(
      [NoteSchema], 
      directory: dir.path);
  }

  //list of notes
  final List<Note> currentNotes=[];

  //Create
  Future<void> addNote(String textFromUser) async{

    final newNote=Note()..text=textFromUser;

    await isar.writeTxn(() => isar.notes.put(
      newNote
    ));

    fetchNotes();
  }
  //Read
  Future<void> fetchNotes() async{
    List<Note> fetchNotes=await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    
    notifyListeners();
  }

  //Update
  Future<void> updateNote(int id,String newNote) async{
    final existingNote=await isar.notes.get(id);
    if(existingNote!=null){
      existingNote.text=newNote;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }
  //Delete
  Future<void> deleteNote(int id) async{
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}

