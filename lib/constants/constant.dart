import 'package:flutter/material.dart';

const List<Map<String, String>> tabOption = [
  {"title": "Saúde", "svg": "svg/icons/health.svg"},
  {"title": "Meditar", "svg": "svg/icons/meditation.svg"},
  {"title": "Mapa", "svg": "svg/icons/world_map.svg"},
  {"title": "Conquistas", "svg": "svg/icons/emblem.svg"},
  {"title": "Histórico", "svg": "svg/icons/history.svg"},
];

const Map<String, dynamic> healthDetail = {
  "calorie": {
    "title": "Calorias perdidas",
    "unit": "kcal",
    "svg": "svg/icons/fire.svg",
    "color": calorieColor,
  },
  "distance": {
    "title": "Distancia",
    "unit": "km",
    "svg": "svg/icons/route.svg",
    "color": distanceColor,
  },
  "step": {
    "title": "Passos dados",
    "unit": "passos",
    "svg": "svg/icons/steps.svg",
    "color": stepColor,
  },
  "time": {
    "title": "Tempo",
    "unit": "minutos",
    "svg": "svg/icons/time.svg",
    "color": timeColor,
  },
};

const Map<int, dynamic> daysAndMonth = {
  1: {"name": "Janeiro", "numberOfDays": 31},
  2: {"name": "Fevereiro", "numberOfDays": 28},
  3: {"name": "Março", "numberOfDays": 31},
  4: {"name": "Abril", "numberOfDays": 30},
  5: {"name": "Maio", "numberOfDays": 31},
  6: {"name": "Junho", "numberOfDays": 30},
  7: {"name": "Julho", "numberOfDays": 31},
  8: {"name": "Agosto", "numberOfDays": 31},
  9: {"name": "Setembro", "numberOfDays": 30},
  10: {"name": "Outubro", "numberOfDays": 31},
  11: {"name": "Novembro", "numberOfDays": 30},
  12: {"name": "Dezembro", "numberOfDays": 31},
};

const Color primaryColor = Color.fromRGBO(0, 255, 194, 1);

const Color calorieColor = Color.fromRGBO(255, 122, 0, 1);
const Color distanceColor = Color.fromRGBO(255, 214, 0, 1);
const Color stepColor = Color.fromRGBO(0, 102, 255, 1);
const Color timeColor = Color.fromRGBO(0, 255, 87, 1);

const Color goodResult = Color.fromRGBO(138, 255, 128, 1);
const Color badResult = Color.fromRGBO(255, 128, 128, 1);

const Map<int, Color> bmiIndexColor = {
  0: Color.fromRGBO(128, 186, 255, 1),
  1: Color.fromRGBO(145, 255, 128, 1),
  2: Color.fromRGBO(255, 242, 128, 1),
  3: Color.fromRGBO(255, 174, 128, 1),
  4: Color.fromRGBO(255, 128, 128, 1),
};

enum Gender {
  male("Masculino"),
  female("Feminino");

  const Gender(this.label);
  final String label;
}
