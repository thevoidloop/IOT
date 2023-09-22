class LampItem {
  int power;
  DateTime inicio;
  DateTime? lampItemFinal;

  LampItem({
    required this.power,
    required this.inicio,
    required this.lampItemFinal,
  });

  factory LampItem.fromJson(Map<String, dynamic> json) => LampItem(
        power: json["power"],
        inicio: DateTime.parse(json["inicio"]),
        lampItemFinal: json["final"] == null ? null : DateTime.parse(json["final"]),
      );

  Map<String, dynamic> toJson() => {
        "power": power,
        "inicio": inicio.toIso8601String(),
        "final": lampItemFinal?.toIso8601String(),
      };
}
