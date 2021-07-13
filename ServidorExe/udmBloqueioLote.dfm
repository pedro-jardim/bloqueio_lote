object dmBloqueioLote: TdmBloqueioLote
  OldCreateOrder = False
  OnDestroy = SoapDataModuleDestroy
  Height = 283
  Width = 385
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
  object qryTeste: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'insert into pedro'
      'values'
      '(1, :nm_arquivo, getdate())')
    Left = 40
    Top = 96
    ParamData = <
      item
        Name = 'NM_ARQUIVO'
        DataType = ftMemo
        ParamType = ptInput
      end>
  end
  object MSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 40
    Top = 160
  end
  object stpGeraBloqueioLote: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_gera_movimento_bloqueio_lote'
    Left = 152
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
        Name = '@cd_usuario'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@cd_bloqueio_lote'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = '@dt_bloqueio_lote'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = '@hr_bloqueio_lote'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Position = 7
        Name = '@nm_identificador'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 8
        Name = '@cd_requisitante'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = '@nm_cnpj_requisitante'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 10
        Name = '@cd_destino'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = '@nm_cnpj_destino'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 12
        Name = '@nm_xsd_validacao'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 13
        Name = '@cd_centro_origem'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = '@nm_ident_oper'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 15
        Name = '@nm_laudo_bloqueio'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 16
        Name = '@ds_arquivo_xml'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 17
        Name = '@cd_centro_destino'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 18
        Name = '@cd_item_bloqueio_lote'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = '@cd_bloqueio_web'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = '@nm_sku'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 21
        Name = '@nm_descricao'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 22
        Name = '@nm_categoria'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 23
        Name = '@nm_divisao'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 24
        Name = '@dt_fabricacao'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 25
        Name = '@dt_vencimento'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 26
        Name = '@qt_caixa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 27
        Name = '@qt_produto'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 28
        Name = '@nm_cod_lpn'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 29
        Name = '@dt_bloqueio'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 30
        Name = '@nm_codigo_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 31
        Name = '@nm_descricao_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 32
        Name = '@nm_solicitante_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object stpGeraBloqueioLotecd_bloqueio_lote: TIntegerField
      FieldName = 'cd_bloqueio_lote'
      Origin = 'cd_bloqueio_lote'
      ReadOnly = True
    end
  end
  object stpGeraBloqueioLoteItens: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_gera_movimento_bloqueio_lote'
    Left = 152
    Top = 96
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
        Name = '@cd_usuario'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@cd_bloqueio_lote'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = '@dt_bloqueio_lote'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = '@hr_bloqueio_lote'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Position = 7
        Name = '@nm_identificador'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 8
        Name = '@cd_requisitante'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 9
        Name = '@nm_cnpj_requisitante'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 10
        Name = '@cd_destino'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = '@nm_cnpj_destino'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 12
        Name = '@nm_xsd_validacao'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 13
        Name = '@cd_centro_origem'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = '@nm_ident_oper'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 15
        Name = '@nm_laudo_bloqueio'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 16
        Name = '@ds_arquivo_xml'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Position = 17
        Name = '@cd_centro_destino'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 18
        Name = '@cd_item_bloqueio_lote'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 19
        Name = '@cd_bloqueio_web'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 20
        Name = '@nm_sku'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 21
        Name = '@nm_descricao'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 22
        Name = '@nm_categoria'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 23
        Name = '@nm_divisao'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Position = 24
        Name = '@dt_fabricacao'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 25
        Name = '@dt_vencimento'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 26
        Name = '@qt_caixa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 27
        Name = '@qt_produto'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 28
        Name = '@nm_cod_lpn'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Position = 29
        Name = '@dt_bloqueio'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 30
        Name = '@nm_codigo_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Position = 31
        Name = '@nm_descricao_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 32
        Name = '@nm_solicitante_motivo'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object stpGeraEmailBloqueio: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_gera_email_bloqueio_pallet'
    Left = 152
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
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
  end
end
