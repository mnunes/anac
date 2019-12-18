\docType{data}
\name{anac2003}
\title{Base histórica de dados da ANAC}
\format{ Tibble com 12 colunas. Cada linha equivale a um voo regular de empresa aérea. Estão disponíveis dados entre 2001 e 2019 nos outros arquivos deste pacote.


\describe{

\item{\code{ICAOEmpresaAerea}}{Código designador da empresa no padrão da ICAO, com três letras.}

\item{\code{NumeroVoo}}{Numeração do voo, com até 4 caracteres numéricos.}

\item{\code{CodigoAutorizacaoDI}}{Caractere utilizado para identificar o tipo de autorização para cada etapa de voo conforme IAC 1504, podendo ser 0 (voo regular), 1 (voo extra com HOTRAN), 2 (voo extra sem HOTRAN), 3 (voo de retorno), 4 (inclusão de etapa em um voo previsto em HOTRAN), 5 (voo cargueiro), 6 (voo de serviço), 7 (voo de fretamento), 9 (voo charter), A (voo de instrução) ou B (voo de experiência).}

\item{\code{CodigoTipoLinha}}{Identifica o tipo de operação realizada, conforme IAC 1504, sendo N (nacional), I (internacional), R (regional), H (sub-regional), E (especial), C (cargueiro), G (cargueiro internacional) e L (rede postal).}

\item{\code{ICAOAerodromoOrigem}}{Código ICAO do aeroporto de origem.}

\item{\code{ICAOAerodromoDestino}}{Código ICAO do aeroporto de destino.}

\item{\code{PartidaPrevista}}{Data e horário da partida prevista em horário de Brasília.}

\item{\code{PartidaReal}}{Data e horário da partida realizada informada pela empresa aérea, em horário de Brasília.}

\item{\code{ChegadaPrevista}}{Data e horário da chegada prevista em horário de Brasília.}

\item{\code{ChegadaReal}}{Data e horário da chegada realizada, informada pela empresa aérea, em horário de Brasília.}

\item{\code{SituacaoVoo}}{Campo informando se o voo foi realizado ou cancelado.}

\item{\code{CodigoJustificativa}}{Identifica o motivo do atraso, cancelamento e demais alterações em relação ao voo planejado, conforme IAC 1504.}

}

}

\usage{
data(anac2003)
}

\description{
Dados a respeito de voos comerciais realizados no Brasil e disponibilizados no site da ANAC. O Voo Regular Ativo – VRA é uma base de dados composta por informações de voos de empresas de transporte aéreo regular que apresenta alterações de voos (atrasos, antecipações e cancelamentos), horários em que os voos ocorreram e as justificativas apresentadas pelas empresas aéreas para tais alterações. Por meio desta base de dados, pode ser obtida os índices de pontualidade, regularidade e de desempenho operacional além dos percentuais de atrasos e cancelamentos. O mês publicado se refere às etapas cujas decolagens eram previstas para o mês em questão ou cujas decolagens, em caso de etapa não prevista, foram realizadas no mês em questão.
}

\examples{
library(tidyverse)
library(anac)
data(anac2003)
# aeroportos de onde mais partiram voos
anac2003 %>%
  group_by(ICAOAerodromoOrigem) %>%
  summarise(Total = n()) %>%
  arrange(desc(Total))
}
\references{
https://www.anac.gov.br/dadosabertos/areas-de-atuacao/voos-e-operacoes-aereas/voo-regular-ativo-vra/62-voo-regular-ativo-vra
}
\keyword{datasets}
