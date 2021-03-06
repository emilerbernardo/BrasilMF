#Fundos Estruturados: Informacao Cadastral
dados_cvm_inf_cadastral <- function(tipo) {
  validos <- c("fie","fie_adiministrador","fie_auditor","fie_gestor","auditor_pj","auditor_pf","fi","participante_intermediario_empresa",
               "participante_intermediario_responsavel","agente_autonomo_pj","agente_autonomo_pf", "cias_incentivadas", "cias_estrangeiras", "cias_abertas",
               "representante_inv_n_residente_pj", "representante_inv_n_residente_pf", "consultor_pj", "consultor_pf", "consultor_diretor", "consultor_socios",
               "administrador_fii", "administrador_carteira_pj", "administrador_carteira_pf", "administrador_carteira_diretor", "administrador_carteira_socios",
               "administrador_carteira_responsaveis")
  if (tipo %in% validos) {
    switch (tipo,
            "fie" = {
              url <- 'http://dados.cvm.gov.br/dados/FIE/CAD/DADOS/cad_fie.zip'
              destfile <- "cad_fie.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_fie <- read.csv("cad_fie.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_fie.csv","cad_fie_admin.csv","cad_fie_gestor.csv","cad_fie_auditor.csv","cad_fie.zip")
              return(cad_fie)
            },
            "fie_adiministrador" = {
              url <- 'http://dados.cvm.gov.br/dados/FIE/CAD/DADOS/cad_fie.zip'
              destfile <- "cad_fie.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_fie_admin <- read.csv("cad_fie_admin.csv", sep = ";", stringsAsFactors = FALSE)
              file.remove("cad_fie.csv","cad_fie_admin.csv","cad_fie_gestor.csv","cad_fie_auditor.csv","cad_fie.zip")
              return(cad_fie_admin)
            },
            "fie_auditor" = {
              url <- 'http://dados.cvm.gov.br/dados/FIE/CAD/DADOS/cad_fie.zip'
              destfile <- "cad_fie.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_fie_auditor <- read.csv("cad_fie_auditor.csv", sep = ";", stringsAsFactors = FALSE)
              file.remove("cad_fie.csv","cad_fie_admin.csv","cad_fie_gestor.csv","cad_fie_auditor.csv","cad_fie.zip")
              return(cad_fie_auditor)
            },
            "fie_gestor" = {
              url <- 'http://dados.cvm.gov.br/dados/FIE/CAD/DADOS/cad_fie.zip'
              destfile <- "cad_fie.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_fie_gestor <- read.csv("cad_fie_gestor.csv", sep = ";", stringsAsFactors = FALSE)
              file.remove("cad_fie.csv","cad_fie_admin.csv","cad_fie_gestor.csv","cad_fie_auditor.csv","cad_fie.zip")
              return(cad_fie_gestor)
            },
            "auditor_pj" = {
              url <- 'http://dados.cvm.gov.br/dados/AUDITOR/CAD/DADOS/cad_auditor.zip'
              destfile <- "cad_auditor.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_auditor_pj <- read.csv("cad_auditor_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_auditor_pf.csv","cad_auditor_pj.csv","cad_auditor.zip")
              return(cad_auditor_pj)
            },
            "auditor_pf" = {
              url <- 'http://dados.cvm.gov.br/dados/AUDITOR/CAD/DADOS/cad_auditor.zip'
              destfile <- "cad_auditor.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_auditor_pf <- read.csv("cad_auditor_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_auditor_pf.csv","cad_auditor_pj.csv","cad_auditor.zip")
              return(cad_auditor_pf)
            },
            "fi" = {
              data = Sys.Date()-1
              cal <- create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))
              data <- bizseq(data-5,data,cal)
              data <- max(data)
              data <- format(as.Date(data,"1970-01-01"), "%Y%m%d")
              url <- paste0("http://dados.cvm.gov.br/dados/FI/CAD/DADOS/inf_cadastral_fi_",data,".csv")
              fi <- read.csv(url, sep = ";")
              return(fi)
            },
            "participante_intermediario_empresa" = {
              url <- 'http://dados.cvm.gov.br/dados/INTERMED/CAD/DADOS/cad_intermed.zip'
              destfile <- "cad_intermed.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_intermed <- read.csv("cad_intermed.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_intermed.csv","cad_intermed_resp.csv","cad_intermed.zip")
              return(cad_intermed)
            },
            "participante_intermediario_responsavel" = {
              url <- 'http://dados.cvm.gov.br/dados/INTERMED/CAD/DADOS/cad_intermed.zip'
              destfile <- "cad_intermed.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_intermed_resp <- read.csv("cad_intermed_resp.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_intermed.csv","cad_intermed_resp.csv","cad_intermed.zip")
              return(cad_intermed_resp)
            },
            "agente_autonomo_pj" = {
              url <- 'http://dados.cvm.gov.br/dados/AGENTE_AUTON/CAD/DADOS/cad_agente_auton.zip'
              destfile <- "cad_agente_auton.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_agente_auton_pj <- read.csv("cad_agente_auton_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_agente_auton_pj.csv","cad_agente_auton_pf.csv","cad_agente_auton.zip")
              return(cad_agente_auton_pj)
            },
            "agente_autonomo_pf" = {
              url <- 'http://dados.cvm.gov.br/dados/AGENTE_AUTON/CAD/DADOS/cad_agente_auton.zip'
              destfile <- "cad_agente_auton.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_agente_auton_pf <- read.csv("cad_agente_auton_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_agente_auton_pj.csv","cad_agente_auton_pf.csv","cad_agente_auton.zip")
              return(cad_agente_auton_pf)
            },
            "cias_incentivadas" = {
              url <- 'http://dados.cvm.gov.br/dados/CIA_INCENT/CAD/DADOS/cad_cia_incent.csv'
              cad_cia_incet <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
              return(cad_cia_incet)
            },
            "cias_estrangeiras" = {
              url <- 'http://dados.cvm.gov.br/dados/CIA_ESTRANG/CAD/DADOS/cad_cia_estrang.csv'
              cad_cia_estrang <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
              return(cad_cia_estrang)
            },
            "cias_abertas" = {
              url <- 'http://dados.cvm.gov.br/dados/CIA_ABERTA/CAD/DADOS/cad_cia_aberta.csv'
              cad_cia_aberta <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
              return(cad_cia_aberta)
            },
            "representante_inv_n_residente_pj" = {
              url <- 'http://dados.cvm.gov.br/dados/INVNR/CAD/DADOS/cad_invnr_repres.zip'
              destfile <- "cad_invnr_repres.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_invnr_repres_pj <- read.csv("cad_invnr_repres_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_invnr_repres_pj.csv","cad_invnr_repres_pf.csv","cad_invnr_repres.zip")
              return(cad_invnr_repres_pj)
            },
            "representante_inv_n_residente_pf" = {
              url <- 'http://dados.cvm.gov.br/dados/INVNR/CAD/DADOS/cad_invnr_repres.zip'
              destfile <- "cad_invnr_repres.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_invnr_repres_pf <- read.csv("cad_invnr_repres_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_invnr_repres_pf.csv","cad_invnr_repres_pf.csv","cad_invnr_repres.zip")
              return(cad_invnr_repres_pf)
            },
            "consultor_pj" = {
              url <- 'http://dados.cvm.gov.br/dados/CONSULTOR_VLMOB/CAD/DADOS/cad_consultor_vlmob.zip'
              destfile <- "cad_consultor_vlmob.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_consultor_vlmob_pj <- read.csv("cad_consultor_vlmob_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
              return(cad_consultor_vlmob_pj)
            },
            "consultor_pf" = {
              url <- 'http://dados.cvm.gov.br/dados/CONSULTOR_VLMOB/CAD/DADOS/cad_consultor_vlmob.zip'
              destfile <- "cad_consultor_vlmob.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_consultor_vlmob_pf <- read.csv("cad_consultor_vlmob_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
              return(cad_consultor_vlmob_pf)
            },
            "consultor_diretor" = {
              url <- 'http://dados.cvm.gov.br/dados/CONSULTOR_VLMOB/CAD/DADOS/cad_consultor_vlmob.zip'
              destfile <- "cad_consultor_vlmob.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_consultor_vlmob_diretor <- read.csv("cad_consultor_vlmob_diretor.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
              return(cad_consultor_vlmob_diretor)
            },
            "consultor_socios" = {
              url <- 'http://dados.cvm.gov.br/dados/CONSULTOR_VLMOB/CAD/DADOS/cad_consultor_vlmob.zip'
              destfile <- "cad_consultor_vlmob.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_consultor_vlmob_socios <- read.csv("cad_consultor_vlmob_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_consultor_vlmob_pj.csv","cad_consultor_vlmob_pf.csv","cad_consultor_vlmob_diretor.csv","cad_consultor_vlmob_socios.csv","cad_consultor_vlmob.zip")
              return(cad_consultor_vlmob_socios)
            },
            "administrador_fii" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_FII/CAD/DADOS/cad_adm_fii.csv'
              cad_adm_fii <- read.csv(url, sep = ";", quote = "", stringsAsFactors = FALSE)
              return(cad_adm_fii)
            },
            "administrador_carteira_pj" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
              destfile <- "cad_adm_cart.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_adm_cart_pj <- read.csv("cad_adm_cart_pj.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
              return(cad_adm_cart_pj)
            },
            "administrador_carteira_pf" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
              destfile <- "cad_adm_cart.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_adm_cart_pf <- read.csv("cad_adm_cart_pf.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
              return(cad_adm_cart_pf)
            },
            "administrador_carteira_diretor" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
              destfile <- "cad_adm_cart.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_adm_cart_diretor <- read.csv("cad_adm_cart_diretor.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
              return(cad_adm_cart_diretor)
            },
            "administrador_carteira_socios" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
              destfile <- "cad_adm_cart.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_adm_cart_socios <- read.csv("cad_adm_cart_socios.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
              return(cad_adm_cart_socios)
            },
            "administrador_carteira_responsaveis" = {
              url <- 'http://dados.cvm.gov.br/dados/ADM_CART/CAD/DADOS/cad_adm_cart.zip'
              destfile <- "cad_adm_cart.zip"
              download.file(url = url, destfile = destfile, mode ="wb")
              unzip(zipfile = destfile)
              cad_adm_cart_resp <- read.csv("cad_adm_cart_resp.csv", sep = ";", quote = "", stringsAsFactors = FALSE)
              file.remove("cad_adm_cart_pj.csv","cad_adm_cart_pf.csv","cad_adm_cart_diretor.csv","cad_adm_cart_resp.csv","cad_adm_cart_socios.csv","cad_adm_cart.zip")
              return(cad_adm_cart_resp)
            }
    )
  } else {
    warning("Tipos invalidos")
    warning("Validos apenas: fie,fie_adiministrador,fie_auditor,fie_gestor,auditor_pj,auditor_pf,fi,participante_intermediario_empresa,
                 participante_intermediario_responsavel,agente_autonomo_pj,agente_autonomo_pf, cias_incentivadas, cias_estrangeiras, cias_abertas,
                 representante_inv_n_residente_pj, representante_inv_n_residente_pf, consultor_pj, consultor_pf, consultor_diretor, consultor_socios,
                 administrador_fii, administrador_carteira_pj, administrador_carteira_pf, administrador_carteira_diretor, administrador_carteira_socios,
                 administrador_carteira_responsaveis")
  }
}

#DFP Anual
dados_cvm_dfp <- function(documento, ano, tipo) {
  url <- paste0('http://dados.cvm.gov.br/dados/CIA_ABERTA/DOC/DFP/',documento,'/DADOS/',documento,"_cia_aberta_",ano,".zip")

  destfile <- "Temp.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)

  if (tipo == "consolidada") {
    Tabela <- read.csv(paste0(documento,"_cia_aberta_con_",ano,".csv"), sep = ";")
  } else if (tipo == "individual") {
    Tabela <- read.csv(paste0(documento,"_cia_aberta_ind_",ano,".csv"), sep = ";")
  } else {
    warning("Tipo nao identificado")
  }
  if (tipo == "dmpl") {
    Tabela <- Tabela[,c("CNPJ_CIA","DT_REFER","DENOM_CIA","GRUPO_DFP","MOEDA","ESCALA_MOEDA","COLUNA_DF","CD_CONTA","DS_CONTA","ORDEM_EXERC","VL_CONTA")]
    Temp <- Tabela[,c("CNPJ_CIA","DENOM_CIA","GRUPO_DFP","MOEDA","ESCALA_MOEDA","COLUNA_DF","CD_CONTA","DS_CONTA")]
    Temp <- unique(Temp)
  } else {
    Tabela <- Tabela[,c("CNPJ_CIA","DT_REFER","DENOM_CIA","GRUPO_DFP","MOEDA","ESCALA_MOEDA","CD_CONTA","DS_CONTA","ORDEM_EXERC","VL_CONTA")]
    Temp <- Tabela[,c("CNPJ_CIA","DENOM_CIA","GRUPO_DFP","MOEDA","ESCALA_MOEDA","CD_CONTA","DS_CONTA")]
    Temp <- unique(Temp)
  }
  Temp_antes <- unique(merge(Temp, Tabela[Tabela$ORDEM_EXERC == Tabela$ORDEM_EXERC[1],], all.x = TRUE))
  Temp_depois <- unique(merge(Temp, Tabela[Tabela$ORDEM_EXERC == Tabela$ORDEM_EXERC[2],], all.x = TRUE))
  Tabela <- bind_cols(Temp, "ANTERIOR" = Temp_antes[,ncol(Temp_antes)], "ATUAL" = Temp_depois[,ncol(Temp_depois)])

  file.remove(paste0(documento,"_cia_aberta_con_",ano,".csv"), paste0(documento,"_cia_aberta_ind_",ano,".csv"), "Temp.zip")

  return(Tabela)
}

#Fundos estruturados
dados_cvm_fi_estruturado <- function() {
  data <- Sys.Date()
  data_alt <- format(data, "%Y%m")
  url <- paste0('http://dados.cvm.gov.br/dados/FIE/MEDIDAS/DADOS/medidas_mes_fie_',data_alt,'.csv')
  while(url.exists(url) == FALSE) {
    data <- seq(data, length = 2, by = "-1 month")[2]
    data_alt <- format(data, "%Y%m")
    url <- paste0('http://dados.cvm.gov.br/dados/FIE/MEDIDAS/DADOS/medidas_mes_fie_',data_alt,'.csv')
  }
  Tabela <- read.csv(url, sep = ";")
  return(Tabela)
}

#Fundos ICVM555
dados_cvm_fi_icvm555 <- function() {
  data <- Sys.Date()
  data_alt <- format(data, "%Y%m")
  url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/LAMINA/DADOS/lamina_fi_',data_alt,'.zip')
  while(url.exists(url) == FALSE) {
    data <- seq(data, length = 2, by = "-1 month")[2]
    data_alt <- format(data, "%Y%m")
    url <- paste0('http://dados.cvm.gov.br/dados/FI/DOC/LAMINA/DADOS/lamina_fi_',data_alt,'.zip')
  }
  destfile <- "Temp.zip"
  download.file(url = url, destfile = destfile, mode ="wb")
  unzip(zipfile = destfile)
  Lamina_FI <- read.csv(paste0("lamina_fi_",data_alt,".csv"), sep = ";")
  Lamina_FI_Carteira <- read.csv(paste0("lamina_fi_carteira_",data_alt,".csv"), sep = ";")
  Lamina_FI_Rentab_Ano <- read.csv(paste0("lamina_fi_rentab_ano_",data_alt,".csv"), sep = ";")
  Lamina_FI_Rentab_Mes <- read.csv(paste0("lamina_fi_rentab_mes_",data_alt,".csv"), sep = ";")

  Lamina_FI <- Lamina_FI[,c("CNPJ_FUNDO",	"DENOM_SOCIAL",	"DT_COMPTC",	"PUBLICO_ALVO",	"OBJETIVO",	"POLIT_INVEST",	"RISCO_PERDA",	"RISCO_PERDA_NEGATIVO",	"INVEST_INICIAL_MIN",	"INVEST_ADIC",	"RESGATE_MIN",	"VL_MIN_PERMAN",	"QT_DIA_CONVERSAO_COTA_RESGATE",	"TP_TAXA_ADM",	"TAXA_ADM",	"TAXA_ADM_MIN",	"TAXA_ADM_MAX",	"TAXA_ADM_OBS",	"TAXA_ENTR",	"TAXA_PERFM",	"VL_PATRIM_LIQ",	"CLASSE_RISCO_ADMIN",	"INDICE_REFER")]
  Lamina_FI_Carteira <- Lamina_FI_Carteira[,c("CNPJ_FUNDO",	"DENOM_SOCIAL",	"DT_COMPTC",	"TP_ATIVO",	"PR_PL_ATIVO")]
  Lamina_FI_Rentab_Ano <- Lamina_FI_Rentab_Ano[,c("CNPJ_FUNDO",	"DENOM_SOCIAL",	"DT_COMPTC",	"ANO_RENTAB",	"PR_RENTAB_ANO", "PR_VARIACAO_INDICE_REFER_ANO")]
  Lamina_FI_Rentab_Mes <- Lamina_FI_Rentab_Mes[,c("CNPJ_FUNDO",	"DENOM_SOCIAL",	"DT_COMPTC",	"MES_RENTAB",	"PR_RENTAB_MES",	"PR_VARIACAO_INDICE_REFER_MES")]
  Lista <- list(Lamina_FI, Lamina_FI_Carteira, Lamina_FI_Rentab_Ano, Lamina_FI_Rentab_Mes)

  file.remove(paste0("lamina_fi_",data_alt,".csv"), paste0("lamina_fi_carteira_",data_alt,".csv"), paste0("lamina_fi_rentab_ano_",data_alt,".csv"), paste0("lamina_fi_rentab_mes_",data_alt,".csv"), "Temp.zip")

  return(Lista)
}
