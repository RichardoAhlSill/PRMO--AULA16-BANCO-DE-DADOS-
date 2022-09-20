import 'package:flutter/material.dart';

class PropagandaPage extends StatefulWidget {
  const PropagandaPage({Key? key}) : super(key: key);

  @override
  State<PropagandaPage> createState() => _PropagandaPageState();
}

class _PropagandaPageState extends State<PropagandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: const Color(0xFF075E54),
      ),
      body: ListView(
        children: [
          buildListTile(
            img:
            'https://noticiasdatv.uol.com.br/media/_versions/everybody-hates-chris-julius-dia-dos-pais_fixed_large.jpg',
            contato: 'Julius',
            msg: 'Já ia gastar dinheiro? Achou que eu tava brincando?',
            status: 'HOJE',
          ),
          buildListTile(
            img:
            'https://criadoresid.com/wp-content/uploads/2019/01/Criador_Everson-Zoio_youtuber_criadoresid-4.jpg',
            contato: 'Zoio Hardicore',
            msg: 'É trollagi garai ksksksskks',
            status: 'ONTEM',
          ),
          buildListTile(
            img:
            'https://br.web.img2.acsta.net/c_310_420/pictures/19/03/20/16/05/1007568.jpg',
            contato: 'Roberto Pato',
            msg: 'Oi varoa rsrsrs',
            status: 'ONTEM',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.insert_comment),
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
      ),
    );
  }
  buildListTile({
    required String img,
    required String contato,
    required String msg,
    required String status,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(img),
      ),
      title: Text(
        contato,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(msg),
      trailing: Text(status),
    );
  }
}