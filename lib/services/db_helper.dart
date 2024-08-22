import 'dart:convert'; // For jsonEncode and jsonDecode
import 'package:eaisoft/model/posts_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'posts_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {
        print("Creating database with version $version");
        return db.execute(
          'CREATE TABLE posts('
          'id INTEGER PRIMARY KEY, '
          'title TEXT, '
          'body TEXT, '
          'tags TEXT, '
          'reactions TEXT, '
          'views INTEGER, '
          'userId INTEGER)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print("Upgrading database from version $oldVersion to $newVersion");
        if (oldVersion < 2) {
          await db.execute(
            'ALTER TABLE posts ADD COLUMN tags TEXT',
          );
          await db.execute(
            'ALTER TABLE posts ADD COLUMN reactions TEXT',
          );
        }
      },
    );
  }

  Future<void> insertPost(Posts post) async {
    final db = await database;

    Map<String, dynamic> postMap = {
      'id': post.id,
      'title': post.title,
      'body': post.body,
      'tags': post.tags != null ? post.tags!.join(',') : null,
      'reactions':
          post.reactions != null ? jsonEncode(post.reactions!.toJson()) : null,
      'views': post.views,
      'userId': post.userId,
    };

    await db.insert('posts', postMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Posts>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');

    return List.generate(maps.length, (i) {
      return Posts(
        id: maps[i]['id'],
        title: maps[i]['title'],
        body: maps[i]['body'],
        tags: maps[i]['tags'] != null ? maps[i]['tags'].split(',') : null,
        reactions: maps[i]['reactions'] != null
            ? Reactions.fromJson(jsonDecode(maps[i]['reactions']))
            : null,
        views: maps[i]['views'],
        userId: maps[i]['userId'],
      );
    });
  }

  Future<void> deletePosts() async {
    final db = await database;
    await db.delete('posts');
  }
}
