import 'package:flutter/material.dart';
import 'package:semtitulo1/data/bd.dart';
import 'package:semtitulo1/domain/pacote_turistico.dart';
import 'package:semtitulo1/pages/propaganda_page.dart';
import 'package:semtitulo1/widget/pacote_turistico_card.dart';

import '../data/pacote_dao.dart';

class DestaquesPage extends StatefulWidget {
  const DestaquesPage({Key? key}) : super(key: key);

  @override
  State<DestaquesPage> createState() => _DestaquesPageState();
}

class _DestaquesPageState extends State<DestaquesPage> {
  Future<List<PacoteTuristico>> lista = PacoteDao().listarPacotes();

  PacoteTuristico destaque = PacoteTuristico(
    imagem:
    'https://a.cdn-hotels.com/gdcs/production97/d402/6baff29c-e43b-4caf-a9e8-5dcf1279dea0.jpg?impolicy=fcrop&w=800&h=533&q=medium',
    titulo: 'Pacote Cancún 2022/2023',
    transporte: 'Aéreo - Hotel All inclusive',
    cidade: 'CANCÚN, MEX',
    validade: 'De 10 ago 2021 até 30 set 2022',
    desconto: 45,
    numDiarias: 5,
    numPessoas: 2,
    numParcelas: 6,
    precoAntigo: 6819,
    precoAtual: 2819,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildContainerPropaganda(context),
            const SizedBox(height: 16),
            buildContainerDestaque(context),
            buildListView()
          ],
        )
    );
  }

  buildListView(){
    return FutureBuilder<List<PacoteTuristico>>(
      future: lista,
      builder: (context, snapshot){

        if(snapshot.hasData) {
          List<PacoteTuristico> lista = snapshot.data ?? [];

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.45,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) {
              return CardPacoteTuristico(pacoteTuristico: lista[index]);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());

      },
    );
  }

  buildContainerDestaque(BuildContext context) {
    return CardPacoteTuristico(pacoteTuristico: destaque);
  }
  buildContainerPropaganda(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Tops destinos mais buscados',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Corre que tá rolando muita promoção',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onPressedButton,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF8FF04),
                  ),
                  child: const Text(
                    'EU QUERO!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          Image.network(
            'https://manancialtur.com.br/wp-content/uploads/2020/02/Homem-pulando-com-mala.png',
            height: 150,
            width: 100,
          ),
        ],
      ),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PropagandaPage();
        },
      ),
    );
  }
}


