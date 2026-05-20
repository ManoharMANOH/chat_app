import 'package:chat_app/core/utils/app_utils.dart';
import 'package:chat_app/data/services/auth_service.dart';
import 'package:chat_app/models/contact_model.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/cupertino.dart';

class ContactService {
  ContactService._();

  static Future<List<Contact>> getAll() async {
    if (await AppUtils.isInternetAvailable()) {
      try {
        final snapshot = await collectionRef.orderBy("firstName").get();
        return snapshot.docs.map((doc) => doc.data()).toList();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
        rethrow;
      }
    } else {
      throw "No internet connection";
    }
  }

  static Future<void> set(Contact contact) async {
    if (await AppUtils.isInternetAvailable()) {
      try {
        await collectionRef
            .doc(contact.id)
            .set(contact.copyWith(updatedAt: DateTime.now()));
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    }
  }

  static Future<Contact?> get(String id) async {
    if (await AppUtils.isInternetAvailable()) {
      try {
        final snapshot = await collectionRef.doc(id).get();
        return snapshot.data();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
        rethrow;
      }
    } else {
      throw "No internet connection!!";
    }
  }

  static Future<void> delete(String id) async {
    if (await AppUtils.isInternetAvailable()) {
      try {
        await collectionRef.doc(id).delete();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s);
      }
    } else {
      throw "No internet connection";
    }
  }

  static CollectionReference<Contact> get collectionRef {
    if (AuthService.uid == null) {
      throw "User is not authenticated";
    }
    return FirebaseFirestore.instance
        .collection("Users/${AuthService.uid!}/contacts")
        .withConverter<Contact>(
          toFirestore: (contact, _) => contact.toMap(),
          fromFirestore: (data, _) => Contact.fromMap(data.data()!),
        );
  }
}
