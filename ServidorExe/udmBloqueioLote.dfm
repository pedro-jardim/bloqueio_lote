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
  object MSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 32
    Top = 168
  end
end
