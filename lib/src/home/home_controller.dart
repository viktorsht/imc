import 'package:flutter/material.dart';
import 'package:mvvm/src/home/person_model.dart';

class HomeViewModel extends ChangeNotifier{

  double _altura = 0.0;
  double _peso = 0.0;

  String _result = '';

  String get result => _result;

  void setAltura(String value) => _altura = double.tryParse(value) ?? 0;
  void setPeso(String value) => _peso = double.tryParse(value) ?? 0;
  
  void calculateImc(){
    final imcValue = PersonModel(altura: _altura, peso: _peso).getImc();
    final imcText = imcValue.toStringAsFixed(1);
    if(imcValue < 18){
      _result = "O IMC é: $imcText. Abaixo do peso!";
    }
    else if (imcValue > 18 && imcValue < 24){
      _result = "O IMC é: $imcText. Você está bem!";
    }
    else{
      _result = "O IMC é: $imcText. Acima do peso!";
    }
    notifyListeners();
  }

}