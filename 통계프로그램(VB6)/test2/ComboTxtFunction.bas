Attribute VB_Name = "ComboTxtFunction"
Option Explicit

Public Sub TextYear(txtYear As TextBox)
    Dim ThisYear As String

    Call GetHostDateTime
    ThisYear = Mid(Trim(G_CurrentDate), 1, 4)

    txtYear.Clear
    txtYear.AddItem Val(ThisYear) - 3
    txtYear.AddItem Val(ThisYear) - 2
    txtYear.AddItem Val(ThisYear) - 1
    txtYear.AddItem Val(ThisYear)
    txtYear.AddItem Val(ThisYear) + 1
    txtYear.ListIndex = 3
End Sub

Public Sub TextMonth(txtMonth As TextBox)
    Dim ThisMonth As String

    Call GetHostDateTime
    ThisMonth = Mid(Trim(G_CurrentDate), 5, 2)
        
    txtMonth.Clear
    txtMonth.AddItem "01"
    txtMonth.AddItem "02"
    txtMonth.AddItem "03"
    txtMonth.AddItem "04"
    txtMonth.AddItem "05"
    txtMonth.AddItem "06"
    txtMonth.AddItem "07"
    txtMonth.AddItem "08"
    txtMonth.AddItem "09"
    txtMonth.AddItem "10"
    txtMonth.AddItem "11"
    txtMonth.AddItem "12"
    txtMonth.ListIndex = Val(ThisMonth) - 1
End Sub

Public Sub TextDay(txtDay As TextBox, AcceptDate As String)
    Dim ThisYearMonth As Long
    Dim ThisDay As String
    Dim LastDay As Integer
    Dim i As Integer
    Dim Item As String * 2

    If Trim(AcceptDate) = "" Then
        Call GetHostDateTime
        ThisYearMonth = Val(Mid(Trim(G_CurrentDate), 1, 6))
        ThisDay = Mid(Trim(G_CurrentDate), 7, 2)
    Else
        ThisYearMonth = Val(Mid(Trim(AcceptDate), 1, 6))
        ThisDay = Mid(Trim(AcceptDate), 7, 2)
    End If
    
    LastDay = LastDaysOfMonths(ThisYearMonth)
       
    If LastDay = -1 Then
        MsgBox "�ش���� ������ ���ڸ� ���� �� �����ϴ�!"
        Exit Sub
    End If
    
    txtDay.Clear
    For i = 1 To LastDay
        If i > 0 And i < 10 Then
            Item = "0" & Trim(Str(i))
        Else
            Item = Trim(Str(i))
        End If
        txtDay.AddItem Item
    Next i
    If LastDay > Val(ThisDay) Then
        txtDay.ListIndex = Val(ThisDay) - 1
    Else
        txtDay.ListIndex = LastDay - 1
    End If
End Sub

Public Function ComboShipCode(cboShip_Code As ComboBox) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim ShipCD As String
    
On Error GoTo ErrMsg

    SQL = "SELECT DISTINCT(ship_cd) FROM t_vescall ORDER BY ship_cd"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboShip_Code.Clear
    If Rs.EOF Then
        MsgBox "�ش��ϴ� �ڷᰡ �����ϴ�"
        Rs.Close
        Set Rs = Nothing
        ComboShipCode = True
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

    ComboShipCode = True
    
    Exit Function
ErrMsg:
    ComboShipCode = False
    MsgBox "�Լ�(ComboShipCode) Error(T_Vescall)" & vbCrLf & Err.Description
End Function

Public Function ComboCallNo(cboCallNo As ComboBox, Ship_Code As String, Call_Year As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim tempNo As String
    Dim CallNo As String
    Dim i As Integer

On Error GoTo ErrMsg

    SQL = "SELECT DISTINCT(call_no) FROM t_vescall"
    SQL = SQL & " WHERE ship_cd = '" & Trim(Ship_Code) & "'"
    SQL = SQL & "   AND call_yy =  " & Val(Trim(Call_Year)) & " "
    SQL = SQL & " ORDER BY call_no"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con

    i = 0
    cboCallNo.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        
        SQL = "SELECT DISTINCT(call_no),call_yy FROM t_vescall" & _
              " WHERE ship_cd = '" & Trim(Ship_Code) & "'" & _
              "   AND call_yy = (SELECT MAX(call_yy) FROM t_vescall" & _
                                " WHERE ship_cd = '" & Trim(Ship_Code) & "')"
        Set Rs = New ADODB.Recordset
        Rs.Open SQL, G_Host_Con
    
        If Rs.EOF Then
            Rs.Close
            Set Rs = Nothing
            ComboCallNo = 2             '�ڷᰡ ���� ����
            Exit Function
        Else
            Rs.MoveFirst
            Call_Year = IIf(IsNull(Rs(1)), 9999, Trim(Rs(1)))
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
        
        ComboCallNo = 1                 'Max Year�� ����
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
    ComboCallNo = 0                      '�ڷ� �ֽ�
    
    Exit Function

ErrMsg:
    ComboCallNo = -1
    MsgBox "�Լ�(ComboCallNo) Error(T_Vescall)" & vbCrLf & Err.Description
End Function

Public Function ComboOperCode(cboOper_Code As ComboBox, ShipCode As String, CallNo As String, CallYear As String, Table_Name As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim OperCD As String
    
On Error GoTo ErrMsg
    
    If ShipCode = "" Then
        MsgBox "���ڵ带 ���� �Է��Ͻÿ�"
        ComboOperCode = 2
        Exit Function
    End If

    If CallNo = "" Then
        MsgBox "������ ���� �Է��Ͻÿ�"
        ComboOperCode = 3
        Exit Function
    End If

    If CallYear = "" Then
        MsgBox "�⵵�� ���� �Է��Ͻÿ�"
        ComboOperCode = 4
        Exit Function
    End If

    SQL = "SELECT DISTINCT(oper_cd) FROM " & Table_Name & " "
    SQL = SQL & " WHERE ship_cd = '" & Trim(ShipCode) & "'"
    SQL = SQL & "   AND call_no =  " & Val(Trim(CallNo)) & " "
    SQL = SQL & "   AND call_yy =  " & Val(Trim(CallYear)) & " "
    SQL = SQL & " ORDER BY oper_cd"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    cboOper_Code.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        ComboOperCode = 1
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            OperCD = IIf(IsNull(Rs(0)), "", Trim(Rs(0)))
            cboOper_Code.AddItem OperCD
            Rs.MoveNext
        Loop
        cboOper_Code.ListIndex = 0
    End If

    Rs.Close
    Set Rs = Nothing

    ComboOperCode = 0
    
    Exit Function
ErrMsg:
    cboOper_Code = -1
    MsgBox "�Լ�(ComboOperCode) Error" & vbCrLf & Err.Description
End Function

Public Function ComboDupNo(cboDupNo As ComboBox, cntrNo As String) As Integer
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    Dim DupNo As Integer
    Dim i As Integer
    
On Error GoTo ErrMsg
    
    SQL = "SELECT DISTINCT(dup_no) FROM t_cntr"
    SQL = SQL & " WHERE cntr_no = '" & Trim(cntrNo) & "'"
    SQL = SQL & " ORDER BY dup_no"
    
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    
    i = 0
    cboDupNo.Clear
    If Rs.EOF Then
        Rs.Close
        Set Rs = Nothing
        ComboDupNo = 1
        Exit Function
    Else
        Rs.MoveFirst
        Do While Not Rs.EOF
            i = i + 1
            DupNo = IIf(IsNull(Rs(0)), 0, Trim(Rs(0)))
            cboDupNo.AddItem DupNo
            Rs.MoveNext
        Loop
        cboDupNo.ListIndex = i - 1
    End If

    Rs.Close
    Set Rs = Nothing

    ComboDupNo = 0

    Exit Function
ErrMsg:
    ComboDupNo = -1
    MsgBox "�Լ�(ComboDupNo) Error(T_CNTR)" & vbCrLf & Err.Description
End Function

Public Sub ComboRoute_Code(cboRoute_Code As ComboBox)        ' �׷��ڵ�
    cboRoute_Code.Clear
    cboRoute_Code.AddItem "����"           'BU
    cboRoute_Code.AddItem "����"           'EC
    cboRoute_Code.AddItem "������"         'MD
    cboRoute_Code.AddItem "ȣ��"           'OA
    cboRoute_Code.AddItem "�ߵ�"           'ME
    cboRoute_Code.AddItem "�ƽþ�"         'EA
    cboRoute_Code.AddItem "������ī"       'FE
End Sub

Public Sub ComboBanip_Code(cboBanip_Code As ComboBox)        ' �����ڵ�
    cboBanip_Code.Clear
    cboBanip_Code.AddItem ""
    cboBanip_Code.AddItem "10"
    cboBanip_Code.AddItem "11"
    cboBanip_Code.AddItem "20"
    cboBanip_Code.AddItem "21"
    cboBanip_Code.AddItem "22"
    cboBanip_Code.AddItem "23"
    cboBanip_Code.AddItem "30"
    cboBanip_Code.AddItem "40"
End Sub

Public Sub ComboBanip_CodeDes(cboBanip_CodeDes As ComboBox)
    cboBanip_CodeDes.Clear
    cboBanip_CodeDes.AddItem ""
    cboBanip_CodeDes.AddItem "���׹���"
    cboBanip_CodeDes.AddItem "����ȭ������"
    cboBanip_CodeDes.AddItem "������۹���"
    cboBanip_CodeDes.AddItem "�̰����"
    cboBanip_CodeDes.AddItem "BWT��ǰB/L����/�պ�����"
    cboBanip_CodeDes.AddItem "�ϰ����Ź�ǰB/L���ҹ���"
    cboBanip_CodeDes.AddItem "�����㰡����"
    cboBanip_CodeDes.AddItem "�м�ǰ��������"
End Sub

Public Sub ComboBanch_Code(cboBanch_Code As ComboBox)
    cboBanch_Code.Clear
    cboBanch_Code.AddItem ""
    cboBanch_Code.AddItem "50"
    cboBanch_Code.AddItem "51"
    cboBanch_Code.AddItem "52"
    cboBanch_Code.AddItem "53"
    cboBanch_Code.AddItem "54"
    cboBanch_Code.AddItem "55"
    cboBanch_Code.AddItem "60"
    cboBanch_Code.AddItem "61"
    cboBanch_Code.AddItem "62"
    cboBanch_Code.AddItem "63"
    cboBanch_Code.AddItem "70"
    cboBanch_Code.AddItem "71"
    cboBanch_Code.AddItem "72"
    cboBanch_Code.AddItem "80"
    cboBanch_Code.AddItem "81"
    cboBanch_Code.AddItem "82"
    cboBanch_Code.AddItem "83"
    cboBanch_Code.AddItem "90"
End Sub

Public Sub ComboBanch_CodeDes(cboBanch_CodeDes As ComboBox)
    cboBanch_CodeDes.Clear
    cboBanch_CodeDes.AddItem ""
    cboBanch_CodeDes.AddItem "���ԽŰ�����Ĺ���"
    cboBanch_CodeDes.AddItem "���ԽŰ����������"
    cboBanch_CodeDes.AddItem "B/L�����ε���ǰ����"
    cboBanch_CodeDes.AddItem "������Ư�۹�ǰ����"
    cboBanch_CodeDes.AddItem "����ǰ�����㰡����"
    cboBanch_CodeDes.AddItem "����ǰ���԰˻����"
    cboBanch_CodeDes.AddItem "������۹���"
    cboBanch_CodeDes.AddItem "�̰����"
    cboBanch_CodeDes.AddItem "BWT��ǰB/L����/�պ�����"
    cboBanch_CodeDes.AddItem "�ϰ����Ź�ǰB/L���ҹ���"
    cboBanch_CodeDes.AddItem "���ȭ����������"
    cboBanch_CodeDes.AddItem "�ݼ�ȭ�ҹ���"
    cboBanch_CodeDes.AddItem "�����㰡����"
    cboBanch_CodeDes.AddItem "�갢������"
    cboBanch_CodeDes.AddItem "���Ź���"
    cboBanch_CodeDes.AddItem "����ͼӹ���"
    cboBanch_CodeDes.AddItem "üȭ������"
    cboBanch_CodeDes.AddItem "�м�ǰ����"
End Sub

Public Sub ComboTemp_ChkErrCD(cboChkCode As ComboBox)
    Dim ErrDes As String
    Dim i As Integer
    
    cboChkCode.Clear
    For i = 0 To 4
        ErrDes = Temp_ChkErrDes(i)
        cboChkCode.AddItem ErrDes
    Next i
    cboChkCode.ListIndex = 0
End Sub

Public Function Temp_ChkErrDes(ErrCode As Integer) As String
    Select Case ErrCode
        Case 0: Temp_ChkErrDes = "����"
        Case 1: Temp_ChkErrDes = "PLUG"
        Case 2: Temp_ChkErrDes = "�õ���"
        Case 3: Temp_ChkErrDes = "����"
        Case 4: Temp_ChkErrDes = "��Ÿ"
        Case Else: Temp_ChkErrDes = " "
    End Select
End Function


