object dmBloqueio: TdmBloqueio
  OldCreateOrder = False
  Height = 266
  Width = 335
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=EGISSQL_GNSF'
      'User_Name=sa'
      'Password=sql@127'
      'Server=186.202.42.2'
      'DriverID=MSSQL')
    Connected = True
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
    Top = 104
    ParamData = <
      item
        Name = 'NM_ARQUIVO'
        DataType = ftMemo
        ParamType = ptInput
      end>
  end
  object pr_pedro: TFDStoredProc
    Connection = FDConnection
    StoredProcName = 'dbo.pr_pedro'
    Left = 152
    Top = 80
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
        Name = '@cd_pedro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@nm_pedro'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 4
        Name = '@dt_pedro'
        DataType = ftTimeStamp
        NumericScale = 3
        ParamType = ptInput
      end>
    object pr_pedrocd_controle: TIntegerField
      FieldName = 'cd_controle'
      Origin = 'cd_controle'
    end
    object pr_pedronm_arquivo: TMemoField
      FieldName = 'nm_arquivo'
      Origin = 'nm_arquivo'
      BlobType = ftMemo
    end
    object pr_pedrodt_pedro: TSQLTimeStampField
      FieldName = 'dt_pedro'
      Origin = 'dt_pedro'
    end
  end
  object MSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 32
    Top = 168
  end
  object ds_pedro: TDataSource
    DataSet = pr_pedro
    Left = 200
    Top = 128
  end
end
