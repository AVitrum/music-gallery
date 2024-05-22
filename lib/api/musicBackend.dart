import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:gallery_app/models/fact.dart';

class MusicBackend {
  Future<void> signUp() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> register(String username, String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
  }

  Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Something went wrong: ${e.message}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Stream<List<String>> get favouriteArtists {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;

    return db
        .collection('users')
        .doc(userId)
        .collection('favourited_artists')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.id).toList());
  }

  Future<void> setFavouritedArtist(
      {required String title, required bool favorited}) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;

    var painter = db
        .collection('users')
        .doc(userId)
        .collection('favourited_artists')
        .doc(title);

    if (favorited) {
      await painter.set({});
    } else {
      await painter.delete();
    }
  }

  Stream<List<String>> get favouriteMusics {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;

    return db
        .collection('users')
        .doc(userId)
        .collection('favourited_musics')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.id).toList());
  }

  Future<void> setFavouritedMusic(
      {required String title, required bool favorited}) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;

    var music = db
        .collection('users')
        .doc(userId)
        .collection('favourited_musics')
        .doc(title);

    if (favorited) {
      await music.set({});
    } else {
      await music.delete();
    }

    await setLikeToMusic(title: title, liked: favorited);
  }

  Future<void> setLikeToMusic(
      {required String title, required bool liked}) async {
    final db = FirebaseFirestore.instance;
    final musicRef = db.collection('likes').doc(title);

    await db.runTransaction((transaction) async {
      final snapshot = await transaction.get(musicRef);

      if (snapshot.exists) {
        final data = snapshot.data()!;
        final currentLikes = data['likes'] ?? 0;

        if (liked) {
          transaction.update(musicRef, {'likes': currentLikes + 1});
        } else {
          if (currentLikes > 0) {
            transaction.update(musicRef, {'likes': currentLikes - 1});
          }
        }
      } else {
        transaction.set(musicRef, {'likes': 1});
      }
    });
  }

  Stream<int> getLikesForMusic(String title) {
    final db = FirebaseFirestore.instance;
    final musicRef = db.collection('likes').doc(title);

    return musicRef.snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data != null && data.containsKey('likes')) {
        return data['likes'];
      } else {
        return 0;
      }
    });
  }

  Future<List<ArtistInfo>> getArtists() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final String data = await rootBundle.loadString('assets/data/artists.json');
    final dataList = jsonDecode(data)['artists'] as List;

    return dataList.map((e) => ArtistInfo.fromMap(e)).toList();
  }

  Future<List<FactModel>> getFacts() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final String data = await rootBundle.loadString('assets/data/facts.json');
    final dataList = jsonDecode(data)['facts'] as List;
    return dataList.map((e) => FactModel.fromMap(e)).toList();
  }
}
