import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
            child: Column(
          children: [
            TitleSection(
              name: "Galápagos",
              location: "Galápagos/Ecuador",
              description:
                  "El archipiélago de Galápagos es conocido mundialmente por su increíble biodiversidad y su influencia en la teoría de la evolución de Charles Darwin. Las islas ofrecen oportunidades únicas para observar especies animales que no se encuentran en ningún otro lugar del mundo, como las tortugas gigantes y las iguanas marinas.",
              image: "images/galapagos.jpg",
            ),
            TitleSection(
              name: "La mitad del mundo",
              location: "Quito/Ecuador",
              description:
                  "La Mitad del Mundo es un monumento ubicado en la parroquia de San Antonio de Pichincha, al norte de Quito. Marca el lugar donde se supone que pasa la línea ecuatorial. Es un sitio turístico popular que ofrece museos y actividades relacionadas con la ciencia y la cultura.",
              image: "images/mitad.jpeg",
            ),
            TitleSection(
              name: "Laguna del Quilotoa",
              location: "Latacunga/Ecuador",
              description:
                  "La Laguna del Quilotoa es un cráter volcánico lleno de agua turquesa, ubicado en la provincia de Cotopaxi. Es un destino popular para el senderismo y ofrece vistas impresionantes del cráter y el paisaje circundante.",
              image: "images/quilotoa.jpg",
            ),
            TitleSection(
              name: "Baños",
              location: "Baños/Ecuador",
              description:
                  "Conocido simplemente como Baños, este pequeño pueblo es famoso por sus cascadas y aguas termales. Es un destino popular para los amantes de la aventura, ofreciendo actividades como senderismo, ciclismo, rafting y puenting. Además, el paisaje montañoso circundante es espectacular.",
              image: "images/banios.jpg",
            ),
            TitleSection(
              name: "La ronda",
              location: "Quito/Ecuador",
              description:
                  "La Ronda es una calle emblemática en el centro histórico de Quito. Conocida por su encanto colonial, ofrece una variedad de tiendas, restaurantes y bares. Es un lugar ideal para experimentar la cultura local y disfrutar de la vida nocturna quiteña.",
              image: "images/ronda.jpg",
            ),
          ],
        )),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required this.name,
      required this.location,
      required this.description,
      required this.image});

  final String name;
  final String location;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('41'),
            ],
          ),
          ButtonSection(),
          TextSection(description: description),
          ImageSection(image: image),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
