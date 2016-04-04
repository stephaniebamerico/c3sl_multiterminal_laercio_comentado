# Configuração do Ubuntu 16.04 LTS para computadores multiterminais do ProInfo

## Pregões contemplados por esta solução

### ProInfo Urbano

* 83/2008
* 72/2010

### ProInfo Rural

* 68/2009 (2º lote)

### Observações

* É possível que esta solução se aplique também aos computadores do pregão 23/2012, mas nós não tivemos ainda a oportunidade de testá-la, pois não temos equipamentos deste pregão em nenhuma escola municipal de Mogi das Cruzes.
* Esta solução pode aplicar-se a outros progões do ProInfo Rural, **desde que a placa de vídeo original ATI Rage XL Quad seja substituída por um par de placas TN-502 Dual ou uma placa TN-502 Quad**.

## Resumo do roteiro

1. Instale o seu sabor preferido do Ubuntu 16.04 LTS.
2. Identifique as portas USB traseiras de cada um dos seus computadores seguindo [este roteiro](#), reservando as portas USB 1 e 2 para o segundo e terceiro terminais, respectivamente.
  * Nos computadores do ProInfo Rural, as portas USB 3 e 4 são reservadas para o terceiro e quarto terminais, respectivamente. Nos do ProInfo Urbano, por sua vez, estas podem ser livremente utilizadas no primeiro terminal, assim como as portas USB frontais.
3. Baixe este repositório (`git clone http://gitlab.sme-mogidascruzes.sp.gov.br/pte/proinfo-ubuntu-config.git`).
4. Execute o script `criar-usuarios-alunos.sh`.
5. Execuhe o script `reconfigurar-rede.sh`.
6. Execute o script `configurar-multiterminal.sh`.

Caso algum de seus computadores seja afetado pelo [bug da tela listrada](#), os seguintes passos adicionais são necessários para utilizá-lo em sua capacidade máxima (3 terminais no ProInfo Urbano e 4~5 terminais no ProInfo Rural):

1. Instale o Linux Educacional 5.0 a partir da ISO disponível na [página de suporte do Paraná Digital](http://www.prdsuporte.seed.pr.gov.br/uploads/Linux-Educacional_5.0.2-1-escola-le5-stable-i386-20150817.iso).
  * Reserve 8 GB no final do disco rígido para instalar o LE 5.0.
  * **Não instale o gerenciador de boot do LE 5.0 na MBR do disco rígido!** Instale-o na raiz da própria partição em que o LE 5.0 está sendo instalado.
2. Configure o multiterminal no LE 5.0 seguindo [este roteiro](#). **Não é necessário completar a associação de teclados/mouses, tampouco ativar a licença do Userful Multiseat**.
3. Reinicie o computador de volta para o Ubuntu 16.04 LTS e execute o script `contornar-bug-tela-listrada.sh` que consta desta solução.
4. Desligue e ligue novamente o computador.