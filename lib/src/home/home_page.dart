import 'package:flutter/material.dart';
import 'package:mvvm/src/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final controller = HomeViewModel();
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              const SizedBox(height: 16,),
              TextField(
                onChanged: controller.setAltura,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Altura"
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                onChanged: controller.setPeso,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Peso",
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                onPressed: (){
                  controller.calculateImc();
                  setState(() {});
                }, 
                child: const Text("Calcular IMC")
              ),
              const SizedBox(height: 16,),
              AnimatedBuilder(
                animation: controller,
                builder:(context, child) { return Text(controller.result);}
              ),
            ],
          ),
        ),
      ),
    );
  }
}