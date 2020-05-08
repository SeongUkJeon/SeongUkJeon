Attribute VB_Name = "bshfunction"
Option Explicit

' gate ����

'Public g_errmesg As String
'Public g_errio As String
'Public g_errcode As String
'

'  t_cntr���� �ش籸���� �Ⱓ���� ���� ������
'    ���� : ComboCntrShipCode(combo��Ʈ��, ��������, ��������, �����Ա���(����or����))
'  ��ȯ�� : true or false
Public Function ComboCntrShipCode(cboShip_Code As ComboBox, from_dt As String, to_dt As String, io_gubun As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim ShipCD As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    If io_gubun = "����" Then
        SQL = "SELECT DISTINCT(ship_cd) FROM t_cntr " & _
              " where gin_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY ship_cd"
    Else
        SQL = "SELECT DISTINCT(ship_cd) FROM t_cntr " & _
              " where gout_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY ship_cd"
    End If
    
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboShip_Code.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboCntrShipCode = True
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            ShipCD = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            cboShip_Code.AddItem ShipCD
            Rs.MoveNext
        Loop
        cboShip_Code.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboCntrShipCode = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
'    ComboPlanShip_code = False
    MsgBox "�Լ�(CombocntrShipCode) Error(T_cntr)" & vbCrLf & Err.Description
End Function

'  t_cntr���� �ش籸��,���� �Ⱓ���� ������ ������
'    ���� : ComboCntrCallNo(����combo��Ʈ��,�⵵combo��Ʈ��, ���ڵ�, ��������, ��������, �����Ա���(����or����))
'  ��ȯ�� : true or false
Public Function ComboCntrCallNo(cboCallNo As ComboBox, cboCallYY As ComboBox, Ship_Code As String, from_dt As String, to_dt As String, io_gubun As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim tempNo As String
    Dim CallNo As String
    Dim TempYY As String
    Dim CallYy As String
    Dim i As Integer

On Error GoTo ErrMsg

    Screen.MousePointer = 11


    If io_gubun = "����" Then
        SQL = "SELECT DISTINCT(call_no) FROM t_cntr" & _
              " WHERE ship_cd = '" & Trim(Ship_Code) & "'" & _
              "   and gin_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY call_no"
    Else
        SQL = "SELECT DISTINCT(call_no) FROM t_cntr" & _
              " WHERE ship_cd = '" & Trim(Ship_Code) & "'" & _
              "   and gout_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY call_no"
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    i = 0
    cboCallNo.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboCntrCallNo = 2             '�ڷᰡ ���� ����
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            i = i + 1
            tempNo = IIf(IsNull(Rs(0)), 0, Trim(Rs(0)))
            If Len(Trim(Str(tempNo))) = 1 Then
                CallNo = "0" & Trim(Str(tempNo))
            Else
                CallNo = Trim(Str(tempNo))
            End If

            cboCallNo.AddItem CallNo
            Rs.MoveNext
        Loop
        cboCallNo.ListIndex = i - 1
    End If

    Rs.Close
    Set Rs = Nothing
    Screen.MousePointer = 0
    ComboCntrCallNo = 0                      '�ڷ� �ֽ�
    
    
    If io_gubun = "����" Then
        SQL = "SELECT DISTINCT(call_yy) FROM t_cntr" & _
              " WHERE ship_cd = '" & Trim(Ship_Code) & "'" & _
              "   and gin_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY call_yy"
    Else
        SQL = "SELECT DISTINCT(call_yy) FROM t_cntr" & _
              " WHERE ship_cd = '" & Trim(Ship_Code) & "'" & _
              "   and gout_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY call_yy"
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    i = 0
    cboCallYY.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboCntrCallNo = 2             '�ڷᰡ ���� ����
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            i = i + 1
            TempYY = IIf(IsNull(Rs(0)), 0, Trim(Rs(0)))
            CallYy = Trim(Str(TempYY))

            cboCallYY.AddItem CallYy
            Rs.MoveNext
        Loop
        cboCallYY.ListIndex = i - 1
    End If

    Rs.Close
    Set Rs = Nothing
    Screen.MousePointer = 0
    ComboCntrCallNo = 0                      '�ڷ� �ֽ�
    
    Exit Function

ErrMsg:
    Screen.MousePointer = 0
    ComboCntrCallNo = -1
    MsgBox "�Լ�(ComboCallNo) Error(T_cntr)" & vbCrLf & Err.Description

End Function

'  t_cntr���� �ش籸���� �Ⱓ���� ���縦 ������
'    ���� : comboOperterm(combo��Ʈ��, ��������, ��������, �����Ա���(����or����))
'  ��ȯ�� : true or false
Public Function ComboOperTerm(cboOper_cd As ComboBox, from_dt As String, to_dt As String, io_gubun As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim OperCD As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    If io_gubun = "����" Then
        SQL = "SELECT DISTINCT(oper_cd) FROM t_cntr " & _
              " where gin_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY oper_cd"
    Else
        SQL = "SELECT DISTINCT(oper_cd) FROM t_cntr " & _
              " where gout_dt between to_date('" + from_dt + "','yyyymmdd') and to_date('" + to_dt + "'||'235959','yyyymmddhh24miss')  " & _
              " ORDER BY oper_cd"
    End If
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboOper_cd.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboOperTerm = True
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            OperCD = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            cboOper_cd.AddItem OperCD
            Rs.MoveNext
        Loop
        cboOper_cd.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboOperTerm = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
'    ComboPlanShip_code = False
    MsgBox "�Լ�(ComboOperTerm) Error(T_cntr)" & vbCrLf & Err.Description
End Function

'  t_cntr���� �ش���ġ�� �ڷḦ clear(main)
'    ���� : clear_yardloc(block, bay, row, tier, sz_cd)
'  ��ȯ�� : 0 :����, -1: error

Public Function clear_yardloc(y_block As String, y_bay As String, y_row As String, y_tier As String, SZ_CD As String) As Integer

    Dim rtn_value   As Integer

    Screen.MousePointer = 11
    
    rtn_value = cls_yardloc(y_block, y_bay, y_row, y_tier)
    
    If rtn_value = -1 Then
        clear_yardloc = -1
        Screen.MousePointer = 0
        Exit Function
    End If

'    If Mid(sz_cd, 1, 1) = "2" Then   ' size 20�̸�
'        clear_yardloc = 0
'        Screen.MousePointer = 0
'        Exit Function
'    End If
'
'    rtn_value = cls_yardloc(y_block, y_bay + 1, y_row, y_tier)
'
'    If rtn_value = -1 Then
'        clear_yardloc = -1
'        Screen.MousePointer = 0
'        Exit Function
'    End If
'
'    If Mid(sz_cd, 1, 1) = "4" Then   ' size 40�̸�
'        clear_yardloc = 0
'        Screen.MousePointer = 0
'        Exit Function
'    End If
'
'    rtn_value = cls_yardloc(y_block, y_bay + 2, y_row, y_tier)
'
'    If rtn_value = -1 Then
'        clear_yardloc = -1
'        Screen.MousePointer = 0
'        Exit Function
'    End If
    
    Screen.MousePointer = 0
    
    clear_yardloc = 0
    
End Function

'  table���� �ش籸���� ������ data�� ������
'    ���� : Combodata(combo��Ʈ��, table, field, ����)
'  ��ȯ�� : true or false

Public Function ComboData(CboData As ComboBox, Table_Name As String, Field As String, Sepect_Option As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim PodName As String
    
On Error GoTo ErrMsg
    
    SQL = "SELECT DISTINCT(" & Field & ") from " & Table_Name & " "
    SQL = SQL & " " & Sepect_Option
    SQL = SQL & " ORDER BY " & Field & ""
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    CboData.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        ComboData = False
        Exit Function
    Else
        Rs.MoveFirst
'        CboData.AddItem ""
        Do While Not Rs.EOF
            PodName = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            If PodName <> "" Then
                CboData.AddItem PodName
            End If
            Rs.MoveNext
        Loop
        CboData.ListIndex = 0
    End If

    Rs.Close
    Set Rs = Nothing

    ComboData = True
    
    Exit Function
ErrMsg:
    ComboData = False
    MsgBox "�Լ�(ComboData) Error" & vbCrLf & Err.Description
End Function

'  t_cntr�� �ش���ġ�� �ڷḦ clear(sub)
'    ���� : cls_yardloc(block, bay, row, tier)
'  ��ȯ�� : 0 :����, -1: error

Public Function cls_yardloc(y_block As String, y_bay As String, y_row As String, y_tier As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset

On Error GoTo ErrMsg

    SQL = "update t_cntr" & _
          "   set stcking = '',"
   SQL = SQL + " where y_tblock = '" + y_block + "'" & _
          "   and y_tbay  = " + y_bay & _
          "   and y_trow  = " + y_row + "" & _
          "   and y_ttier = " + y_tier + "" & _
          "   and stcking = 'Y'"

'
    G_Host_Con.Execute (SQL)

    cls_yardloc = 0

    Exit Function

ErrMsg:
    cls_yardloc = -1
    Screen.MousePointer = 0
    MsgBox "TABLE Clear Error(t_cntr)" & vbCrLf & Err.Description, vbCritical
End Function

'  t_cntr�� �ش���ġ�� �����ϴ��� check(main)
'    ���� : chk_yardloc(block, bay, row, tier, sz_cd)
'  ��ȯ�� : 0 :����, -1: error

Public Function chk_yardloc(y_block As String, y_bay As String, y_row As String, y_tier As String, SZ_CD As String) As Integer

    Dim rtn_value   As Integer
    
    Dim i As Integer

    Screen.MousePointer = 11
    
    For i = 1 To 2
        rtn_value = read_yardloc0(y_block, y_bay, y_row, y_tier, i)
        If rtn_value = -1 Then
            chk_yardloc = -1
            Screen.MousePointer = 0
            Exit Function
        End If
    Next i
    
    rtn_value = chk_bay(y_block, y_bay, SZ_CD)
    
    If rtn_value = -1 Then
        chk_yardloc = -1
        Screen.MousePointer = 0
        Exit Function
    End If
    
    If rtn_value = -1 Then
        chk_yardloc = -1
        Screen.MousePointer = 0
        Exit Function
    End If

    If Mid(SZ_CD, 1, 1) = "2" Then   ' size 20�̸�
        chk_yardloc = 0
        Screen.MousePointer = 0
        Exit Function
    End If

    rtn_value = read_yardloc(y_block, y_bay + 1, y_row, y_tier)
    
    If rtn_value = -1 Then
        chk_yardloc = -1
        Screen.MousePointer = 0
        Exit Function
    End If

    If Mid(SZ_CD, 1, 1) = "4" Then   ' size 40�̸�
        chk_yardloc = 0
        Screen.MousePointer = 0
        Exit Function
    End If

    rtn_value = read_yardloc(y_block, y_bay + 2, y_row, y_tier)
    
    If rtn_value = -1 Then
        chk_yardloc = -1
        Screen.MousePointer = 0
        Exit Function
    End If

    chk_yardloc = 0
          
    Screen.MousePointer = 0
    
End Function

'  t_cntr�� �ش���ġ�� �����ϴ��� check(sub0 : ���ʿ� �ִ��� chk)
'    ���� : read_yardloc(block, bay, row, tier)
'  ��ȯ�� : 0 :����, -1: error

Public Function read_yardloc0(y_block As String, y_bay As String, y_row As String, y_tier As String, i As Integer) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg

    SQL = "select cntr_no, substr(sz_cd,1,1) sz_cd" & _
          "  from t_cntr" & _
          " where y_tblock = '" + y_block + "'" & _
          "   and y_tbay  = " & (y_bay - i + 1) & _
          "   and y_trow  = " + y_row + "" & _
          "   and y_ttier = " + y_tier + "" & _
          "   and stcking = 'Y'"
'
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        read_yardloc0 = 0
'        read_yardloc = -1
'        MsgBox "�ش���ġ��ġ�� �����ϴ�" & vbCrLf & vbCrLf & y_block & "-" & CStr(CInt(y_bay) + 1) & "-" & y_row & "-" & y_tier, vbExclamation
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        If Trim(Rs!SZ_CD) > "3" And i = 1 Then
            read_yardloc0 = -1
            MsgBox "�ش���ġ�� �����̳ʰ� �ֽ��ϴ�." & vbCrLf & vbCrLf & y_block & "-" & y_bay & "-" & y_row & "-" & y_tier & " : " & IIf(IsNull(Rs!Cntr_no), " ", Trim(Rs!Cntr_no)), vbExclamation
            Rs.Close
            Set Rs = Nothing
            Exit Function
        ElseIf Trim(Rs!SZ_CD) > "8" And i = 2 Then
            read_yardloc0 = -1
            MsgBox "�ش���ġ�� �����̳ʰ� �ֽ��ϴ�." & vbCrLf & vbCrLf & y_block & "-" & y_bay & "-" & y_row & "-" & y_tier & " : " & IIf(IsNull(Rs!Cntr_no), " ", Trim(Rs!Cntr_no)), vbExclamation
            Rs.Close
            Set Rs = Nothing
            Exit Function
        End If
    End If

    Rs.Close
    Set Rs = Nothing
    read_yardloc0 = 0
          
    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    read_yardloc0 = -1
    Screen.MousePointer = 0
    MsgBox "TABLE Read Error(t_cntr)" & vbCrLf & Err.Description, vbCritical
End Function

'  t_cntr�� �ش���ġ�� �����ϴ��� check(sub0_1 : �ش�bay�� �ٸ� size�� �����̳ʰ� �ִ��� chk)
'    ���� : read_yardloc(block, bay, row, tier)
'  ��ȯ�� : 0 :����, -1: error

Public Function chk_bay(y_block As String, y_bay As String, SZ_CD As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg

    SQL = "select cntr_no, substr(sz_cd,1,1) sz_cd" & _
          "  from t_cntr" & _
          " where y_tblock = '" + y_block + "'" & _
          "   and y_tbay  = " & y_bay & _
          "   and stcking = 'Y'"
'
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
'        read_yardloc = -1
'        MsgBox "�ش���ġ��ġ�� �����ϴ�" & vbCrLf & vbCrLf & y_block & "-" & CStr(CInt(y_bay) + 1) & "-" & y_row & "-" & y_tier, vbExclamation
        chk_bay = 0
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        If Trim(Rs!SZ_CD) < "4" And Mid(SZ_CD, 1, 1) < "4" Then
            chk_bay = 0
            Rs.Close
            Set Rs = Nothing
            Screen.MousePointer = 0
            Exit Function
        ElseIf Trim(Rs!SZ_CD) = "4" And Mid(SZ_CD, 1, 1) = "4" Then
            chk_bay = 0
            Rs.Close
            Set Rs = Nothing
            Screen.MousePointer = 0
            Exit Function
        ElseIf Trim(Rs!SZ_CD) > "8" And Mid(SZ_CD, 1, 1) > "8" Then
            chk_bay = 0
            Rs.Close
            Set Rs = Nothing
            Screen.MousePointer = 0
            Exit Function
        Else
            chk_bay = -1
            MsgBox "�ش���ġ�� �ٸ� SIZE�� �����̳ʰ� �ֽ��ϴ�." & vbCrLf & vbCrLf & y_block & "-" & y_bay & " : " & IIf(IsNull(Rs!Cntr_no), " ", Trim(Rs!Cntr_no)), vbExclamation
            Rs.Close
            Set Rs = Nothing
            Exit Function
        End If
    End If

    Rs.Close
    Set Rs = Nothing
    chk_bay = 0
          
    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    chk_bay = -1
    Screen.MousePointer = 0
    MsgBox "TABLE Read Error(t_cntr)" & vbCrLf & Err.Description, vbCritical
End Function


'  t_cntr�� �ش���ġ�� �����ϴ��� check(sub : ���ʿ� �ִ��� chk)
'    ���� : read_yardloc(block, bay, row, tier)
'  ��ȯ�� : 0 :����, -1: error

Public Function read_yardloc(y_block As String, y_bay As String, y_row As String, y_tier As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrMsg

    SQL = "select cntr_no" & _
          "  from t_cntr" & _
          " where y_tblock = '" + y_block + "'" & _
          "   and y_tbay  = " + y_bay & _
          "   and y_trow  = " + y_row + "" & _
          "   and y_ttier = " + y_tier + "" & _
          "   and stcking = 'Y'"
'
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        read_yardloc = 0
'        read_yardloc = -1
'        MsgBox "�ش���ġ��ġ�� �����ϴ�" & vbCrLf & vbCrLf & y_block & "-" & CStr(CInt(y_bay) + 1) & "-" & y_row & "-" & y_tier, vbExclamation
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
        Rs.MoveFirst
        If IIf(IsNull(Rs!Cntr_no), "0", Trim(Rs!Cntr_no)) <> "0" Then
            read_yardloc = -1
            MsgBox "�ش���ġ�� �����̳ʰ� �ֽ��ϴ�." & vbCrLf & vbCrLf & y_block & "-" & y_bay & "-" & y_row & "-" & y_tier & " : " & IIf(IsNull(Rs!Cntr_no), " ", Trim(Rs!Cntr_no)), vbExclamation
            Rs.Close
            Set Rs = Nothing
            Exit Function
        End If
    End If

    Rs.Close
    Set Rs = Nothing
    read_yardloc = 0
          
    Screen.MousePointer = 0
    
    Exit Function
ErrMsg:
    read_yardloc = -1
    Screen.MousePointer = 0
    MsgBox "TABLE Read Error(t_cntr)" & vbCrLf & Err.Description, vbCritical
End Function

'  t_yardplan�� �ִ� block no�� �ѱ�
'    ���� : ComboPlanBlock( ComboBox)
'  ��ȯ�� : true :����, false: error

Public Function ComboPlanBlock(cboBlock As ComboBox) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim y_block As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    SQL = "SELECT DISTINCT(block) FROM t_yardplan where st_cd <> 'D' and  io_cd <> 'R' ORDER BY block"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboBlock.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboPlanBlock = False
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            y_block = Trim(Rs(0)) & ""
            cboBlock.AddItem y_block
            Rs.MoveNext
        Loop
        cboBlock.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboPlanBlock = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    ComboPlanBlock = False
    MsgBox "�Լ�(ComboPlanBlock) Error(T_yardplan)" & vbCrLf & Err.Description
End Function

'  t_yardplan�� �ִ� �ش�������� block no�� �ѱ�
'    ���� : ComboPlanShipBlock( ComboBox)
'  ��ȯ�� : true :����, false: error

Public Function ComboPlanShipBlock(cboBlock As ComboBox, ship_cd As String, call_no As Integer, call_yy As Integer, IO_CD As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim y_block As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    SQL = "SELECT DISTINCT(block) FROM t_yardplan " & _
          " where ship_cd = '" & ship_cd & "' " & _
          "   and call_no = " & call_no & _
          "   and call_yy = " & call_yy & _
          "   and io_cd like '" & IO_CD & "'" & _
          "   and nvl(trim(st_cd),' ')  = ' '" & _
          " ORDER BY block"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboBlock.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboPlanShipBlock = False
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            y_block = Trim(Rs(0)) & ""
            cboBlock.AddItem y_block
            Rs.MoveNext
        Loop
        cboBlock.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboPlanShipBlock = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    ComboPlanShipBlock = False
    MsgBox "�Լ�(ComboPlanShipBlock) Error(T_yardplan)" & vbCrLf & Err.Description
End Function

'  t_yardplan�� �ִ� ship_cd�� �ѱ�
'    ���� : ComboPlanShip(ComboBox)
'  ��ȯ�� : true :����, false: error

Public Function ComboPlanShip(cboShip_cd As ComboBox) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim ship_cd As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    SQL = "SELECT DISTINCT(ship_cd) FROM t_yardplan where nvl(trim(st_cd),' ') = ' ' and  io_cd <> 'R' ORDER BY ship_cd"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboShip_cd.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboPlanShip = False
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            ship_cd = Trim(Rs(0)) & ""
            cboShip_cd.AddItem ship_cd
            Rs.MoveNext
        Loop
        cboShip_cd.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboPlanShip = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    ComboPlanShip = False
    MsgBox "�Լ�(ComboPlanShip) Error(T_yardplan)" & vbCrLf & Err.Description
End Function


'  t_yardplan���� �ش���� ������ ������
'    ���� : ComboPlanCallNo(����combo��Ʈ��,�⵵combo��Ʈ��, ���ڵ�)
'  ��ȯ�� : true or false
Public Function ComboPlanCallNo(cboCallNo As ComboBox, cboCallYY As ComboBox, Ship_Code As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim call_no As String
    Dim call_yy As String

On Error GoTo ErrMsg

    Screen.MousePointer = 11

    SQL = "SELECT call_no, call_yy FROM t_yardplan "
    SQL = SQL & " WHERE ship_cd = '" + Ship_Code + "' "
    SQL = SQL & "   AND trim(st_cd) is null "
    SQL = SQL & " GROUP BY call_no, call_yy "
    SQL = SQL & " ORDER BY call_no, call_yy "

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    cboCallNo.Clear
    cboCallYY.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboPlanCallNo = 2             '�ڷᰡ ���� ����
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            call_no = Trim(Rs(0)) & ""
            If Len(Trim(Str(call_no))) = 1 Then
                call_no = "0" & Trim(Str(call_no))
            Else
                call_no = Trim(Str(call_no))
            End If
            cboCallNo.AddItem call_no
            call_yy = Trim(Rs(1)) & ""
            cboCallYY.AddItem call_yy
            Rs.MoveNext
        Loop
        cboCallNo.ListIndex = 0
        cboCallYY.ListIndex = 0
    End If

    Rs.Close
    Set Rs = Nothing
    Screen.MousePointer = 0
    ComboPlanCallNo = 0                      '�ڷ� �ֽ�
    
    Exit Function

ErrMsg:
    Screen.MousePointer = 0
    ComboPlanCallNo = -1
    MsgBox "�Լ�(ComboplanCallNo) Error(T_cntr)" & vbCrLf & Err.Description

End Function

'  �ش���� free_date�������� ������
'    ���� : freeday_ship(���ڵ�, �𼱳⵵, ������, �����Ա���, �۾�����, ����)
'  ��ȯ�� : free_time������(yyyy/mm/dd hh:mi:ss)
Public Function freeday_ship(ship_cd As String, call_yy As String, call_no As String, ix_cd As String, cargo_cd As String, Oper_Cd As String) As String
'    Dim Sql As String
'    Dim Rs As ADODB.Recordset
    Dim Start_dt As Date
    Dim End_dt As Date
    
    Dim CHK As Integer
    
    Dim free_ilsu  As Integer
    Dim ilsu  As Integer
    
    CHK = ship_date(ship_cd, call_yy, call_no, Start_dt, End_dt)
    
    If CHK = -1 Then
        freeday_ship = "NO"
        Exit Function
    End If
        
'
'On Error GoTo ErrMsg
'    Screen.MousePointer = 11
'
'    Sql = "select to_char(decode(ata_dt,null,decode(stv_begin_dt,null,etb_dt,stv_begin_dt), ata_dt),'yyyy/mm/dd hh24:mi:ss') �����Ͻ�, " & _
'          "       to_char(decode(stv_end_dt,null,decode(atd_dt,null,etd_dt,atd_dt), stv_end_dt),'yyyy/mm/dd hh24:mi:ss') �۾��Ϸ�" & _
'          "  from t_vescall" & _
'          " where ship_cd = '" + Ship_Cd + "' " & _
'          "   and call_yy = " + call_yy + " " & _
'          "   and call_no = " + call_no + " "
'
'    Set Rs = New ADODB.Recordset
'    Rs.Open Sql, G_Host_Con
'
'    If Rs.EOF Then
'        MsgBox "�ش��ϴ� �������� �����ϴ�"
'        Rs.Close
'        Set Rs = Nothing
'        Screen.MousePointer = 0
'        freeday_ship = "NO"
'        Exit Function
'    Else
'        Rs.MoveFirst
'        start_dt = CDate(IIf(IsNull(Rs(0)), "", Trim(Rs(0))))
'        end_dt = CDate(IIf(IsNull(Rs(1)), "", Trim(Rs(1))))
'    End If
'
'    Rs.Close
'    Set Rs = Nothing
'
'    Screen.MousePointer = 0
    
    If ix_cd = "I" Then
        free_ilsu = FreeDay_ilsu(End_dt, ix_cd, cargo_cd, Oper_Cd)
        If free_ilsu < 0 Then
            freeday_ship = "NO"
            Exit Function
        End If
        ilsu = imn_ilsu(End_dt - free_ilsu, End_dt)
        If ilsu < 0 Then
            freeday_ship = "NO"
            Exit Function
        End If
        If Format(End_dt, "hhmm") >= "0800" Then
            End_dt = End_dt + 1
        End If
        freeday_ship = Format(End_dt + free_ilsu + ilsu, "yyyy/mm/dd") + " 08:00:00"
    Else
        free_ilsu = FreeDay_ilsu(Start_dt, ix_cd, cargo_cd, Oper_Cd)
        If free_ilsu < 0 Then
            freeday_ship = "NO"
            Exit Function
        End If
        ilsu = imn_ilsu(Start_dt, Start_dt + free_ilsu)
        If ilsu < 0 Then
            freeday_ship = "NO"
            Exit Function
        End If
        freeday_ship = Format(Start_dt - free_ilsu - ilsu, "yyyy/mm/dd") + " 00:00:00"
    End If
    
'    Exit Function
'
'ErrMsg:
'    Screen.MousePointer = 0
'        freeday_ship = "NO"
'    MsgBox "�Լ�(freeday_ship) Error(T_vercall)" & vbCrLf & Err.Description
End Function
'''
''''  �ش���� �۾��Ϸ��Ͻ��� ������
''''    ���� : ship_date(���ڵ�, �𼱳⵵, ������, �����Ͻ�, �����Ͻ�):�����Ͻ�,�����Ͻô� �ǵ�����
''''  ��ȯ�� : 0, -1(error)
'''Public Function ship_date(ship_cd As String, call_yy As String, call_no As String, start_dt As Date, end_dt As Date) As Integer
'''    Dim Sql As String
'''    Dim Rs As ADODB.Recordset
'''
'''On Error GoTo ErrMsg
'''    Screen.MousePointer = 11
'''
'''    Sql = "select to_char(decode(ata_dt,null,decode(stv_begin_dt,null,etb_dt,stv_begin_dt), ata_dt),'yyyy/mm/dd hh24:mi:ss') �����Ͻ�, " & _
'''          "       to_char(decode(stv_end_dt,null,decode(atd_dt,null,etd_dt,atd_dt), stv_end_dt),'yyyy/mm/dd hh24:mi:ss') �۾��Ϸ�" & _
'''          "  from t_vescall" & _
'''          " where ship_cd = '" + ship_cd + "' " & _
'''          "   and call_yy = " + call_yy + " " & _
'''          "   and call_no = " + call_no + " "
'''
'''    Set Rs = New ADODB.Recordset
'''    Rs.Open Sql, G_Host_Con
'''
'''    If Rs.EOF Then
'''        MsgBox "�ش��ϴ� �������� �����ϴ�" & vbCrLf & ship_cd + "-" + call_no + "-" + call_yy
'''        Rs.Close
'''        Set Rs = Nothing
'''        Screen.MousePointer = 0
'''        ship_date = -1
'''        Exit Function
'''    Else
'''        Rs.MoveFirst
'''        start_dt = CDate(IIf(IsNull(Rs(0)), "", Trim(Rs(0))))
'''        end_dt = CDate(IIf(IsNull(Rs(1)), "", Trim(Rs(1))))
'''    End If
'''
'''    Rs.Close
'''    Set Rs = Nothing
'''
'''    Screen.MousePointer = 0
'''
'''    ship_date = 0
'''    Exit Function
'''
'''ErrMsg:
'''    Screen.MousePointer = 0
'''    ship_date = -1
'''    MsgBox "�Լ�(ship_date) Error(T_vescall)" & vbCrLf & Err.Description
'''End Function

'  t_cntr���� �ش�������� �׸��� ������
'    ���� : ComboCntrfield(�׸�, combo��Ʈ��, ���ڵ�, �⵵, ����)
'  ��ȯ�� : true or false
Public Function ComboCntrfield(Field As String, cbofield As ComboBox, ship_cd As String, call_yy As String, call_no As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim get_str As String
    
On Error GoTo ErrMsg
    Screen.MousePointer = 11

    SQL = "SELECT DISTINCT(" + Field + ") FROM t_cntr " & _
          " where ship_cd = '" + ship_cd + "'  " & _
          "   and call_yy = " + call_yy + "   " & _
          "   and call_no = " + call_no + "   " & _
          "   and trim(" + Field + ") is not null "
    SQL = SQL & " order by " + Field + " "
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cbofield.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        ComboCntrfield = False
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            get_str = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            cbofield.AddItem get_str
            Rs.MoveNext
        Loop
        cbofield.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    Screen.MousePointer = 0
    ComboCntrfield = True
    
    Exit Function
ErrMsg:
    Screen.MousePointer = 0
    ComboCntrfield = False
    MsgBox "�Լ�(ComboCntrfield) Error(T_cntr) : " + Field & vbCrLf & Err.Description
End Function

Public Function ComboOperCd(cboOper_Code As ComboBox) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim ShipCD As String
    
On Error GoTo ErrMsg

    SQL = "SELECT oper_cd FROM t_oper ORDER BY oper_cd"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboOper_Code.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        ComboOperCd = True
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            ShipCD = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            cboOper_Code.AddItem ShipCD
            Rs.MoveNext
        Loop
        cboOper_Code.ListIndex = -1
    End If

    Rs.Close
    Set Rs = Nothing

    ComboOperCd = True
    
    Exit Function
ErrMsg:
    ComboOperCd = False
    MsgBox "�Լ�(cboOper_Code) Error(T_Vescall)" & vbCrLf & Err.Description
End Function

'  �ش� sps�� �ش�row�� ���� ����
'    ���� : fun_sps_colsum (sps, start_col, end_col, set_col, row, �ݿø� �ڸ���)
'  ��ȯ�� : 0 :����, -1: error

Public Function fun_sps_colsum(sps As vaSpread, st_col As Integer, en_col As Integer, col As Integer, row As Integer, round_cnt As Integer) As Boolean

    Dim rtn_value   As Integer
    Dim sum_value   As Double

    Dim var As Variant

    Dim i As Integer

    sum_value = 0

    For i = st_col To en_col
        Call sps.GetText(i, row, var)
        If var = "" Then
            var = 0
        End If
        sum_value = sum_value + var
    Next i
    
    sps.SetText col, row, Round(sum_value, round_cnt)
 
    fun_sps_colsum = True
    
End Function

'  �ش� sps�� �ش�col�� ���� ����
'    ���� : fun_sps_rowsum (sps, start_row, end_row, col, row, �ݿø� �ڸ���)
'  ��ȯ�� : true :����, false : �̻�

Public Function fun_sps_rowsum(sps As vaSpread, st_row As Integer, en_row As Integer, col As Integer, row As Integer, round_cnt As Integer) As Boolean

    Dim rtn_value   As Integer
    Dim sum_value   As Double

    Dim var As Variant

    Dim i As Integer

    sum_value = 0

    For i = st_row To en_row
        Call sps.GetText(col, i, var)
        If var = "" Then
            var = 0
        End If
        sum_value = sum_value + var
    Next i
    
    If sum_value = 0 Then
        sps.SetText col, row, ""
    Else
        sps.SetText col, row, Round(sum_value, round_cnt)
    End If
    
    fun_sps_rowsum = True
    Exit Function
    
ErrMsg:
    fun_sps_rowsum = False
    MsgBox "�Լ�(fun_sps_rowsum) Error" & vbCrLf & Err.Description
End Function

Public Sub ComboHour(cboHour As ComboBox)
    Dim ThisHour As String

    Call GetHostDateTime
    ThisHour = Mid(Trim(G_CurrentTime), 1, 2)
        
    cboHour.Clear
    cboHour.AddItem "00"
    cboHour.AddItem "01"
    cboHour.AddItem "02"
    cboHour.AddItem "03"
    cboHour.AddItem "04"
    cboHour.AddItem "05"
    cboHour.AddItem "06"
    cboHour.AddItem "07"
    cboHour.AddItem "08"
    cboHour.AddItem "09"
    cboHour.AddItem "10"
    cboHour.AddItem "11"
    cboHour.AddItem "12"
    cboHour.AddItem "13"
    cboHour.AddItem "14"
    cboHour.AddItem "15"
    cboHour.AddItem "16"
    cboHour.AddItem "17"
    cboHour.AddItem "18"
    cboHour.AddItem "19"
    cboHour.AddItem "20"
    cboHour.AddItem "21"
    cboHour.AddItem "22"
    cboHour.AddItem "23"
    cboHour.ListIndex = Val(ThisHour)
End Sub

Public Sub ComboMin(cboMin As ComboBox)
    Dim ThisMin As String
    Dim Item As String
    Dim i As Integer

    Call GetHostDateTime
    ThisMin = Mid(Trim(G_CurrentTime), 3, 2)
        
    For i = 0 To 59
        If i < 10 Then
            Item = "0" & Trim(Str(i))
        Else
            Item = Trim(Str(i))
        End If
        cboMin.AddItem Item
    Next i

    cboMin.ListIndex = Val(ThisMin)
End Sub

'  2001/04/09   �����κ� �߰�


'  �ش������̳��� over�ϼ��� ������
'    ���� : freeday_yard_cntr(�����̳ʹ�ȣ, ��������(��������), ��������(return��), �۾�����(return��))
'            �۾����� : 1:����, 2:����,3:�ںε�t/s,4:Ÿ�ε�t/s,5:�ݼ�, 6:����, 7:�ε����
'
''    ���� : freeday_yard_cntr(�����̳ʹ�ȣ, ��������(��������), ��������+freeday�ϼ�(return��))
'  ��ȯ�� : over�ϼ�
Public Function freeday_yard_cntr(Cntr_no As String, out_dt As String, Rtn_Date As String, work_cd As String) As Integer
    Dim SQL As String
    Dim tmpSql As String
    Dim Rs As ADODB.Recordset
    Dim tmpRs As ADODB.Recordset
    Dim Start_dt As Date
    Dim End_dt As Date
    
    Dim free_ilsu  As Integer
    Dim ilsu  As Integer
    Dim Over_Day  As Integer
    
    Dim good_cd  As String
    Dim ix_cd  As String
    Dim Oper_Cd  As String
    
On Error GoTo ErrMsg
    
'    Sql = "select substr(cur_stat,1,1) cur_stat, nvl(ts_id,' ') ts_id, decode(a.oper_cd1,null,a.oper_cd,a.oper_cd1) oper_cd, " & _
'          "       nvl(rtn_cd,' ') rtn_cd, nvl(gin_dt,'') gin_dt, nvl(a.bond_id,' ') bond_id," & _
'          "       decode(substr(cur_stat,1,1),'I', to_date('" & out_dt & "','yyyymmddhh24miss'), nvl(gout_dt,'')) gout_dt, nvl(stv_end_dt,nvl(atd_dt,'')) stv_end_dt, " & _
'          "       decode(substr(cur_stat,1,1),'X', to_date('" & out_dt & "','yyyymmddhh24miss'), nvl(ata_dt,nvl(eta_dt,''))) ata_dt, nvl(ex_ship_call,' ') ex_ship_call, " & _
'          "       a.ship_cd SHIP_CD, a.call_no CALL_NO, a.call_yy CALL_YY" & _
'          "  from t_cntr a, t_vescall b" & _
'          " Where cntr_no = '" + Cntr_no + "' " & _
'          "   and substr(a.cur_stat,2,1) <> 'D'" & _
'          "   and substr(a.cur_stat,2,1) <> 'B'" & _
'          "   and a.Ship_Cd = b.Ship_Cd(+) " & _
'          "   and a.call_yy = b.call_yy(+) " & _
'          "   and a.call_no = b.call_no(+) "

    SQL = "SELECT SUBSTR(cur_stat, 1, 1)    cur_stat, "
    SQL = SQL & "       NVL(ts_id, ' ')       ts_id, "
    SQL = SQL & "       DECODE(a.oper_cd1, NULL, a.oper_cd, a.oper_cd1)    oper_cd, "
    SQL = SQL & "       NVL(rtn_cd, ' ')       rtn_cd, "
    SQL = SQL & "       NVL(gin_dt, '')       gin_dt, "
    SQL = SQL & "       NVL(a.bond_id, ' ')       bond_id, "
    SQL = SQL & "       DECODE(SUBSTR(cur_stat, 1, 1), "
    SQL = SQL & "              'I', "
    SQL = SQL & "              TO_DATE('" & out_dt & "', 'yyyymmddhh24miss'), "
    SQL = SQL & "              NVL(gout_dt, ''))    gout_dt, "
    SQL = SQL & "       NVL(stv_end_dt, NVL(atd_dt, '')) stv_end_dt, "
    SQL = SQL & "       DECODE(SUBSTR(cur_stat, 1, 1), "
    SQL = SQL & "              'X', "
    SQL = SQL & "              TO_DATE('" & out_dt & "', 'yyyymmddhh24miss'), "
    SQL = SQL & "              NVL(ata_dt, nvl(eta_dt, '')))    ata_dt, "
    SQL = SQL & "       NVL(ex_ship_call, ' ') ex_ship_call, "
    SQL = SQL & "       a.ship_cd SHIP_CD, "
    SQL = SQL & "       a.call_no CALL_NO, "
    SQL = SQL & "       a.call_yy CALL_YY, "
    SQL = SQL & "       NVL(a.soc_yn, 'N') soc_yn, "
    SQL = SQL & "       fm_cd "
    SQL = SQL & "  FROM t_cntr a, t_vescall b"
    SQL = SQL & " WHERE cntr_no = '" & Cntr_no & "' AND"
    SQL = SQL & "       SUBSTR(a.cur_stat, 2, 1) <> 'D' AND"
    SQL = SQL & "       SUBSTR(a.cur_stat, 2, 1) <> 'B' AND"
    SQL = SQL & "       a.ship_cd = b.ship_cd(+) AND"
    SQL = SQL & "       a.call_yy = b.call_yy(+) AND"
    SQL = SQL & "       a.call_no = b.call_no(+) "
    SQL = SQL & " Order by dup_no DESC "

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �����̳ʰ� �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        freeday_yard_cntr = -1
        Exit Function
    Else
        Rs.MoveFirst
        If Rs!Cur_Stat = "I" Then   '  ����
            ix_cd = IIf(IsNull(Rs!Cur_Stat), "", Trim(Rs!Cur_Stat))
            
            If Rs!Ts_ID = " " Then    '  �Ϲ�
                
                tmpSql = "select nvl(banch_cd,' ') banch_cd from t_bsiot "
                tmpSql = tmpSql & "where cargo_no in "
                tmpSql = tmpSql & "(select cargo_no from t_bsiot_sub a, t_cntr b "
                tmpSql = tmpSql & "where a.cntr_no = '" + Cntr_no + "' "
                tmpSql = tmpSql & "and a.cntr_no = b.cntr_no "
                tmpSql = tmpSql & "and a.dup_no = b.dup_no "
                tmpSql = tmpSql & "and substr(b.cur_stat,2,1) <> 'D' "
                tmpSql = tmpSql & "and substr(b.cur_stat,2,1) <> 'B') "
                tmpSql = tmpSql & "ORDER BY singo_dt DESC "
                Set tmpRs = New ADODB.Recordset
                tmpRs.Open tmpSql, G_Host_Con
                
                If tmpRs.EOF Then
                    work_cd = "1"
                    good_cd = "1"
                ElseIf Rs!FM_CD = "M" Then
                    work_cd = "1"
                    good_cd = "1"
                Else
                    If Left(tmpRs!BANCH_CD, 1) = "6" Then  '  ����
                        work_cd = "6"
                        good_cd = "2"
                    ElseIf Left(tmpRs!BANCH_CD, 1) = "5" Then  ' �ε����
                        work_cd = "7"
                        good_cd = "3"
                    ElseIf Trim(tmpRs!BANCH_CD) = "" Then
                        MsgBox ("�̽��� �����̳� �Դϴ�.")
                        Exit Function
                    Else   '  �׿� ����
                        work_cd = "6"
                        good_cd = "2"
                    End If
                End If
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            ElseIf Rs!Ts_ID = "2" Then    '  Ÿ�ε�t/s
                work_cd = "4"
                good_cd = "5"
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            Else    '  �ںε�t/s
                work_cd = "3"
                good_cd = "4"
                Start_dt = CDate(IIf(IsNull(Rs!Stv_End_DT), "1000/01/01 00:00:00", Trim(Rs!Stv_End_DT)))
                End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
            End If
            If Format(Start_dt, "hhmm") >= "0800" Then
                Start_dt = Start_dt + 1
            End If
            Start_dt = CDate(Format(Start_dt, "yyyy/mm/dd") + " 08:00:00")
        Else                        ' ����
            ix_cd = IIf(IsNull(Rs!Cur_Stat), "", Trim(Rs!Cur_Stat))
            If Rs!Ts_ID = " " Then
                
                If Rs!Rtn_CD = " " Then   '  �Ϲ�
                
                tmpSql = "select nvl(banch_cd,' ') banch_cd from t_bsiot "
                tmpSql = tmpSql & "where cargo_no in "
                tmpSql = tmpSql & "(select cargo_no from t_bsiot_sub a, t_cntr b "
                tmpSql = tmpSql & "where a.cntr_no = '" + Cntr_no + "' "
                tmpSql = tmpSql & "and a.cntr_no = b.cntr_no "
                tmpSql = tmpSql & "and a.dup_no = b.dup_no "
                tmpSql = tmpSql & "and substr(b.cur_stat,2,1) <> 'D' "
                tmpSql = tmpSql & "and substr(b.cur_stat,2,1) <> 'B') "
                
                Set tmpRs = New ADODB.Recordset
                tmpRs.Open tmpSql, G_Host_Con
                    
                    If tmpRs.EOF Then
                        work_cd = "2"
                        good_cd = "1"
                    Else
                        If Left(tmpRs!BANCH_CD, 1) = "6" Then  '  ����
                            work_cd = "6"
                            good_cd = "2"
                        ElseIf Left(tmpRs!BANCH_CD, 1) = "5" Then  ' �ε����
                            work_cd = "7"
                            good_cd = "3"
                        End If
                    End If
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                Else                      '  �ݼ�
                    work_cd = "5"
                    good_cd = "6"
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Gout_dt), "1000/01/01 00:00:00", Trim(Rs!Gout_dt)))
                End If
            ElseIf Rs!Ts_ID = "2" Then    '  Ÿ�ε�t/s
                If Rs!Rtn_CD = " " Then
                    work_cd = "4"
                    good_cd = "5"
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", Trim(Rs!Gin_dt)))
                    End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                Else
                    work_cd = "5"
                    good_cd = "6"
                    Start_dt = CDate(IIf(IsNull(Rs!Gin_dt), "1000/01/01 00:00:00", CDate(Format(Rs!Gin_dt, "yyyy/mm/dd") + " 00:00:00")))
                    End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", CDate(Format(Rs!Ata_dt, "yyyy/mm/dd") + " 00:00:00")))
                End If
            Else    '  �ںε�t/s
                work_cd = "3"
                good_cd = "4"
                    If Len(Rs!Ex_Ship_Call) > 8 Then
                        If ship_date(Mid(Rs!Ex_Ship_Call, 1, 4), Mid(Rs!Ex_Ship_Call, 5, 4), Mid(Rs!Ex_Ship_Call, 9), Start_dt, End_dt) = -1 Then
                            freeday_yard_cntr = -1
                            MsgBox "���� �������� Ʋ���ϴ� - " & Cntr_no
                            Exit Function
                        End If
                    Else
                        freeday_yard_cntr = -1
                        MsgBox "���� �������� �����ϴ� - " & Cntr_no
                        Exit Function
                    End If
                Start_dt = End_dt
                If Format(Start_dt, "hhmm") >= "0800" Then
                    Start_dt = Start_dt + 1
                End If
                Start_dt = CDate(Format(Start_dt, "yyyy/mm/dd") + " 08:00:00")
                End_dt = CDate(IIf(IsNull(Rs!Ata_dt), "1000/01/01 00:00:00", Trim(Rs!Ata_dt)))
                End_dt = CDate(Format(End_dt, "yyyy/mm/dd") + " 00:00:00")
            End If
        End If
        Oper_Cd = Check_Feeder(Rs!ship_cd, Rs!call_no, Rs!call_yy)
            
        If Oper_Cd = "SKIP" Then
            Oper_Cd = IIf(IsNull(Rs!Oper_Cd), "", Trim(Rs!Oper_Cd))
        Else
            Oper_Cd = Oper_Cd
        End If
    End If

    Rs.Close
    Set Rs = Nothing
    
    If Format(Start_dt, "yyyy-mm-dd") = "1000-01-01" Then
        freeday_yard_cntr = -1
        MsgBox "�Լ�(freeday_cntr) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ�. - " & Cntr_no
        Exit Function
    End If
    
    If Format(End_dt, "yyyy-mm-dd") = "1000-01-01" Then
        freeday_yard_cntr = -1
        MsgBox "�Լ�(freeday_cntr) Error(T_vercall)" & vbCrLf & "�����Ͻð� �����ϴ�. - " & Cntr_no
        Exit Function
    End If
    
    free_ilsu = FreeDay_ilsu(Start_dt, ix_cd, good_cd, Oper_Cd)
    If free_ilsu < 0 Then
        freeday_yard_cntr = -1
        Exit Function
    End If
    ilsu = imn_ilsu(Start_dt, End_dt)
    If ilsu < 0 Then
        freeday_yard_cntr = -1
        Exit Function
    End If
    
    Rtn_Date = Format(Start_dt + free_ilsu + ilsu, "yyyy-mm-dd hh:mm:ss")
    Over_Day = Round((End_dt - Start_dt) - free_ilsu - ilsu + 0.501)
    
    If Over_Day <= 0 Then
       freeday_yard_cntr = 0
    Else
       freeday_yard_cntr = Over_Day
    End If
    
    Exit Function

ErrMsg:
    freeday_yard_cntr = -1
    MsgBox "�Լ�(freeday_yard_cntr) Error(T_vercall)" & vbCrLf & Err.Description
End Function



Public Function isGateInPossible(ByVal cntrNo As String) As Boolean
    Dim strQuery As String
    Dim Rs As ADODB.Recordset
    
    On Error GoTo ErrHandler
    
    isGateInPossible = True
    
    strQuery = "SELECT CNTR_NO, REMARK"
    strQuery = strQuery & " FROM ("
    strQuery = strQuery & "     SELECT CTRL_NO CNTR_NO, REMARK"
    strQuery = strQuery & "     From T_IOCTRL"
    strQuery = strQuery & "     WHERE CTRL_TYPE = 'C' AND DEL_EMP IS NULL"
    strQuery = strQuery & "     Union"
    strQuery = strQuery & "     SELECT CNTR_NO, REMARK"
    strQuery = strQuery & "     From T_OFFHIRE"
    strQuery = strQuery & "     WHERE STATUS = 'R'"
    strQuery = strQuery & " )"
    strQuery = strQuery & " WHERE CNTR_NO = '" & cntrNo & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open strQuery, G_Host_Con
    
    If Not (Rs.BOF And Rs.EOF) Then
        isGateInPossible = False
    Else
        isGateInPossible = True
    End If
    
    Exit Function

ErrHandler:
    MsgBox Err.Description
End Function


