import 'package:flutter/material.dart';

const List<Map<String, String>> tabOption = [
  {"title": "Saúde", "svg": "assets/svg/icons/health.svg"},
  {"title": "Meditar", "svg": "assets/svg/icons/meditation.svg"},
  {"title": "Mapa", "svg": "assets/svg/icons/world_map.svg"},
  {"title": "Conquistas", "svg": "assets/svg/icons/emblem.svg"},
  {"title": "Histórico", "svg": "assets/svg/icons/history.svg"},
];

const Map<String, dynamic> healthDetail = {
  "calorie": {
    "title": "Calorias perdidas",
    "unit": "kcal",
    "svg": "assets/svg/icons/fire.svg",
    "color": calorieColor,
  },
  "distance": {
    "title": "Distancia",
    "unit": "km",
    "svg": "assets/svg/icons/route.svg",
    "color": distanceColor,
  },
  "step": {
    "title": "Passos dados",
    "unit": "passos",
    "svg": "assets/svg/icons/steps.svg",
    "color": stepColor,
  },
  "time": {
    "title": "Tempo",
    "unit": "minutos",
    "svg": "assets/svg/icons/time.svg",
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

const selectText = {
  "pt-br": "Concluir",
  "en-us": "Done",
};

const backText = {
  "pt-br": "Voltar",
  "en-us": "Back",
};
