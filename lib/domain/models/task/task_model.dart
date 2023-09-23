import 'dart:convert';

import 'package:flutter/widgets.dart';

class TaskModel {
  String? firebaseId;
  String name;
  String description;
  bool isChecked;

  TaskModel({
    this.firebaseId,
    required this.name,
    required this.description,
    required this.isChecked,
  });

  TaskModel copyWith({
    ValueGetter<String?>? firebaseId,
    String? name,
    String? description,
    bool? isChecked,
  }) {
    return TaskModel(
      firebaseId: firebaseId != null ? firebaseId() : this.firebaseId,
      name: name ?? this.name,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firebaseId': firebaseId,
      'name': name,
      'description': description,
      'isChecked': isChecked,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      firebaseId: map['firebaseId'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isChecked: map['isChecked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(firebaseId: $firebaseId, name: $name, description: $description, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.firebaseId == firebaseId &&
        other.name == name &&
        other.description == description &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode {
    return firebaseId.hashCode ^
        name.hashCode ^
        description.hashCode ^
        isChecked.hashCode;
  }
}
