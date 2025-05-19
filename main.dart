import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )
      home: CarrinhoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  List<Produto> produtos = [
    Produto("Camiseta", 49.99, "https://images.tcdn.com.br/img/img_prod/747002/camiseta_masculina_hoshwear_globe_roxa_1009_2_961be07586796a7832f116d7232cc7eb.jpg"),
    Produto("Tênis", 199.90, "https://artwalk.vtexassets.com/arquivos/ids/516416/DZ548-5-130-1-800x1000.jpg?v=638499942801300000"),
    Produto("Calça Jeans", 89.50, "https://images.tcdn.com.br/img/img_prod/769687/calca_jeans_masculina_slim_algodao_com_elastano_40_e_44_wolfgan_1439_1_6b0685f12cef1f1e7ef4dbaf36e6a64c.jpg"),
    Produto("Relógio", 150.00, "https://lojaibyte.vteximg.com.br/arquivos/ids/398685-1200-1200/smartwatch-samsung-galaxy-watch5-heart-grafite-1-min.jpg?v=637999831051800000"),
    Produto("Boné", 29.90, "https://static.prospin.com.br/media/catalog/product/cache/6e59e4946046b080cb91aa3230980e44/m/b/mbi22bon122-bone-new-era-9forty-a-frame-snapback-aba-curva-mlb-new-york-yankees.jpg"),
    Produto("Óculos", 79.99, "https://static.zattini.com.br/produtos/oculos-de-sol-polarizado-masculino-solar-escuro-esportivo-protecao-100/06/I1D-0043-006/I1D-0043-006_zoom1.jpg?ts=1744299889"),
  ];

  double total = 0.0;

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Carrinho de Compras'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // duas colunas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  final produto = produtos[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(produto.nome,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Image.network(produto.imagemUrl, height: 80),
                        Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                        ElevatedButton(
                          onPressed: () {
                            adicionarAoCarrinho(produto.preco);
                          },
                          child: Text('Adicionar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.blueGrey[100],
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
