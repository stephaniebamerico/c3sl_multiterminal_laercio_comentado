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
2. Baixe este repositório (`git clone http://gitlab.sme-mogidascruzes.sp.gov.br/pte/proinfo-ubuntu-config.git`).
3. Execute o script `criar-usuarios-alunos.sh`.
4. Execuhe o script `reconfigurar-rede.sh`.
5. Execute o script `configurar-multiterminal.sh`.