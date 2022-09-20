class PacoteTuristico {
  late final String imagem;
  late final String nome;
  late final String titulo;
  late final String validade;
  late final String cidade;
  late final int numDiarias;
  late final int numPessoas;
  late final int numParcelas;
  late final int desconto;
  late final String transporte;
  late final double precoAtual;
  late final double precoAntigo;

  PacoteTuristico({
    required this.validade,
    required this.cidade,
    required this.desconto,
    required this.imagem,
    this.nome = '',
    required this.titulo,
    required this.numDiarias,
    required this.numPessoas,
    required this.numParcelas,
    required this.transporte,
    required this.precoAtual,
    required this.precoAntigo,
  });

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['validity'] = validade;
    data['city'] = cidade;
    data['discount'] = desconto;
    data['url_image'] = imagem;
    data['head'] = titulo;
    data['title'] = nome;
    data['nights'] = numDiarias;
    data['persons'] = numPessoas;
    data['transport'] = transporte;
    data['current_price'] = precoAtual;
    data['old_price'] = precoAntigo;
    data['free_cancellation'] = true;

    return data;
  }

  PacoteTuristico.fromJson(Map<String, dynamic> json){
    validade = json['validity'];
    cidade = json['city'];
    desconto = json['discount'];
    imagem = json['url_image'];
    titulo = json['head'];
    nome = json['title'];
    numDiarias = json['nights'];
    numPessoas = json['persons'];
    numParcelas = 12;
    transporte = json['transport'];
    precoAntigo = json['old_price'];
    precoAtual = json['current_price'];
  }
}