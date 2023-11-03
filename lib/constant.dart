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
    "title": "Tempo caminhando",
    "unit": "minutos",
    "svg": "svg/icons/time.svg",
    "color": timeColor,
  },
};

const Color calorieColor = Color.fromRGBO(255, 122, 0, 1);
const Color distanceColor = Color.fromRGBO(255, 214, 0, 1);
const Color stepColor = Color.fromRGBO(0, 102, 255, 1);
const Color timeColor = Color.fromRGBO(0, 255, 87, 1);
