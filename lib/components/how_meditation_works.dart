import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:flutter/material.dart';

class HowMeditationWorksModal extends StatelessWidget {
  const HowMeditationWorksModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      title: "Como funciona?",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Meditar antes de caminhar pode ser uma prática altamente benéfica para o corpo e a mente. Chamado de "caminhada consciente", pode dar clareza mental e foco, redução do estresse, conexão com a natureza e melhoria da concentração.',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 12),
                _TextAndSubtitle(
                  index: 1,
                  subtitle: "Escolhendo seu Áudio:",
                  text:
                      "Escolha o áudio que mais combina com o seu estado de espírito hoje. Temos uma variedade de opções de sons, mas você pode selecionar sons ou musicas que estão no seu dispositivo.",
                ),
                _TextAndSubtitle(
                  index: 2,
                  subtitle: "Definindo o Tempo de Meditação:",
                  text:
                      "Selecione o tempo que você deseja meditar. Se é iniciante na meditação, comece com 5 minutos e vai subindo o tempo até chegar o tempo ideal pra você.",
                ),
                _TextAndSubtitle(
                  index: 3,
                  subtitle: "Iniciando a Meditação:",
                  text:
                      'Com as suas preferências definidas, é hora de começar. Toque no botão "Iniciar". Durante a meditação, seu celular vibrará a cada 4 segundos. Essas vibrações são um guia para controlar a sua respiração. À medida que o celular vibra, você pode sincronizar a sua inspiração e expiração com esses pulsos, o que ajuda a criar uma experiência de meditação mais profunda e relaxante.',
                )
              ],
            ),
          ),
          PrimaryButton(
            title: "Voltar",
            centralizeTitle: true,
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.background),
            padding: const EdgeInsets.all(10),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _TextAndSubtitle extends StatelessWidget {
  const _TextAndSubtitle(
      {super.key, this.index, this.subtitle, required this.text});
  final int? index;
  final String? subtitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                index != null ? "$index. " : "",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                subtitle ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
