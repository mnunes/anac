# Descrição

Este é um pacote do R com os dados dos voos comerciais realizados em aeroportos brasileiros entre 2001 e 2019. As informações foram baixadas a partir do [site da ANAC](https://sas.anac.gov.br/sas/vraarquivos/).

# Instalação

Basta rodar

    devtools::install_github("mnunes/anac")
    
desde que o pacote `devtools` esteja instalado em seu R. Se o comando acima não funcionar, instale o pacote `devtools` através do comando

    install.packages("devtools")
    
Após a instalação do pacote `devtools`, caso esteja usando Windows, instale o programa [RTools](https://cran.r-project.org/bin/windows/Rtools/) mais atual.

Por fim, rode `devtools::install_github("mnunes/anac")` novamente e o pacote será instalado em seu computador.

Neste ponto, o pacote estará instalado com um data frame para cada ano entre 2009 e 2019. Para verificar se o pacote foi instalado corretamente, rode os comandos

    library(tidyverse)
    library(anac)
    data(anac2019)
    # aeroportos de onde mais partiram voos
    anac2019 %>%
      group_by(ICAOAerodromoOrigem) %>%
      summarise(Total = n()) %>%
      arrange(desc(Total))

e verifique se algum _output_ é produzido. Neste caso, a soma total de partidas por aeroporto brasileiro durante 2019.

# Juntando os data frames

Case seja do seu interesse realizar uma análise em mais de um ano, será necessário juntar os data frames independentes em apenas um. Para isso, rode os comandos abaixo:

    dados <- data(package = "anac")
    
    anac <- get(data(list = dados$results[,3][1],
                package = "anac"))
    
    for (j in dados$results[,3][-1]){
      print(paste("Processando ", j, ". Aguarde.", sep = ""))
      anac <- rbind(anac,
                    get(data(list = j,
                             package = "anac")))
    }

Isso criará o objeto `camara`, com todos os mais de 3 milhões de observações armazenadas neste conjunto de dados. 

