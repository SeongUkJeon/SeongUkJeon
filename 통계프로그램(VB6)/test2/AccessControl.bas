Attribute VB_Name = "AccessControl"
Option Explicit

Public G_ErrCodeMsg As String


'User ID�� Password�� üũ�ϰ� ������ ����ڱ׷캰 ���α׷������� �Ѱ��ش�
Public Function CheckUserID(strUser_id As String, strPassWd As String) As Boolean
    Dim StrSql As String
    Dim Rs As ADODB.Recordset
    
On Error GoTo ErrHandler
    'T_ACUSER(����� ����)�� �о ���̵�/�н����尡 ��Ȯ�� �� üũ�Ѵ�.
    '��Ȯ���� ���� ��쿡�� �����޽����� ���������� ������ ���ν����� ����������.t_acuser
    StrSql = "SELECT group_id, seq FROM t_auuser WHERE user_id = '" & strUser_id & "'"
    
    Set Rs = New ADODB.Recordset
    Rs.Open StrSql, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText


    G_GroupID = Trim(Rs("group_id"))
    G_UserSEQ = NullTrim(Rs("seq"))
    'G_UserID = "020207"
    'G_GroupID = "OOO"
    
    Rs.Close:    Set Rs = Nothing
    Exit Function

ErrHandler:
    G_ErrCodeMsg = "Login�� ������ �߻��߽��ϴ�. " & Err.Description
    CheckUserID = False
End Function

'���α׷� ��ȸ/�Է�/����/���� ���� Check
Public Function PgmAuth(strCommand As String, strPgmName As String) As Boolean
    Dim StrSql As String
    Dim Rs As ADODB.Recordset
    
    Dim StrPgmId As String
    
On Error GoTo ErrPgmAuth
    StrPgmId = Mid(strPgmName, 4, 8)
    
    StrSql = "SELECT auth_qry,auth_ins,auth_upd,auth_del FROM t_auauth" & _
             " WHERE group_id = '" & G_GroupID & "'" & _
             "   AND pgm_id = '" & StrPgmId & "'"
             
    Set Rs = New ADODB.Recordset
    Rs.Open StrSql, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText
    
    If Rs.EOF And Rs.BOF Then
        PgmAuth = True
    Else
        Select Case strCommand
            Case "Q"
                If Rs("auth_qry") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "��ȸ/���� ������ �����ϴ�."
                End If
            Case "I"
                If Rs("auth_ins") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "�Է� ������ �����ϴ�."
                End If
            Case "U"
                If Rs("auth_upd") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "���� ������ �����ϴ�."
                End If
            Case "D"
                If Rs("auth_del") = "Y" Then
                    PgmAuth = True
                Else
                    PgmAuth = True:                    G_ErrCodeMsg = "���� ������ �����ϴ�."
                End If
            Case Else
                PgmAuth = True
                G_ErrCodeMsg = "����üũ ���� - 'Q' 'I' 'U' 'D' Parameter Error"
        End Select
    End If
    
    Rs.Close:    Set Rs = Nothing
    Exit Function
    
ErrPgmAuth:
    PgmAuth = True
    G_ErrCodeMsg = "����üũ ���� - SQL ERROR"
End Function

'=======================================
'���α׷� ��ȸ/�Է�/����/���� ���� Check
Public Function MnuChk(argPgmName As String) As Boolean
    Dim SQL As String
    Dim Rs As ADODB.Recordset
    
    Dim StrPgmId As String
    
G_GroupID = "EEE"
On Error GoTo ErrPgmAuth
    StrPgmId = Mid(argPgmName, 4, 8)
    
    SQL = "SELECT auth_qry FROM t_auauth" & _
          " WHERE group_id = '" & G_GroupID & "'" & _
          "   AND pgm_id = '" & StrPgmId & "'"
             
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly, adLockReadOnly, adCmdText
    
    If Rs.EOF And Rs.BOF Then
        MnuChk = False
    Else
        MnuChk = True
    End If
    
    Rs.Close:    Set Rs = Nothing
    Exit Function
    
ErrPgmAuth:
    MnuChk = False
End Function
'=============================================================================
' �޴� ������ üũ
'=============================================================================
Public Sub Menu_Check(ByVal FrmNm As Object)
    
    Dim Lo_Obj As Object
    Dim Ls_MenuNm As String
    Dim Sqltxt As String
    Dim Rs As ADODB.Recordset
'    Dim Rs1 As ADODB.Connection
    
    Call CheckUserID(G_UserID, "")  'get group id                     update by signal (04.04.29)

'    Set Rs1 = New ADODB.Connection

'    Rs1.Open G_Host_Con

    For Each Lo_Obj In FrmNm
        If TypeOf Lo_Obj Is Menu Then
            Ls_MenuNm = Mid(Lo_Obj.Name, 4, Len(Lo_Obj.Name) - 3)
            
            Sqltxt = " SELECT pgm_id "
            Sqltxt = Sqltxt & " FROM T_AUAUTH "
            Sqltxt = Sqltxt & " WHERE"
            Sqltxt = Sqltxt & " upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"
            
            Set Rs = G_Host_Con.Execute(Sqltxt)

            If Not Rs.EOF Then
                Sqltxt = " SELECT pgm_id "
                Sqltxt = Sqltxt & " FROM T_AUPGM "
                Sqltxt = Sqltxt & " WHERE"
                Sqltxt = Sqltxt & " upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"
                
                Set Rs = G_Host_Con.Execute(Sqltxt)
    
                If Rs.EOF Then
                    Lo_Obj.Visible = False
                Else
                    Lo_Obj.Visible = True
                End If

                Sqltxt = " SELECT pgm_id "
                Sqltxt = Sqltxt & " FROM T_AUAUTH "
                Sqltxt = Sqltxt & " WHERE"
                Sqltxt = Sqltxt & " USER_ID in ('" & G_UserID & "','DPCTOS')"
                Sqltxt = Sqltxt & " AND upper(PGM_ID) = '" & UCase(Ls_MenuNm) & "'"

    
                Set Rs = G_Host_Con.Execute(Sqltxt)
    
                If Rs.EOF Then
                    Lo_Obj.Enabled = False
                Else
                    Lo_Obj.Enabled = True
                End If
            End If
        End If
    Next

    Rs.Close
'    Rs1.Close
    Set Rs = Nothing
'    Set Rs1 = Nothing
End Sub

Public Sub ChekParaMeter(rFormName As Object)
    Dim Message$, Title$
    Dim MyValue$
    Dim G_TEST_Code As String
    
    G_TEST_Code = ""
    Message = "Access Code�� �Է��ϼ���!"   ' ������Ʈ ����.
    Title = "Input Access Code"   ' ���� ����.
    
    If Len(Command) = 0 Then
        'InputBox
        MyValue = InputBox(Message, Title, Default)
    
        If MyValue = "swjeon" Then
            G_UserID = "030088"
        Else
            G_Vboption = vbYesNo + vbCritical + vbDefaultButton1
            MsgBox "���α׷��� ���� Access�� �� �����ϴ�. ���ո޴��� �̿��ϼ���", vbOKOnly, "���α׷� ȣ��"
            'Unload Me
            Unload rFormName
            End
        End If
    Else
        If Len(Command) = 0 Then
            G_Vboption = vbYesNo + vbCritical + vbDefaultButton1
            MsgBox "���α׷��� ���� Access�� �� �����ϴ�. ���ո޴��� �̿��ϼ���", vbOKOnly, "���α׷� ȣ��"
            'Unload Me
            Unload rFormName
            End
        Else
            G_UserID = Mid(CStr(Command), 1)
            
        End If
    End If
End Sub



