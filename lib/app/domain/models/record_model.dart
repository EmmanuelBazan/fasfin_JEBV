import 'dart:convert';

class RecordModel {
  int? id;
  int categoriaId;
  int operacionId;
  String? descripcion;
  double total;
  String? imgs;
  int cuentaId;
  String fecha;

  RecordModel({
    required this.id,
    required this.categoriaId,
    required this.operacionId,
    required this.descripcion,
    required this.total,
    required this.imgs,
    required this.cuentaId,
    required this.fecha,
  });

  factory RecordModel.fromJson(String str) =>
      RecordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecordModel.fromMap(Map<String, dynamic> json) => RecordModel(
        id: json["id"],
        categoriaId: json["categoriaId"],
        operacionId: json["operacionId"],
        descripcion: json["descripcion"],
        total: json["total"]?.toDouble(),
        imgs: json["imgs"],
        cuentaId: json["cuentaId"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "categoriaId": categoriaId,
        "operacionId": operacionId,
        "descripcion": descripcion,
        "total": total,
        "imgs": imgs,
        "cuentaId": cuentaId,
        "fecha": fecha,
      };
}
