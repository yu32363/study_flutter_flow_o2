// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageStruct extends FFFirebaseStruct {
  ImageStruct({
    String? imfId,
    String? imgPath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imfId = imfId,
        _imgPath = imgPath,
        super(firestoreUtilData);

  // "imf_id" field.
  String? _imfId;
  String get imfId => _imfId ?? '';
  set imfId(String? val) => _imfId = val;
  bool hasImfId() => _imfId != null;

  // "img_path" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  set imgPath(String? val) => _imgPath = val;
  bool hasImgPath() => _imgPath != null;

  static ImageStruct fromMap(Map<String, dynamic> data) => ImageStruct(
        imfId: data['imf_id'] as String?,
        imgPath: data['img_path'] as String?,
      );

  static ImageStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'imf_id': _imfId,
        'img_path': _imgPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imf_id': serializeParam(
          _imfId,
          ParamType.String,
        ),
        'img_path': serializeParam(
          _imgPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageStruct(
        imfId: deserializeParam(
          data['imf_id'],
          ParamType.String,
          false,
        ),
        imgPath: deserializeParam(
          data['img_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageStruct &&
        imfId == other.imfId &&
        imgPath == other.imgPath;
  }

  @override
  int get hashCode => const ListEquality().hash([imfId, imgPath]);
}

ImageStruct createImageStruct({
  String? imfId,
  String? imgPath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageStruct(
      imfId: imfId,
      imgPath: imgPath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageStruct? updateImageStruct(
  ImageStruct? image, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    image
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageStructData(
  Map<String, dynamic> firestoreData,
  ImageStruct? image,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (image == null) {
    return;
  }
  if (image.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && image.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageData = getImageFirestoreData(image, forFieldValue);
  final nestedData = imageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = image.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageFirestoreData(
  ImageStruct? image, [
  bool forFieldValue = false,
]) {
  if (image == null) {
    return {};
  }
  final firestoreData = mapToFirestore(image.toMap());

  // Add any Firestore field values
  image.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageListFirestoreData(
  List<ImageStruct>? images,
) =>
    images?.map((e) => getImageFirestoreData(e, true)).toList() ?? [];
