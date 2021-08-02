object dmBloqueio: TdmBloqueio
  OldCreateOrder = False
  Height = 341
  Width = 517
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=EGISSQL_GNSF'
      'User_Name=sa'
      'Password=sql@127'
      'Server=186.202.42.2'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object MSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 40
    Top = 96
  end
  object dsConsultaBloqueioLote: TDataSource
    DataSet = stpConsultaBloqueioLote
    Left = 160
    Top = 96
  end
  object stpConsultaBloqueioLote: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_consulta_bloqueio_lote'
    Left = 160
    Top = 40
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@cd_parametro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@cd_lpn_produto'
        DataType = ftString
        ParamType = ptInput
        Size = 70
      end
      item
        Position = 4
        Name = '@dt_inicial'
        DataType = ftTimeStamp
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 5
        Name = '@dt_final'
        DataType = ftTimeStamp
        NumericScale = 3
        ParamType = ptInput
      end
      item
        Position = 6
        Name = '@ic_encerrado'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 7
        Name = '@cd_usuario'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object stpConsultaBloqueioLotecd_controle: TFDAutoIncField
      FieldName = 'cd_controle'
      ReadOnly = True
    end
    object stpConsultaBloqueioLotecd_bloqueio_lote: TIntegerField
      FieldName = 'cd_bloqueio_lote'
      Required = True
    end
    object stpConsultaBloqueioLotecd_item_bloqueio_lote: TIntegerField
      FieldName = 'cd_item_bloqueio_lote'
      Required = True
    end
    object stpConsultaBloqueioLotecd_bloqueio_web: TIntegerField
      FieldName = 'cd_bloqueio_web'
    end
    object stpConsultaBloqueioLotenm_sku: TStringField
      FieldName = 'nm_sku'
      Size = 30
    end
    object stpConsultaBloqueioLotenm_descricao: TStringField
      FieldName = 'nm_descricao'
      Size = 100
    end
    object stpConsultaBloqueioLotenm_categoria: TStringField
      FieldName = 'nm_categoria'
      Size = 10
    end
    object stpConsultaBloqueioLotenm_divisao: TStringField
      FieldName = 'nm_divisao'
      Size = 10
    end
    object stpConsultaBloqueioLotedt_fabricacao: TSQLTimeStampField
      FieldName = 'dt_fabricacao'
    end
    object stpConsultaBloqueioLotedt_vencimento: TSQLTimeStampField
      FieldName = 'dt_vencimento'
    end
    object stpConsultaBloqueioLoteqt_caixa: TIntegerField
      FieldName = 'qt_caixa'
    end
    object stpConsultaBloqueioLoteqt_produto: TIntegerField
      FieldName = 'qt_produto'
    end
    object stpConsultaBloqueioLotenm_cod_lpn: TStringField
      FieldName = 'nm_cod_lpn'
      Size = 60
    end
    object stpConsultaBloqueioLotedt_bloqueio: TSQLTimeStampField
      FieldName = 'dt_bloqueio'
    end
    object stpConsultaBloqueioLotenm_codigo_motivo: TStringField
      FieldName = 'nm_codigo_motivo'
      Size = 10
    end
    object stpConsultaBloqueioLotenm_descricao_motivo: TStringField
      FieldName = 'nm_descricao_motivo'
      Size = 100
    end
    object stpConsultaBloqueioLotenm_solicitante_motivo: TStringField
      FieldName = 'nm_solicitante_motivo'
      Size = 100
    end
    object stpConsultaBloqueioLotecd_usuario_inclusao: TIntegerField
      FieldName = 'cd_usuario_inclusao'
    end
    object stpConsultaBloqueioLotedt_usuario_inclusao: TSQLTimeStampField
      FieldName = 'dt_usuario_inclusao'
    end
    object stpConsultaBloqueioLotecd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object stpConsultaBloqueioLotedt_usuario: TSQLTimeStampField
      FieldName = 'dt_usuario'
    end
    object stpConsultaBloqueioLotenm_laudo_bloqueio: TStringField
      FieldName = 'nm_laudo_bloqueio'
      Size = 30
    end
    object stpConsultaBloqueioLotecd_status_bloqueio: TIntegerField
      FieldName = 'cd_status_bloqueio'
    end
    object stpConsultaBloqueioLotenm_status_bloqueio: TStringField
      FieldName = 'nm_status_bloqueio'
      Required = True
      Size = 24
    end
    object stpConsultaBloqueioLotecd_identificacao: TIntegerField
      FieldName = 'cd_identificacao'
    end
    object stpConsultaBloqueioLotedt_entrada: TSQLTimeStampField
      FieldName = 'dt_entrada'
    end
    object stpConsultaBloqueioLotenm_fantasia_destinatario: TStringField
      FieldName = 'nm_fantasia_destinatario'
      Size = 60
    end
    object stpConsultaBloqueioLotecd_nota_entrada: TIntegerField
      FieldName = 'cd_nota_entrada'
    end
    object stpConsultaBloqueioLotecd_serie_nota_fiscal: TIntegerField
      FieldName = 'cd_serie_nota_fiscal'
    end
    object stpConsultaBloqueioLotecd_item_nota_entrada: TIntegerField
      FieldName = 'cd_item_nota_entrada'
    end
    object stpConsultaBloqueioLotecd_produto: TIntegerField
      FieldName = 'cd_produto'
    end
    object stpConsultaBloqueioLotecd_mascara_produto: TStringField
      FieldName = 'cd_mascara_produto'
      Size = 30
    end
    object stpConsultaBloqueioLotenm_fantasia_produto: TStringField
      FieldName = 'nm_fantasia_produto'
      Size = 30
    end
    object stpConsultaBloqueioLotenm_produto: TStringField
      FieldName = 'nm_produto'
      Size = 120
    end
    object stpConsultaBloqueioLotecd_lote_produto: TIntegerField
      FieldName = 'cd_lote_produto'
    end
    object stpConsultaBloqueioLotenm_ref_lote_produto: TStringField
      FieldName = 'nm_ref_lote_produto'
      Size = 25
    end
    object stpConsultaBloqueioLotecd_identificacao_lote: TStringField
      FieldName = 'cd_identificacao_lote'
      Size = 25
    end
    object stpConsultaBloqueioLotecd_identificacao_pallet: TStringField
      FieldName = 'cd_identificacao_pallet'
      Size = 70
    end
    object stpConsultaBloqueioLotecd_movimento: TIntegerField
      FieldName = 'cd_movimento'
    end
    object stpConsultaBloqueioLotecd_motivo_bloqueio: TIntegerField
      FieldName = 'cd_motivo_bloqueio'
    end
    object stpConsultaBloqueioLotecd_destinacao_bloqueio: TIntegerField
      FieldName = 'cd_destinacao_bloqueio'
    end
    object stpConsultaBloqueioLotecd_tipo_bloqueio: TIntegerField
      FieldName = 'cd_tipo_bloqueio'
    end
    object stpConsultaBloqueioLotedt_bloqueio_movimento: TSQLTimeStampField
      FieldName = 'dt_bloqueio_movimento'
    end
    object stpConsultaBloqueioLotedt_liberacao_movimento: TSQLTimeStampField
      FieldName = 'dt_liberacao_movimento'
    end
    object stpConsultaBloqueioLotedt_confirmacao_bloqueio: TSQLTimeStampField
      FieldName = 'dt_confirmacao_bloqueio'
    end
    object stpConsultaBloqueioLotedt_confirmacao_destinacao: TSQLTimeStampField
      FieldName = 'dt_confirmacao_destinacao'
    end
    object stpConsultaBloqueioLotedt_confirmacao_encerramento: TSQLTimeStampField
      FieldName = 'dt_confirmacao_encerramento'
    end
    object stpConsultaBloqueioLoteic_utilizado: TStringField
      FieldName = 'ic_utilizado'
      FixedChar = True
      Size = 1
    end
  end
  object qryParametroLogistica: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'declare @cd_empresa int'
      'set @cd_empresa = dbo.fn_empresa()'
      'select * from parametro_logistica where cd_empresa = @cd_empresa')
    Left = 96
    Top = 160
    object qryParametroLogisticacd_local_bloqueio_unilever: TIntegerField
      FieldName = 'cd_local_bloqueio_unilever'
    end
  end
  object qryInsereMovimento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'declare @cd_movimento integer'
      'declare @cd_motivo_bloqueio integer'
      'declare @cd_local_bloqueio integer'
      'declare @cd_tipo_bloqueio integer'
      'declare @cd_lote_produto integer'
      'declare @cd_produto integer'
      'declare @nm_ref_lote_produto varchar(40)'
      'declare @qt_movimento float'
      'declare @cd_fase_produto integer'
      'declare @dt_bloqueio_movimento datetime'
      'declare @cd_lpn_produto varchar(70)'
      'declare @dt_hoje datetime'
      ''
      
        'set @dt_hoje = convert( datetime, left( convert( varchar, getdat' +
        'e(), 121 ), 10 ) + '#39' 00:00:00'#39', 121)'
      ''
      '-->> Chave'
      
        'select @cd_movimento = isnull(max(cd_movimento),0)+1 from movime' +
        'nto_bloqueio_lote'
      ''
      'set @cd_motivo_bloqueio    = isnull(:cd_motivo_bloqueio,0)'
      'set @cd_local_bloqueio     = isnull(:cd_local_bloqueio,0)'
      'set @cd_tipo_bloqueio      = isnull(:cd_tipo_bloqueio,0)'
      'set @cd_lote_produto       = isnull(:cd_lote_produto,0)'
      'set @cd_produto '#9'         = isnull(:cd_produto,0)'
      'set @nm_ref_lote_produto   = isnull(:nm_ref_lote_produto,'#39#39')'
      'set @qt_movimento '#9' '#9'     = isnull(:qt_movimento,0)'
      'set @cd_fase_produto       = isnull(:cd_fase_produto,0)'
      'set @dt_bloqueio_movimento = isnull(:dt_bloqueio_movimento,'#39#39')'
      'set @cd_lpn_produto'#9#9'     = isnull(:cd_lpn_produto,'#39#39')'
      ''
      'insert into Movimento_Bloqueio_Lote'
      #9'( cd_movimento,'
      #9'  dt_movimento,'
      #9'  cd_local_bloqueio,'
      '    cd_motivo_bloqueio,'#9'  '
      #9'  cd_tipo_bloqueio,'
      #9'  cd_lote_produto,'
      #9'  cd_produto,'
      #9'  nm_ref_lote_produto,'
      #9'  qt_movimento,'
      #9'  cd_fase_produto,'
      #9'  dt_bloqueio_movimento,'
      #9'  cd_lpn_produto,'
      #9'  dt_confirmacao_bloqueio'
      #9'  )'
      'values'
      #9'( @cd_movimento,'
      #9'  @dt_hoje,'
      #9'  @cd_local_bloqueio,'
      '    @cd_motivo_bloqueio,'
      #9'  @cd_tipo_bloqueio,'
      #9'  @cd_lote_produto,'
      #9'  @cd_produto,'
      #9'  @nm_ref_lote_produto,'
      #9'  @qt_movimento,'
      #9'  @cd_fase_produto,'
      #9'  @dt_bloqueio_movimento,'
      #9'  @cd_lpn_produto,'
      #9'  getdate() )'
      #9'  ')
    Left = 336
    Top = 184
    ParamData = <
      item
        Name = 'CD_MOTIVO_BLOQUEIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_BLOQUEIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_TIPO_BLOQUEIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_LOTE_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NM_REF_LOTE_PRODUTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'QT_MOVIMENTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_FASE_PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DT_BLOQUEIO_MOVIMENTO'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'CD_LPN_PRODUTO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryAtualizaMovimentoDestinacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update '
      '  movimento_bloqueio_lote '
      'set'
      '  dt_confirmacao_destinacao = getdate()'
      'where '
      '  cd_lpn_produto = :lpn')
    Left = 336
    Top = 48
    ParamData = <
      item
        Name = 'LPN'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryAtualizaMovimentoEncerramento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'update '
      '  movimento_bloqueio_lote '
      'set'
      '  dt_confirmacao_encerramento = getdate(),'
      
        '  dt_liberacao_movimento = case when cd_destinacao_bloqueio in (' +
        '1,5) then getdate() else null end'
      'where '
      '  cd_lpn_produto = :lpn')
    Left = 336
    Top = 112
    ParamData = <
      item
        Name = 'LPN'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object stpGeraEmailBloqueioPallet: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_gera_email_bloqueio_pallet'
    Left = 171
    Top = 232
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@cd_parametro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@cd_bloqueio'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@cd_lpn'
        DataType = ftString
        ParamType = ptInput
        Size = 70
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'cd_controle'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'cd_bloqueio_lote'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'cd_item_bloqueio_lote'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'cd_bloqueio_web'
    end
    object StringField1: TStringField
      FieldName = 'nm_sku'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'nm_descricao'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'nm_categoria'
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'nm_divisao'
      Size = 10
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'dt_fabricacao'
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'dt_vencimento'
    end
    object IntegerField4: TIntegerField
      FieldName = 'qt_caixa'
    end
    object IntegerField5: TIntegerField
      FieldName = 'qt_produto'
    end
    object StringField5: TStringField
      FieldName = 'nm_cod_lpn'
      Size = 60
    end
    object SQLTimeStampField3: TSQLTimeStampField
      FieldName = 'dt_bloqueio'
    end
    object StringField6: TStringField
      FieldName = 'nm_codigo_motivo'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'nm_descricao_motivo'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'nm_solicitante_motivo'
      Size = 100
    end
    object IntegerField6: TIntegerField
      FieldName = 'cd_usuario_inclusao'
    end
    object SQLTimeStampField4: TSQLTimeStampField
      FieldName = 'dt_usuario_inclusao'
    end
    object IntegerField7: TIntegerField
      FieldName = 'cd_usuario'
    end
    object SQLTimeStampField5: TSQLTimeStampField
      FieldName = 'dt_usuario'
    end
    object StringField9: TStringField
      FieldName = 'nm_laudo_bloqueio'
      Size = 30
    end
    object IntegerField8: TIntegerField
      FieldName = 'cd_status_bloqueio'
    end
    object StringField10: TStringField
      FieldName = 'nm_status_bloqueio'
      Required = True
      Size = 24
    end
    object IntegerField9: TIntegerField
      FieldName = 'cd_identificacao'
    end
    object SQLTimeStampField6: TSQLTimeStampField
      FieldName = 'dt_entrada'
    end
    object StringField11: TStringField
      FieldName = 'nm_fantasia_destinatario'
      Size = 60
    end
    object IntegerField10: TIntegerField
      FieldName = 'cd_nota_entrada'
    end
    object IntegerField11: TIntegerField
      FieldName = 'cd_serie_nota_fiscal'
    end
    object IntegerField12: TIntegerField
      FieldName = 'cd_item_nota_entrada'
    end
    object IntegerField13: TIntegerField
      FieldName = 'cd_produto'
    end
    object StringField12: TStringField
      FieldName = 'cd_mascara_produto'
      Size = 30
    end
    object StringField13: TStringField
      FieldName = 'nm_fantasia_produto'
      Size = 30
    end
    object StringField14: TStringField
      FieldName = 'nm_produto'
      Size = 120
    end
    object IntegerField14: TIntegerField
      FieldName = 'cd_lote_produto'
    end
    object StringField15: TStringField
      FieldName = 'nm_ref_lote_produto'
      Size = 25
    end
    object StringField16: TStringField
      FieldName = 'cd_identificacao_lote'
      Size = 25
    end
    object StringField17: TStringField
      FieldName = 'cd_identificacao_pallet'
      Size = 70
    end
    object IntegerField15: TIntegerField
      FieldName = 'cd_movimento'
    end
    object IntegerField16: TIntegerField
      FieldName = 'cd_motivo_bloqueio'
    end
    object IntegerField17: TIntegerField
      FieldName = 'cd_destinacao_bloqueio'
    end
    object IntegerField18: TIntegerField
      FieldName = 'cd_tipo_bloqueio'
    end
    object SQLTimeStampField7: TSQLTimeStampField
      FieldName = 'dt_bloqueio_movimento'
    end
    object SQLTimeStampField8: TSQLTimeStampField
      FieldName = 'dt_liberacao_movimento'
    end
    object SQLTimeStampField9: TSQLTimeStampField
      FieldName = 'dt_confirmacao_bloqueio'
    end
    object SQLTimeStampField10: TSQLTimeStampField
      FieldName = 'dt_confirmacao_destinacao'
    end
    object SQLTimeStampField11: TSQLTimeStampField
      FieldName = 'dt_confirmacao_encerramento'
    end
    object StringField18: TStringField
      FieldName = 'ic_utilizado'
      FixedChar = True
      Size = 1
    end
  end
end
