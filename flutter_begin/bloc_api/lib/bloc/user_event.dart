import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 
 abstract class UserEvent extends Equatable{
  const UserEvent();
 }

 class LoadUserEvent extends UserEvent{
  List<Object?> get props => [];
 }