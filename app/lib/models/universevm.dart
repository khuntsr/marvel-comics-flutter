import 'package:meta/meta.dart';
import 'dart:convert';

class UniverseVm {
  UniverseVm({
    required this.moviewName,
    this.documentId,
  });

  final String moviewName;
  final String? documentId;

  UniverseVm copyWith({
    String? content,
    bool? isCompleted,
  }) {
    return UniverseVm(documentId: documentId, moviewName: moviewName);
  }

  Map<String, dynamic> toMap() {
    return {'moviewName': moviewName};
  }

  factory UniverseVm.fromMap(Map<String, dynamic> map) {
    return UniverseVm(
      documentId: map['\$id'] as String,
      moviewName: map['MoviewName'] as String,
    );
  }

  @override
  String toString() => 'TodoModel(moviewName: $moviewName,   documentId: $documentId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UniverseVm && other.moviewName == moviewName && other.documentId == documentId;
  }

  @override
  int get hashCode => moviewName.hashCode ^ documentId.hashCode;
}
