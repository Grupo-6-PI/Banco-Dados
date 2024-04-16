CREATE DATABASE IF NOT EXISTS TFG;

CREATE TABLE IF NOT EXISTS `Cidade` (
  `id_cidade` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  PRIMARY KEY (`id_cidade`)
);

CREATE TABLE IF NOT EXISTS `Bairro` (
  `id_bairro` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `fk_cidade` INT NOT NULL,
  PRIMARY KEY (`id_bairro`),
  CONSTRAINT `fk_Bairro_Cidade1`
    FOREIGN KEY (`fk_cidade`)
    REFERENCES `Cidade` (`id_cidade`)
);

CREATE TABLE IF NOT EXISTS `TipoSituacao` (
  `id_tipo_situacao` INT NOT NULL,
  `tipo` VARCHAR(60) NULL,
  PRIMARY KEY (`id_tipo_situacao`)
);

CREATE TABLE IF NOT EXISTS `Situacao` (
  `id_situacao` INT NOT NULL,
  `situacao` VARCHAR(100) NULL,
  `fk_tipo_situacao` INT NOT NULL,
  PRIMARY KEY (`id_situacao`),
  CONSTRAINT `fk_Situacao_TipoSituacao1`
    FOREIGN KEY (`fk_tipo_situacao`)
    REFERENCES `TipoSituacao` (`id_tipo_situacao`)
);

CREATE TABLE IF NOT EXISTS `Endereco` (
  `id_endereco` INT NOT NULL,
  `logradouro` VARCHAR(100) NULL,
  `numero` INT NULL,
  `cep` CHAR(8) NULL,
  `fk_bairro` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`fk_bairro`)
    REFERENCES `Bairro` (`id_bairro`),
  CONSTRAINT `fk_Endereco_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `QuantidadePessoas` (
  `id_quantidade_pessoas` INT NOT NULL,
  `minimo` INT NULL,
  `maximo` INT NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_quantidade_pessoas`),
  CONSTRAINT `fk_QuantidadePessoas_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `Deficiencia` (
  `id_deficiencia` INT NOT NULL,
  `nome_deficiencia` VARCHAR(150) NULL,
  PRIMARY KEY (`id_deficiencia`)
);

CREATE TABLE IF NOT EXISTS `PessoaDeficiencia` (
  `id_pessoa_deficiencia` INT NOT NULL,
  `verificacao` TINYINT NULL,
  `fk_deficiencia` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_pessoa_deficiencia`),
  CONSTRAINT `fk_PessoaDeficiencia_Deficiencia1`
    FOREIGN KEY (`fk_deficiencia`)
    REFERENCES `Deficiencia` (`id_deficiencia`)
);

CREATE TABLE IF NOT EXISTS `UrgenciaFamiliar` (
  `id_urgencia_familiar` INT NOT NULL,
  `descricao` VARCHAR(150) NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_urgencia_familiar`),
  CONSTRAINT `fk_UrgenciaFamiliar_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `RendaFamiliar` (
  `id_renda_familiar` INT NOT NULL,
  `renda` DOUBLE NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_renda_familiar`),
  CONSTRAINT `fk_RendaFamiliar_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `Familia` (
  `id_familia` INT NOT NULL,
  `fk_quantidade_pessoas` INT NOT NULL,
  `fk_pessoa_deficiencia` INT NOT NULL,
  `fk_urgencia_familiar` INT NOT NULL,
  `fk_renda_familiar` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_familia`),
  CONSTRAINT `fk_Familia_QuantidadePessoas1`
    FOREIGN KEY (`fk_quantidade_pessoas`)
    REFERENCES `QuantidadePessoas` (`id_quantidade_pessoas`),
  CONSTRAINT `fk_Familia_PessoaDeficiencia1`
    FOREIGN KEY (`fk_pessoa_deficiencia`)
    REFERENCES `PessoaDeficiencia` (`id_pessoa_deficiencia`),
  CONSTRAINT `fk_Familia_UrgenciaFamiliar1`
    FOREIGN KEY (`fk_urgencia_familiar`)
    REFERENCES `UrgenciaFamiliar` (`id_urgencia_familiar`),
  CONSTRAINT `fk_Familia_RendaFamiliar1`
    FOREIGN KEY (`fk_renda_familiar`)
    REFERENCES `RendaFamiliar` (`id_renda_familiar`),
  CONSTRAINT `fk_Familia_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `TipoIdentificador` (
  `id_tipo_identificador` INT NOT NULL,
  `tipo` VARCHAR(50) NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_tipo_identificador`),
  CONSTRAINT `fk_TipoIdentificador_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `Identificador` (
  `id_identificador` INT NOT NULL,
  `numeracao` VARCHAR(40) NULL,
  `fk_tipo_identificador` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_identificador`),
  CONSTRAINT `fk_Identificador_TipoIdentificador1`
    FOREIGN KEY (`fk_tipo_identificador`)
    REFERENCES `TipoIdentificador` (`id_tipo_identificador`),
  CONSTRAINT `fk_Identificador_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `Contato` (
  `id_contato` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_contato`)
);

CREATE TABLE IF NOT EXISTS `InformacoesAdicionais` (
  `id_informacoes_adicionais` INT NOT NULL,
  `cpf` CHAR(11) NULL,
  `data_nascimento` DATETIME NULL,
  `fk_endereco` INT NOT NULL,
  `fk_familia` INT NOT NULL,
  `fk_identificador` INT NOT NULL,
  `fk_contato` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_informacoes_adicionais`),
  CONSTRAINT `fk_InformacoesAdicionais_Endereco1`
    FOREIGN KEY (`fk_endereco`)
    REFERENCES `Endereco` (`id_endereco`),
  CONSTRAINT `fk_InformacoesAdicionais_Familia1`
    FOREIGN KEY (`fk_familia`)
    REFERENCES `Familia` (`id_familia`),
  CONSTRAINT `fk_InformacoesAdicionais_Identificador1`
    FOREIGN KEY (`fk_identificador`)
    REFERENCES `Identificador` (`id_identificador`),
  CONSTRAINT `fk_InformacoesAdicionais_Contato1`
    FOREIGN KEY (`fk_contato`)
    REFERENCES `Contato` (`id_contato`),
  CONSTRAINT `fk_InformacoesAdicionais_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `NivelAcesso` (
  `id_nivel_acesso` INT NOT NULL,
  `apelido` VARCHAR(60) NULL,
  PRIMARY KEY (`id_nivel_acesso`)
);

CREATE TABLE IF NOT EXISTS `QuantidadeCriancas` (
  `id_quantidade_criancas` INT NOT NULL,
  `quantidade` INT NULL,
  `fk_familia` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_quantidade_criancas`),
  CONSTRAINT `fk_QuantidadeCriancas_Familia1`
    FOREIGN KEY (`fk_familia`)
    REFERENCES `Familia` (`id_familia`),
  CONSTRAINT `fk_QuantidadeCriancas_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

CREATE TABLE IF NOT EXISTS `TamanhoRoupa` (
  `id_tamanho_roupa` INT NOT NULL,
  `tamanho` VARCHAR(10) NULL,
  PRIMARY KEY (`id_tamanho_roupa`)
);

CREATE TABLE IF NOT EXISTS `TamanhoCalcado` (
  `id_tamanho_calcado` INT NOT NULL,
  `tamanho` VARCHAR(10) NULL,
  PRIMARY KEY (`id_tamanho_calcado`)
);

CREATE TABLE IF NOT EXISTS `Crianca` (
  `id_Crianca` INT NOT NULL,
  `genero` VARCHAR(60) NULL,
  `data_nascimento` DATETIME NULL,
  `fk_quantidade_criancas` INT NOT NULL,
  `fk_tamanho_roupa` INT NOT NULL,
  `fk_tamanho_calcado` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_Crianca`),
  CONSTRAINT `fk_Familia_has_QuantidadeCriancas_QuantidadeCriancas1`
    FOREIGN KEY (`fk_quantidade_criancas`)
    REFERENCES `QuantidadeCriancas` (`id_quantidade_criancas`),
  CONSTRAINT `fk_Crianca_TamanhoRoupa1`
    FOREIGN KEY (`fk_tamanho_roupa`)
    REFERENCES `TamanhoRoupa` (`id_tamanho_roupa`),
  CONSTRAINT `fk_Crianca_TamanhoCalcado1`
    FOREIGN KEY (`fk_tamanho_calcado`)
    REFERENCES `TamanhoCalcado` (`id_tamanho_calcado`),
  CONSTRAINT `fk_Crianca_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `Situacao` (`id_situacao`)
);

-- -----------------------------------------------------
-- Table `mydb`.`TipoDoacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoDoacao` (
  `id_tipo_doacao` INT NOT NULL,
  `doacao` VARCHAR(100) NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_tipo_doacao`),
  INDEX `fk_TipoDoacao_Situacao1_idx` (`fk_situacao` ASC) VISIBLE,
  CONSTRAINT `fk_TipoDoacao_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `mydb`.`Situacao` (`id_situacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DoacaoPedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DoacaoPedida` (
  `idDoacaoPedida` INT NOT NULL,
  `fk_TipoDoacao` INT NOT NULL,
  `fk_Familia` INT NOT NULL,
  `Situacao_idSituacao` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`idDoacaoPedida`),
  INDEX `fk_TipoDoacao_has_Familia_Familia1_idx` (`fk_Familia` ASC) VISIBLE,
  INDEX `fk_TipoDoacao_has_Familia_TipoDoacao1_idx` (`fk_TipoDoacao` ASC) VISIBLE,
  INDEX `fk_DoacaoPedida_Situacao1_idx` (`Situacao_idSituacao` ASC) VISIBLE,
  CONSTRAINT `fk_TipoDoacao_has_Familia_TipoDoacao1`
    FOREIGN KEY (`fk_TipoDoacao`)
    REFERENCES `mydb`.`TipoDoacao` (`id_tipo_doacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TipoDoacao_has_Familia_Familia1`
    FOREIGN KEY (`fk_Familia`)
    REFERENCES `mydb`.`Familia` (`id_familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DoacaoPedida_Situacao1`
    FOREIGN KEY (`Situacao_idSituacao`)
    REFERENCES `mydb`.`Situacao` (`id_situacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoContato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoContato` (
  `id_tipo_contato` INT NOT NULL,
  `tipo_contato` VARCHAR(30) NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_tipo_contato`),
  INDEX `fk_TipoContato_Situacao1_idx` (`fk_situacao` ASC) VISIBLE,
  CONSTRAINT `fk_TipoContato_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `mydb`.`Situacao` (`id_situacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InformacoesContato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InformacoesContato` (
  `id_informacoes_contato` INT NOT NULL,
  `contato` VARCHAR(150) NULL,
  `fk_tipo_contato` INT NOT NULL,
  `fk_contato` INT NOT NULL,
  `fk_situacao` INT NOT NULL,
  PRIMARY KEY (`id_informacoes_contato`),
  INDEX `fk_InformacoesContato_TipoContato1_idx` (`fk_tipo_contato` ASC) VISIBLE,
  INDEX `fk_InformacoesContato_Contato1_idx` (`fk_contato` ASC) VISIBLE,
  INDEX `fk_InformacoesContato_Situacao1_idx` (`fk_situacao` ASC) VISIBLE,
  CONSTRAINT `fk_InformacoesContato_TipoContato1`
    FOREIGN KEY (`fk_tipo_contato`)
    REFERENCES `mydb`.`TipoContato` (`id_tipo_contato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InformacoesContato_Contato1`
    FOREIGN KEY (`fk_contato`)
    REFERENCES `mydb`.`Contato` (`id_contato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InformacoesContato_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `mydb`.`Situacao` (`id_situacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Permissao` (
  `id_permissao` INT NOT NULL,
  `permissao` VARCHAR(30) NULL,
  PRIMARY KEY (`id_permissao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GrupoPermissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GrupoPermissao` (
  `id_grupo_permissao` INT NOT NULL,
  `fk_permissao` INT NOT NULL,
  `fk_nivel_acesso` INT NOT NULL,
  PRIMARY KEY (`id_grupo_permissao`),
  INDEX `fk_GrupoPermissao_Permissao1_idx` (`fk_permissao` ASC) VISIBLE,
  INDEX `fk_GrupoPermissao_NivelAcesso1_idx` (`fk_nivel_acesso` ASC) VISIBLE,
  CONSTRAINT `fk_GrupoPermissao_Permissao1`
    FOREIGN KEY (`fk_permissao`)
    REFERENCES `mydb`.`Permissao` (`id_permissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GrupoPermissao_NivelAcesso1`
    FOREIGN KEY (`fk_nivel_acesso`)
    REFERENCES `mydb`.`NivelAcesso` (`id_nivel_acesso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoAtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoAtividade` (
  `id_tipo_atividade` INT NOT NULL,
  `tipo` VARCHAR(100) NULL,
  PRIMARY KEY (`id_tipo_atividade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Atividade` (
  `id_atividade` INT NOT NULL,
  `comeco` DATETIME NULL,
  `final` DATETIME NULL,
  `descricao` VARCHAR(150) NULL,
  `fk_tipo_atividade` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_atividade`),
  INDEX `fk_Atividade_TipoAtividade1_idx` (`fk_tipo_atividade` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_TipoAtividade1`
    FOREIGN KEY (`fk_tipo_atividade`)
    REFERENCES `mydb`.`TipoAtividade` (`id_tipo_atividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EscalaVoluntario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EscalaVoluntario` (
  `id_escala_voluntario` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  `fk_atividade` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_escala_voluntario`),
  INDEX `fk_EscalaVoluntario_Usuario1_idx` (`fk_usuario` ASC) VISIBLE,
  INDEX `fk_EscalaVoluntario_Atividade1_idx` (`fk_atividade` ASC) VISIBLE,
  CONSTRAINT `fk_EscalaVoluntario_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EscalaVoluntario_Atividade1`
    FOREIGN KEY (`fk_atividade`)
    REFERENCES `mydb`.`Atividade` (`id_atividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NIvelUrgencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NIvelUrgencia` (
  `id_nIvel_urgencia` INT NOT NULL,
  `nivel` VARCHAR(60) NULL,
  PRIMARY KEY (`id_nIvel_urgencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AssuntoRequisicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AssuntoRequisicao` (
  `id_assunto_requisicao` INT NOT NULL,
  `assunto` VARCHAR(150) NULL,
  PRIMARY KEY (`id_assunto_requisicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Requisicoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Requisicoes` (
  `id_eequisicao` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  `fk_nIvel_urgencia` INT NOT NULL,
  `fk_assunto_requisicao` INT NOT NULL,
  `data_abertura` DATETIME NULL,
  `data_fechamento` DATETIME NULL,
  `fk_situacao` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_eequisicao`),
  INDEX `fk_Requisicoes_Usuario1_idx` (`fk_usuario` ASC) VISIBLE,
  INDEX `fk_Requisicoes_NIvelUrgencia1_idx` (`fk_nIvel_urgencia` ASC) VISIBLE,
  INDEX `fk_Requisicoes_AssuntoRequisicao1_idx` (`fk_assunto_requisicao` ASC) VISIBLE,
  INDEX `fk_Requisicoes_Situacao1_idx` (`fk_situacao` ASC) VISIBLE,
  CONSTRAINT `fk_Requisicoes_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisicoes_NIvelUrgencia1`
    FOREIGN KEY (`fk_nIvel_urgencia`)
    REFERENCES `mydb`.`NIvelUrgencia` (`id_nIvel_urgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisicoes_AssuntoRequisicao1`
    FOREIGN KEY (`fk_assunto_requisicao`)
    REFERENCES `mydb`.`AssuntoRequisicao` (`id_assunto_requisicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Requisicoes_Situacao1`
    FOREIGN KEY (`fk_situacao`)
    REFERENCES `mydb`.`Situacao` (`id_situacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ano` (
  `id_ano` INT NOT NULL,
  `ano` VARCHAR(60) NULL,
  PRIMARY KEY (`id_ano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mes` (
  `id_mes` INT NOT NULL,
  `mes` VARCHAR(60) NULL,
  PRIMARY KEY (`id_mes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dia` (
  `id_dia` INT NOT NULL,
  `dia` INT NULL,
  PRIMARY KEY (`id_dia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DiaSemana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DiaSemana` (
  `id_dia_semana` INT NOT NULL,
  `dia_semana` VARCHAR(60) NULL,
  PRIMARY KEY (`id_dia_semana`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Calendario` (
  `id_calendario` INT NOT NULL,
  `fk_dia` INT NOT NULL,
  `fk_ano` INT NOT NULL,
  `fk_mes` INT NOT NULL,
  `fk_dia_semana` INT NOT NULL,
  PRIMARY KEY (`id_calendario`),
  INDEX `fk_Calendario_Dia1_idx` (`fk_dia` ASC) VISIBLE,
  INDEX `fk_Calendario_Ano1_idx` (`fk_ano` ASC) VISIBLE,
  INDEX `fk_Calendario_Mes1_idx` (`fk_mes` ASC) VISIBLE,
  INDEX `fk_Calendario_DiaSemana1_idx` (`fk_dia_semana` ASC) VISIBLE,
  CONSTRAINT `fk_Calendario_Dia1`
    FOREIGN KEY (`fk_dia`)
    REFERENCES `mydb`.`Dia` (`id_dia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calendario_Ano1`
    FOREIGN KEY (`fk_ano`)
    REFERENCES `mydb`.`Ano` (`id_ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calendario_Mes1`
    FOREIGN KEY (`fk_mes`)
    REFERENCES `mydb`.`Mes` (`id_mes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calendario_DiaSemana1`
    FOREIGN KEY (`fk_dia_semana`)
    REFERENCES `mydb`.`DiaSemana` (`id_dia_semana`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReservaAtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ReservaAtividade` (
  `id_reserva_atividade` INT NOT NULL,
  `fk_calendario` INT NOT NULL,
  `fk_atividade` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_reserva_atividade`),
  INDEX `fk_ReservaAtividade_Calendario1_idx` (`fk_calendario` ASC) VISIBLE,
  INDEX `fk_ReservaAtividade_Atividade1_idx` (`fk_atividade` ASC) VISIBLE,
  CONSTRAINT `fk_ReservaAtividade_Calendario1`
    FOREIGN KEY (`fk_calendario`)
    REFERENCES `mydb`.`Calendario` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservaAtividade_Atividade1`
    FOREIGN KEY (`fk_atividade`)
    REFERENCES `mydb`.`Atividade` (`id_atividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoTransacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoTransacao` (
  `id_tipo_transacao` INT NOT NULL,
  `tipo` VARCHAR(60) NULL,
  PRIMARY KEY (`id_tipo_transacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CategoriaVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriaVenda` (
  `id_categoria_venda` INT NOT NULL,
  `categoria` VARCHAR(100) NULL,
  PRIMARY KEY (`id_categoria_venda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transacao` (
  `id_transacao` INT NOT NULL,
  `valor` DOUBLE NULL,
  `fk_tipo_transacao` INT NOT NULL,
  `fk_categoria_venda` INT NOT NULL,
  `data_criacao` DATETIME NULL,
  `data_ultima_atualizacao` DATETIME NULL,
  `email_modificador` VARCHAR(150) NULL,
  PRIMARY KEY (`id_transacao`),
  INDEX `fk_Transacao_TipoTransacao1_idx` (`fk_tipo_transacao` ASC) VISIBLE,
  INDEX `fk_Transacao_CategoriaVenda1_idx` (`fk_categoria_venda` ASC) VISIBLE,
  CONSTRAINT `fk_Transacao_TipoTransacao1`
    FOREIGN KEY (`fk_tipo_transacao`)
    REFERENCES `mydb`.`TipoTransacao` (`id_tipo_transacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacao_CategoriaVenda1`
    FOREIGN KEY (`fk_categoria_venda`)
    REFERENCES `mydb`.`CategoriaVenda` (`id_categoria_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RelatorioFinanceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RelatorioFinanceiro` (
  `id_relatorio_financeiro` INT NOT NULL,
  `fk_calendario` INT NOT NULL,
  `fk_transacao` INT NOT NULL,
  PRIMARY KEY (`id_relatorio_financeiro`),
  INDEX `fk_RelatorioFinanceiro_Calendario1_idx` (`fk_calendario` ASC) VISIBLE,
  INDEX `fk_RelatorioFinanceiro_Transacao1_idx` (`fk_transacao` ASC) VISIBLE,
  CONSTRAINT `fk_RelatorioFinanceiro_Calendario1`
    FOREIGN KEY (`fk_calendario`)
    REFERENCES `mydb`.`Calendario` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RelatorioFinanceiro_Transacao1`
    FOREIGN KEY (`fk_transacao`)
    REFERENCES `mydb`.`Transacao` (`id_transacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conta` (
  `id_conta` INT NOT NULL,
  `apelido` VARCHAR(100) NULL,
  PRIMARY KEY (`id_conta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Extrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Extrato` (
  `id_extrato` INT NOT NULL,
  `saldo` VARCHAR(45) NULL,
  `ultima_atualizacao` DATETIME NULL,
  `fk_conta` INT NOT NULL,
  PRIMARY KEY (`id_extrato`),
  INDEX `fk_Extrato_Conta1_idx` (`fk_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Extrato_Conta1`
    FOREIGN KEY (`fk_conta`)
    REFERENCES `mydb`.`Conta` (`id_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

