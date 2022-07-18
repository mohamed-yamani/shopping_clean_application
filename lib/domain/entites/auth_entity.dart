import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AuthType {
  google,
  facebook,
  apple,
  emailAndPassword,
  phone,
}

class AuthEntity extends Equatable {
  final String? id;
  final String? nom;
  final String? photoPrincipal;
  final String? mail;
  final AuthType? type;
  final String? accessToken;
  final String? idToken;

  const AuthEntity({
    @required this.accessToken,
    @required this.idToken,
    @required this.id,
    @required this.nom,
    @required this.mail,
    @required this.photoPrincipal,
    @required this.type,
  });

  @override
  List<Object> get props =>
      [id!, nom!, photoPrincipal!, mail!, type!, accessToken!, idToken!];

  @override
  bool get stringify => true;
}
