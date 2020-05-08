VERSION 5.00
Object = "{B02F3647-766B-11CE-AF28-C3A2FBE76A13}#3.0#0"; "SPR32X30.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "THREED32.OCX"
Begin VB.Form frmTotal 
   BorderStyle     =   1  '단일 고정
   Caption         =   "일일 작업 집계"
   ClientHeight    =   8865
   ClientLeft      =   2880
   ClientTop       =   4035
   ClientWidth     =   15615
   FillColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8865
   ScaleWidth      =   15615
   Begin VB.CommandButton cmdExit 
      Caption         =   "닫기"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   14520
      TabIndex        =   10
      Top             =   360
      Width           =   855
   End
   Begin VB.CommandButton cmdQuery 
      Caption         =   "조회"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   13320
      TabIndex        =   9
      Top             =   360
      Width           =   855
   End
   Begin VB.ComboBox cboOper_cd 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   5760
      TabIndex        =   8
      Top             =   480
      Width           =   1575
   End
   Begin VB.TextBox txtDay 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   3
      Top             =   480
      Width           =   735
   End
   Begin VB.TextBox txtMonth 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   2
      Top             =   480
      Width           =   735
   End
   Begin VB.TextBox txtYear 
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   480
      Width           =   975
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6975
      Left            =   240
      TabIndex        =   0
      Top             =   1560
      Width           =   15135
      _ExtentX        =   26696
      _ExtentY        =   12303
      _Version        =   393216
      TabHeight       =   520
      TabCaption(0)   =   "Yard 장치 현황"
      TabPicture(0)   =   "frmTotal.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "spsYardSum(0)"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "SSPanel1"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "SSPanel2"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "SSPanel3"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "SSPanel4"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "SSPanel5"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "SSPanel6"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).ControlCount=   7
      TabCaption(1)   =   "작업현황"
      TabPicture(1)   =   "frmTotal.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "SSPanel7"
      Tab(1).Control(1)=   "SSPanel8"
      Tab(1).Control(2)=   "SSPanel9"
      Tab(1).Control(3)=   "SSPanel11"
      Tab(1).Control(4)=   "SSPanel12"
      Tab(1).Control(5)=   "spslist(0)"
      Tab(1).Control(6)=   "SSPanel10"
      Tab(1).ControlCount=   7
      TabCaption(2)   =   "월별 작업현황"
      TabPicture(2)   =   "frmTotal.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "vaSpread1"
      Tab(2).ControlCount=   1
      Begin FPSpread.vaSpread vaSpread1 
         Height          =   4695
         Left            =   -73080
         TabIndex        =   25
         Top             =   1440
         Width           =   11175
         _Version        =   196608
         _ExtentX        =   19711
         _ExtentY        =   8281
         _StockProps     =   64
         BackColorStyle  =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   33
         MaxRows         =   8
         Protect         =   0   'False
         ScrollBars      =   1
         SpreadDesigner  =   "frmTotal.frx":0054
         UserResize      =   1
      End
      Begin Threed.SSPanel SSPanel6 
         Height          =   495
         Left            =   2800
         TabIndex        =   18
         Top             =   960
         Width           =   2200
         _Version        =   65536
         _ExtentX        =   3881
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "FULL"
         BackColor       =   14737632
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel5 
         Height          =   495
         Left            =   5000
         TabIndex        =   17
         Top             =   960
         Width           =   2220
         _Version        =   65536
         _ExtentX        =   3916
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "EMPTY"
         BackColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel4 
         Height          =   495
         Left            =   7220
         TabIndex        =   16
         Top             =   960
         Width           =   1455
         _Version        =   65536
         _ExtentX        =   2566
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "냉동"
         BackColor       =   16777152
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel3 
         Height          =   495
         Left            =   11615
         TabIndex        =   15
         Top             =   960
         Width           =   1470
         _Version        =   65536
         _ExtentX        =   2593
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "TOTAL"
         BackColor       =   16761087
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel2 
         Height          =   495
         Left            =   10150
         TabIndex        =   14
         Top             =   960
         Width           =   1455
         _Version        =   65536
         _ExtentX        =   2558
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "장척"
         BackColor       =   16761024
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel1 
         Height          =   495
         Left            =   8650
         TabIndex        =   13
         Top             =   960
         Width           =   1500
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "위험물"
         BackColor       =   8421631
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin FPSpread.vaSpread spsYardSum 
         Height          =   4725
         Index           =   0
         Left            =   1920
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   1440
         Width           =   11175
         _Version        =   196608
         _ExtentX        =   19711
         _ExtentY        =   8334
         _StockProps     =   64
         BackColorStyle  =   1
         ColHeaderDisplay=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림체"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   14
         MaxRows         =   6
         ScrollBars      =   0
         SpreadDesigner  =   "frmTotal.frx":0B5E
         UserResize      =   0
      End
      Begin Threed.SSPanel SSPanel7 
         Height          =   495
         Left            =   -72600
         TabIndex        =   19
         Top             =   960
         Width           =   1725
         _Version        =   65536
         _ExtentX        =   3043
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "FULL"
         BackColor       =   14737632
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel8 
         Height          =   495
         Left            =   -70920
         TabIndex        =   20
         Top             =   960
         Width           =   1740
         _Version        =   65536
         _ExtentX        =   3069
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "EMPTY"
         BackColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel9 
         Height          =   495
         Left            =   -67560
         TabIndex        =   21
         Top             =   960
         Width           =   1095
         _Version        =   65536
         _ExtentX        =   1931
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "냉동"
         BackColor       =   16777152
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel11 
         Height          =   495
         Left            =   -66480
         TabIndex        =   22
         Top             =   960
         Width           =   1140
         _Version        =   65536
         _ExtentX        =   2011
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "위험물"
         BackColor       =   8421631
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Threed.SSPanel SSPanel12 
         Height          =   495
         Left            =   -64200
         TabIndex        =   23
         Top             =   960
         Width           =   1095
         _Version        =   65536
         _ExtentX        =   1931
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "보세"
         BackColor       =   16761024
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin FPSpread.vaSpread spslist 
         Height          =   4755
         Index           =   0
         Left            =   -73080
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   1440
         Width           =   11145
         _Version        =   196608
         _ExtentX        =   19659
         _ExtentY        =   8387
         _StockProps     =   64
         BackColorStyle  =   1
         ColHeaderDisplay=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림체"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MaxCols         =   25
         MaxRows         =   8
         ScrollBars      =   0
         SpreadDesigner  =   "frmTotal.frx":1556
         UserResize      =   0
      End
      Begin Threed.SSPanel SSPanel10 
         Height          =   495
         Left            =   -63120
         TabIndex        =   26
         Top             =   960
         Width           =   1215
         _Version        =   65536
         _ExtentX        =   2143
         _ExtentY        =   873
         _StockProps     =   15
         Caption         =   "TOTAL"
         BackColor       =   16761087
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Label Label6 
      Alignment       =   2  '가운데 맞춤
      Caption         =   "D P C T"
      BeginProperty Font 
         Name            =   "@새굴림"
         Size            =   36
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   9960
      TabIndex        =   11
      Top             =   240
      Width           =   2775
   End
   Begin VB.Line Line4 
      X1              =   7440
      X2              =   7440
      Y1              =   960
      Y2              =   360
   End
   Begin VB.Line Line3 
      X1              =   7440
      X2              =   240
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Line Line2 
      X1              =   240
      X2              =   240
      Y1              =   960
      Y2              =   360
   End
   Begin VB.Line Line1 
      X1              =   240
      X2              =   7440
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Label Label4 
      Caption         =   "선사"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4920
      TabIndex        =   7
      Top             =   480
      Width           =   735
   End
   Begin VB.Label Label3 
      Caption         =   "일"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4320
      TabIndex        =   6
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label2 
      Caption         =   "월"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2880
      TabIndex        =   5
      Top             =   480
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "년"
      BeginProperty Font 
         Name            =   "새굴림"
         Size            =   15
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   4
      Top             =   480
      Width           =   375
   End
End
Attribute VB_Name = "frmTotal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim F_Init As Boolean
Dim F_CYTP_SQL As String
Dim F_Date As String
Dim ThisYear As String

Private Sub cboOper_cd_Click()
    If F_Init = False Then
        cmdQuery.SetFocus
    End If
End Sub

Private Sub cmdExit_Click()
    Call Exit_Form(frmTotal)
End Sub

Private Sub cmdQuery_Click()
    Dim F_Date As String
    
    F_Date = txtYear.Text & txtMonth.Text & txtDay.Text
    
    If Not DateCheck(F_Date) Then
        txtYear.Text = ""
        txtMonth.Text = ""
        txtDay.Text = ""
        Exit Sub
    Else
        If Not Check_ComboList(cboOper_cd) Then
            MsgBox "올바른 선사코드를 입력하십시요", vbExclamation, Me.Caption
            Exit Sub
        End If
    End If
        
    F_CYTP_SQL = "  and cy_tp = 'D' "
    
    If SSTab1.Tab = 0 Then
        Call Sps_Option(spsYardSum(0), 2)
        Call Query_Tab0
    ElseIf SSTab1.Tab = 1 Then
        Call Sps_Option(spslist(0), 2)
        Call Query_Tab1
    ElseIf SSTab1.Tab = 2 Then
        Call Sps_Option(vaSpread1, 2)
        Call Query_Tab2
    End If
End Sub

Private Sub Form_Load()
    F_Init = True

    Call GetHostDateTime
    ThisYear = Mid(Trim(G_CurrentDate), 1, 4)
    txtYear.Text = ThisYear
    txtMonth.Text = Mid(Trim(G_CurrentDate), 5, 2)
    txtDay.Text = Mid(Trim(G_CurrentDate), 7, 2)
    
    Call ComboOperCd(cboOper_cd)
    If cboOper_cd.ListCount > 0 Then
        cboOper_cd.AddItem "*", 0
        cboOper_cd.ListIndex = 0
    End If
        
    SSTab1.Tab = 0
    
    spsYardSum(0).Clip = "No"
    Call Sps_Option(spsYardSum(0), 9)
    
    Call setColmnName(spsYardSum(0), 14, "spsYardSum(0)")

    F_Init = False
End Sub

Private Function Query_Tab0() As Boolean
    Dim Rs As ADODB.Recordset
    Dim SQL As String
   
    Dim V_cnt As Integer
    Dim i As Integer
    Dim j As Integer
    Dim v_oper_cd As String
    Dim TTL As Integer
    
    F_Date = txtYear.Text & txtMonth.Text & txtDay.Text
    
On Error GoTo Query_Tab0_Err
    
    Screen.MousePointer = 11
    
    SQL = " select ix_cd,sum(f20_qty) f2, sum(f40_qty) f4, sum(f45_qty) f5,"
    SQL = SQL & " sum(m20_qty) m2, sum(m40_qty) m4, sum(m45_qty) m5,"
    SQL = SQL & " sum(decode(rf_cd,'Y',f20_qty)) rf2,sum(decode(rf_cd,'Y',f40_qty+f45_qty)) rf4,"
    SQL = SQL & " sum(decode(imdg,'Y',f20_qty)) im2,sum(decode(imdg,'Y',f40_qty+f45_qty)) im4,"
    SQL = SQL & " sum(decode(ak_cd,'Y',f20_qty)) ak2,sum(decode(ak_cd,'Y',f40_qty+f45_qty)) ak4,"
    SQL = SQL & " sum(f20_qty+f40_qty+f45_qty+m20_qty+m40_qty+m45_qty) van,"
    SQL = SQL & " sum(f20_qty+m20_qty)+sum(f40_qty+f45_qty+m40_qty+m45_qty)*2 teu"
    SQL = SQL & " From t_yardsm"
    SQL = SQL & " where sum_date = '" & txtYear.Text & "'||'" & txtMonth.Text & "'||'" & txtDay.Text & "'" & F_CYTP_SQL
    If cboOper_cd.Text = "*" Or cboOper_cd.Text = "" Then
    
    Else
        SQL = SQL & " and oper_cd = '" & cboOper_cd.Text & "'"
    End If
    SQL = SQL & " group by ix_cd"

    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con
    If Rs.EOF Then
        MsgBox "해당자료가 없습니다", 64, Me.Caption
        Screen.MousePointer = 0
        Query_Tab0 = False
    Else
        V_cnt = 1
        i = 1
        j = 0
                       
        Rs.MoveFirst
        V_cnt = 1
        Do While Not Rs.EOF
            spsYardSum(0).MaxRows = 6
            Select Case Rs(0)
            Case "I"
                spsYardSum(0).row = 1
            Case "X"
                spsYardSum(0).row = 2
            Case "T"
                spsYardSum(0).row = 3
            Case "S"
                spsYardSum(0).row = 4
            Case "M"
                spsYardSum(0).row = 5
            End Select
            For i = 0 To spsYardSum(0).MaxCols - 1
                spsYardSum(0).col = i + 1
                spsYardSum(0).Text = IIf(IsNull(Rs(i + 1)), "", Rs(i + 1))
            Next i
            Rs.MoveNext
        Loop
        
        For j = 1 To spsYardSum(0).MaxCols
            spsYardSum(0).col = j
            TTL = 0
            For i = 1 To 5
                spsYardSum(0).row = i
                TTL = TTL + IIf(IsNull(spsYardSum(0).Text), 0, Val(spsYardSum(0).Text))
            Next i
            spsYardSum(0).row = 6
            spsYardSum(0).Text = TTL
        Next j
        
        Screen.MousePointer = 0
        Query_Tab0 = True
        
    End If
    
    Rs.Close
    Set Rs = Nothing
    
    Exit Function
        
Query_Tab0_Err:
    Query_Tab0 = False
    Screen.MousePointer = 0
    MsgBox "장치현황 조회 에러" & vbCrLf & Err.Description
End Function

Private Function Query_Tab1() As Boolean
    Dim Rs As ADODB.Recordset
    Dim SQL As String
    
    Dim v_oper_cd As String
    Dim i As Integer, j As Integer
    Dim V_cnt As Integer
    Dim PreDate As String
    
On Error GoTo Query_Tab1_Err
    
    F_Date = txtYear.Text & txtMonth.Text & txtDay.Text
   
    Screen.MousePointer = 11
    If cboOper_cd = "*" Or cboOper_cd = "" Then
        v_oper_cd = "%"
    Else
        v_oper_cd = cboOper_cd
    End If
    
'1:양하 2:적하 3:반입 4:반출 5:반송 6:구내이적 7:T/S(수입) 8:T/S(수출) 9:SHIFT1 10:SHIFT2
    SQL = "select  순서, sum(decode(fm_cd || substr(sz_cd,1,1),'F2', 1,0)) F20," & _
          "        sum(decode(fm_cd || substr(sz_cd,1,1),'F4', 1,0)) F40," & _
          "        sum(decode(fm_cd || substr(sz_cd,1,1),'F9', 1,'FL', 1,0)) F45," & _
          "        sum(decode(fm_cd || substr(sz_cd,1,1),'M2', 1,0)) M20," & _
          "        sum(decode(fm_cd || substr(sz_cd,1,1),'M4', 1,0)) M40," & _
          "        sum(decode(fm_cd || substr(sz_cd,1,1),'M9', 1,'ML', 1,0)) M45," & _
          "        sum(decode(substr(sz_cd,1,1) || 야간,'2NG', 1,0)) ng20," & _
          "        sum(decode(substr(sz_cd,1,1) || 야간,'4NG', 1,0)) ng40," & _
          "        sum(decode(substr(sz_cd,1,1) || 야간,'9NG', 1,'LNG', 1,0)) ng45," & _
          "        sum(decode(substr(sz_cd,1,1),'2', decode(trim(temp), null,0,1),0)) rf20," & _
          "        sum(decode(substr(sz_cd,1,1),'2', 0, decode(trim(temp), null,0,1))) rf40," & _
          "        sum(decode(substr(sz_cd,1,1),'2', decode(trim(imdg), null,0,1),0)) dg20," & _
          "        sum(decode(substr(sz_cd,1,1),'2', 0, decode(trim(imdg), null,0,1))) dg40," & _
          "        sum(decode(substr(sz_cd,1,1),'2', decode(trim(hwl_cd), null,0,'0',0,1),0)) sp20," & _
          "        sum(decode(substr(sz_cd,1,1),'2', 0, decode(trim(hwl_cd), null,0,'0',0,1))) sp40," & _
          "        sum(decode(substr(sz_cd,1,1),'2', decode(trim(bond_id), null,0,1),0)) bo20," & _
          "        sum(decode(substr(sz_cd,1,1),'2', 0, decode(trim(bond_id), null,0,1))) bo40," & _
          "        count(*) van, sum(decode(substr(sz_cd,1,1),'2',1,2)) teu"

'반입(7-->3)
    SQL = SQL + "  from ( select '3' 순서, cntr_no, dup_no, ship_cd, call_yy, call_no, oper_cd, ts_id, cur_stat, ' ' rtn_cd," & _
          "                  fm_cd, sz_cd, temp, imdg, hwl_cd, shift_tm, bond_id, to_char(gin_dt, 'yyyy/mm/dd') wk_date," & _
          "                  '1' 구분,  ' ' 야간, y_tblock" & _
          "            from t_cntr"
       
    SQL = SQL + " where gin_dt between to_date('" & F_Date & "', 'YYYYMMDDHH24') and to_date('" & F_Date & "','YYYYMMDDHH24') + 1 "
    SQL = SQL + " and trn_in in ('D','C') and trn_in != 'A' "
    
'반출 또는 반송
    SQL = SQL + "         union all" & _
          "          select decode(nvl(rtn_cd,' '), 'R', '5',  '4' ) 순서, cntr_no, dup_no, ship_cd, call_yy, call_no," & _
          "                  oper_cd, ts_id, cur_stat, rtn_cd, fm_cd, sz_cd, temp, imdg, hwl_cd, shift_tm, bond_id," & _
          "                  to_char(gout_dt, 'yyyy/mm/dd') wk_date, '2' 구분, ' ' 야간, y_tblock" & _
          "            from t_cntr"
          
   SQL = SQL + " where gout_dt between to_date('" & F_Date & "', 'YYYYMMDDHH24') and to_date('" & F_Date & "','YYYYMMDDHH24') + 1 "
   SQL = SQL + " and trn_out in ('D','C') and trn_out != 'A' "
      
'구내이적
    SQL = SQL + "         union all"
    
      SQL = SQL + " SELECT '6' 순서, a.cntr_no, a.dup_no, a.ship_cd, a.call_yy, a.call_no," & _
            "                  a.oper_cd, a.ts_id, a.cur_stat, a.rtn_cd, a.fm_cd, a.sz_cd, a.temp, a.imdg, a.hwl_cd, a.shift_tm, a.bond_id," & _
            "                  to_char(B.F_WK_DT, 'yyyy/mm/dd') wk_date, '5' 구분, ' ' 야간"
      SQL = SQL + ", 'T' y_tblock"
      
      SQL = SQL + " FROM t_cntr a,  "
      SQL = SQL & " (SELECT CNTR_NO,"
      SQL = SQL & "        DUP_NO,"
      SQL = SQL & "        F_WK_CD,"
      SQL = SQL & "        F_WK_DT,"
      SQL = SQL & "        F_YARD_LOC,"
      SQL = SQL & "        T_WK_CD,"
      SQL = SQL & "        T_WK_DT,"
      SQL = SQL & "        T_YARD_LOC"
      SQL = SQL & "   FROM (SELECT A.CNTR_NO,"
      SQL = SQL & "                A.DUP_NO,"
      SQL = SQL & "                A.WK_CD F_WK_CD,"
      SQL = SQL & "                A.WK_DT F_WK_DT,"
      SQL = SQL & "                A.YARD_LOC F_YARD_LOC,"
      SQL = SQL & "                B.WK_CD T_WK_CD,"
      SQL = SQL & "                B.WK_DT T_WK_DT,"
      SQL = SQL & "                B.YARD_LOC T_YARD_LOC,"
      SQL = SQL & "                RANK() OVER(PARTITION BY A.CNTR_NO, A.DUP_NO, A.WK_CD, A.WK_DT, A.YARD_LOC, B.WK_CD ORDER BY B.WK_DT ASC) RNK"
      SQL = SQL & "           FROM T_TCLOG A, T_TCLOG B"
      SQL = SQL & "          WHERE A.CNTR_NO = B.CNTR_NO AND A.DUP_NO = B.DUP_NO AND"
      SQL = SQL & "                A.WK_CD = 'B' AND A.IM_CD IS NULL AND B.WK_CD = 'E' AND"
      SQL = SQL & "                A.WK_DT < B.WK_DT AND"
      SQL = SQL & "                A.wk_dt between to_date('" & F_Date & "', 'YYYYMMDDHH24') and"
      SQL = SQL & "                to_date('" & F_Date & "', 'YYYYMMDDHH24') + 1 AND"
      SQL = SQL & "                B.wk_dt between to_date('" & F_Date & "', 'YYYYMMDDHH24') and"
      SQL = SQL & "                to_date('" & F_Date & "', 'YYYYMMDDHH24') + 1"
      SQL = SQL & "         )"
      SQL = SQL & "  WHERE RNK = 1) B"
      SQL = SQL + " WHERE a.cntr_no = b.cntr_no AND A.DUP_NO = B.DUP_NO"
      
      SQL = SQL & "  and (substr(b.f_yard_loc, 1, 1) not in ('S', 'V', 'D', 'R') or substr(b.t_yard_loc, 1, 1) not in ('S', 'V', 'D', 'R'))"
  
'T/S(수입) 또는 양하
    SQL = SQL & "         union all"
    SQL = SQL & "          select decode(nvl(ts_id,' '), '1', '7', '2', '7', '1' ) 순서, cntr_no, dup_no, c.ship_cd, c.call_yy,"
    SQL = SQL & "                  c.call_no, c.oper_cd, ts_id, cur_stat, rtn_cd, fm_cd, sz_cd, temp, imdg, hwl_cd, shift_tm,"
    SQL = SQL & "                  bond_id, to_char(gc_ddt, 'yyyy/mm/dd') wk_date, '3' 구분, "
    SQL = SQL & "                  decode(nvl(overd_cd,'  '), '  ', 'DA','NG') 야간, y_tblock"
    SQL = SQL & "            from t_cntr c, t_vescall v"
    SQL = SQL & " where c.ship_cd = v.ship_cd and c.call_yy = v.call_yy and c.call_no = v.call_no and (v.ex_tmnl is null or (v.ex_tmnl is not null and v.cancel_yn is null)) and "
    SQL = SQL & " gc_ddt between to_date('" & F_Date & "', 'YYYYMMDDHH24') and to_date('" & F_Date & "','YYYYMMDDHH24') + 1"
                   
'적하 또는 T/S(수출) 또는 SHIFT1 또는 SHIFT2
    SQL = SQL & "         union all"
    SQL = SQL & "          select decode(nvl(ts_id,' ') || decode(trim(s_sind),null,' ',trim(s_sind)),"
    SQL = SQL & "                         '1 ', '8', '2 ', '8',' H', '9',' Y', '10', '2' ) 순서, cntr_no, dup_no, c.ship_cd,"
    SQL = SQL & "                  c.call_yy, c.call_no, c.oper_cd, ts_id, cur_stat, rtn_cd, fm_cd, sz_cd, temp, imdg, hwl_cd,"
    SQL = SQL & "                  shift_tm, bond_id, to_char(gc_ldt, 'yyyy/mm/dd') wk_date, '4' 구분, "
    SQL = SQL & "                  decode(nvl(overl_cd,'  '), '  ', 'DA','NG') 야간, y_tblock"
    SQL = SQL & "            from t_cntr c, t_vescall v"
    SQL = SQL & " where c.ship_cd = v.ship_cd and c.call_yy = v.call_yy and c.call_no = v.call_no and (v.ex_tmnl is null or (v.ex_tmnl is not null and v.cancel_yn is null)) and "
    SQL = SQL & " gc_ldt  between to_date('" & F_Date & "', 'YYYYMMDDHH24') and to_date('" & F_Date & "','YYYYMMDDHH24') + 1)"
    SQL = SQL & " where oper_cd like '" & v_oper_cd & "'"

    SQL = SQL & "  and substr(y_tblock, 1, 1) not in ('S', 'V', 'D', 'R')"
    
    SQL = SQL & " group by 순서"
    Set Rs = New ADODB.Recordset
    Rs.Open SQL, G_Host_Con, adOpenForwardOnly
    
    If Rs.EOF Then
        Query_Tab1 = False
        MsgBox "해당하는 자료가 없습니다", vbExclamation, Me.Caption
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Function
    Else
           
        For i = 1 To spslist(0).MaxRows
          For j = 1 To spslist(0).MaxCols
            spslist(0).row = i: spslist(0).col = j
            spslist(0).Text = ""
          Next j
        Next i
        
        Rs.MoveFirst
        V_cnt = 1
        Do While Not Rs.EOF
      
            For i = 0 To spslist(0).MaxCols
                If i <> 0 Then
                    spslist(0).SetText i, Rs(0), IIf(Rs(i) = 0, "", Rs(i))
                End If
            Next i
              
            V_cnt = V_cnt + 1
            If V_cnt = 6 Then
                V_cnt = V_cnt + 1
            End If
            
            Rs.MoveNext
        Loop
        
        Query_Tab1 = True

    End If

    Screen.MousePointer = 0
    
    Rs.Close
    Set Rs = Nothing
    
    For i = 1 To spslist(0).MaxCols
        Call fun_sps_rowsum(spslist(0), 1, spslist(0).MaxRows, i, spslist(0).MaxRows, 0)
    Next i
    
    Exit Function
        
Query_Tab1_Err:
    Query_Tab1 = False
    Screen.MousePointer = 0
    MsgBox "작업현황 조회 에러" & vbCrLf & Err.Description
End Function

Private Sub Query_Tab2()
    Dim Rs As ADODB.Recordset
      Dim SQL As String
      Dim sDate$, eDate$
      Dim I_Total_Van20 As Long, O_Total_Van20 As Long, S_Total_Van20 As Long
      Dim I_Total_Teu20 As Long, O_Total_Teu20 As Long, S_Total_Teu20 As Long
      Dim I_Total_Van40 As Long, O_Total_Van40 As Long, S_Total_Van40 As Long
      Dim I_Total_Teu40 As Long, O_Total_Teu40 As Long, S_Total_Teu40 As Long
      Dim Van_Total(1 To 31) As Long, Teu_Total(1 To 31) As Long
      Dim i%, idx%
      Dim tmpVan%, tmpTeu%
        
      On Error GoTo Query_Tab2_Err
       
      Screen.MousePointer = 11
      
      sDate = txtYear.Text & txtMonth.Text & "01"
      If txtMonth.Text = "12" Then
        eDate = Format(Val(txtYear.Text) + 1, "00") & "0101"
      Else
        eDate = txtYear.Text & Format(Val(txtMonth.Text) + 1, "00") & "01"
      End If
      
        SQL = "select gubun, wk_date, count(*) van, sum(decode(substr(sz_cd, 1, 1), '2', 1, 2)) teu"
        SQL = SQL & "   from (select '1' gubun,"
        SQL = SQL & "                to_char(gin_dt, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                sz_cd,"
        SQL = SQL & "                fm_cd,"
        SQL = SQL & "                y_tblock"
        SQL = SQL & "           from t_cntr"
        SQL = SQL & "          where gin_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') and"
        SQL = SQL & "                trn_in in ('D', 'C') and substr(sz_cd, 1,1) = '2'"
        SQL = SQL & "         union all"
        SQL = SQL & "         select '2' gubun,"
        SQL = SQL & "                to_char(gin_dt, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                sz_cd,"
        SQL = SQL & "                fm_cd,"
        SQL = SQL & "                y_tblock"
        SQL = SQL & "           from t_cntr"
        SQL = SQL & "          where gin_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') and"
        SQL = SQL & "                trn_in in ('D', 'C') and substr(sz_cd, 1,1) <> '2'"
        SQL = SQL & "         union all"
        SQL = SQL & "           select '3' gubun,"
        SQL = SQL & "                  to_char(gout_dt, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                  sz_cd,"
        SQL = SQL & "                  fm_cd,"
        SQL = SQL & "                  y_tblock"
        SQL = SQL & "             from t_cntr"
        SQL = SQL & "            where gout_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                  to_date('" & eDate & "', 'yyyymmdd') and"
        SQL = SQL & "                  trn_out in ('D', 'C') and nvl(rtn_cd, ' ') <> 'R' and substr(sz_cd, 1,1) = '2'"
        SQL = SQL & "         union all"
        SQL = SQL & "           select '4' gubun,"
        SQL = SQL & "                  to_char(gout_dt, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                  sz_cd,"
        SQL = SQL & "                  fm_cd,"
        SQL = SQL & "                  y_tblock"
        SQL = SQL & "             from t_cntr"
        SQL = SQL & "            where gout_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                  to_date('" & eDate & "', 'yyyymmdd') and"
        SQL = SQL & "                  trn_out in ('D', 'C') and nvl(rtn_cd, ' ') <> 'R' and substr(sz_cd, 1,1) <> '2'"
        SQL = SQL & "           union all"
        SQL = SQL & "             SELECT '5' gubun,"
        SQL = SQL & "                    to_char(n.F_WK_DT, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                    m.sz_cd,"
        SQL = SQL & "                    m.fm_cd,"
        SQL = SQL & "                    'V' y_tblock"
        SQL = SQL & "   FROM T_CNTR M,"
        SQL = SQL & "        (SELECT A.CNTR_NO,"
        SQL = SQL & "                A.DUP_NO,"
        SQL = SQL & "                A.WK_CD F_WK_CD,"
        SQL = SQL & "                A.WK_DT F_WK_DT,"
        SQL = SQL & "                A.YARD_LOC F_YARD_LOC,"
        SQL = SQL & "                B.WK_CD T_WK_CD,"
        SQL = SQL & "                B.WK_DT T_WK_DT,"
        SQL = SQL & "                B.YARD_LOC T_YARD_LOC,"
        SQL = SQL & "                RANK() OVER(PARTITION BY A.CNTR_NO, A.DUP_NO, A.WK_CD, A.WK_DT, A.YARD_LOC, B.WK_CD ORDER BY B.WK_DT ASC) RNK"
        SQL = SQL & "           FROM T_TCLOG A, T_TCLOG B"
        SQL = SQL & "          WHERE A.CNTR_NO = B.CNTR_NO AND A.DUP_NO = B.DUP_NO AND"
        SQL = SQL & "                A.WK_CD = 'B' AND A.IM_CD IS NULL AND B.WK_CD = 'E' AND"
        SQL = SQL & "                (B.WK_DT - A.WK_DT) * 24 * 60 * 60 = 1 AND"
        SQL = SQL & "                B.wk_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') AND A.YARD_LOC = B.YARD_LOC) N"
        SQL = SQL & "  WHERE M.CNTR_NO = N.CNTR_NO AND M.DUP_NO = N.DUP_NO AND N.RNK = 1 and substr(M.sz_cd, 1,1) = '2'"
        SQL = SQL & " UNION ALL "
        SQL = SQL & "             SELECT '5' gubun,"
        SQL = SQL & "                    to_char(n.F_WK_DT, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                    m.sz_cd,"
        SQL = SQL & "                    m.fm_cd,"
        SQL = SQL & "                    'V' y_tblock"
        SQL = SQL & "   FROM T_CNTR M,"
        SQL = SQL & "        (SELECT A.CNTR_NO,"
        SQL = SQL & "                A.DUP_NO,"
        SQL = SQL & "                A.WK_CD F_WK_CD,"
        SQL = SQL & "                A.WK_DT F_WK_DT,"
        SQL = SQL & "                A.YARD_LOC F_YARD_LOC,"
        SQL = SQL & "                B.WK_CD T_WK_CD,"
        SQL = SQL & "                B.WK_DT T_WK_DT,"
        SQL = SQL & "                B.YARD_LOC T_YARD_LOC,"
        SQL = SQL & "                RANK() OVER(PARTITION BY A.CNTR_NO, A.DUP_NO, A.WK_CD, A.WK_DT, A.YARD_LOC, B.WK_CD ORDER BY B.WK_DT ASC) RNK"
        SQL = SQL & "           FROM T_TCLOG A, T_TCLOG B"
        SQL = SQL & "          WHERE A.CNTR_NO = B.CNTR_NO AND A.DUP_NO = B.DUP_NO AND"
        SQL = SQL & "                A.WK_CD = 'B' AND A.IM_CD IS NULL AND B.WK_CD = 'E' AND"
        SQL = SQL & "                A.WK_DT < B.WK_DT AND"
        SQL = SQL & "                A.wk_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') AND"
        SQL = SQL & "                SUBSTR(A.YARD_LOC, 2, 1) IN ('D', 'V')) N"
        SQL = SQL & "  WHERE M.CNTR_NO = N.CNTR_NO AND M.DUP_NO = N.DUP_NO AND N.RNK = 1 and substr(M.sz_cd, 1,1) = '2'"
        SQL = SQL & " union all"
        SQL = SQL & "             SELECT '6' gubun,"
        SQL = SQL & "                    to_char(n.F_WK_DT, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                    m.sz_cd,"
        SQL = SQL & "                    m.fm_cd,"
        SQL = SQL & "                    'V' y_tblock"
        SQL = SQL & "   FROM T_CNTR M,"
        SQL = SQL & "        (SELECT A.CNTR_NO,"
        SQL = SQL & "                A.DUP_NO,"
        SQL = SQL & "                A.WK_CD F_WK_CD,"
        SQL = SQL & "                A.WK_DT F_WK_DT,"
        SQL = SQL & "                A.YARD_LOC F_YARD_LOC,"
        SQL = SQL & "                B.WK_CD T_WK_CD,"
        SQL = SQL & "                B.WK_DT T_WK_DT,"
        SQL = SQL & "                B.YARD_LOC T_YARD_LOC,"
        SQL = SQL & "                RANK() OVER(PARTITION BY A.CNTR_NO, A.DUP_NO, A.WK_CD, A.WK_DT, A.YARD_LOC, B.WK_CD ORDER BY B.WK_DT ASC) RNK"
        SQL = SQL & "           FROM T_TCLOG A, T_TCLOG B"
        SQL = SQL & "          WHERE A.CNTR_NO = B.CNTR_NO AND A.DUP_NO = B.DUP_NO AND"
        SQL = SQL & "                A.WK_CD = 'B' AND A.IM_CD IS NULL AND B.WK_CD = 'E' AND"
        SQL = SQL & "                (B.WK_DT - A.WK_DT) * 24 * 60 * 60 = 1 AND"
        SQL = SQL & "                B.wk_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') AND A.YARD_LOC = B.YARD_LOC) N"
        SQL = SQL & "  WHERE M.CNTR_NO = N.CNTR_NO AND M.DUP_NO = N.DUP_NO AND N.RNK = 1 and substr(M.sz_cd, 1,1) <> '2'"
        SQL = SQL & " UNION ALL "
        SQL = SQL & "             SELECT '6' gubun,"
        SQL = SQL & "                    to_char(n.F_WK_DT, 'yyyy/mm/dd') wk_date,"
        SQL = SQL & "                    m.sz_cd,"
        SQL = SQL & "                    m.fm_cd,"
        SQL = SQL & "                    'V' y_tblock"
        SQL = SQL & "   FROM T_CNTR M,"
        SQL = SQL & "        (SELECT A.CNTR_NO,"
        SQL = SQL & "                A.DUP_NO,"
        SQL = SQL & "                A.WK_CD F_WK_CD,"
        SQL = SQL & "                A.WK_DT F_WK_DT,"
        SQL = SQL & "                A.YARD_LOC F_YARD_LOC,"
        SQL = SQL & "                B.WK_CD T_WK_CD,"
        SQL = SQL & "                B.WK_DT T_WK_DT,"
        SQL = SQL & "                B.YARD_LOC T_YARD_LOC,"
        SQL = SQL & "                RANK() OVER(PARTITION BY A.CNTR_NO, A.DUP_NO, A.WK_CD, A.WK_DT, A.YARD_LOC, B.WK_CD ORDER BY B.WK_DT ASC) RNK"
        SQL = SQL & "           FROM T_TCLOG A, T_TCLOG B"
        SQL = SQL & "          WHERE A.CNTR_NO = B.CNTR_NO AND A.DUP_NO = B.DUP_NO AND"
        SQL = SQL & "                A.WK_CD = 'B' AND A.IM_CD IS NULL AND B.WK_CD = 'E' AND"
        SQL = SQL & "                A.WK_DT < B.WK_DT AND"
        SQL = SQL & "                A.wk_dt between to_date('" & sDate & "', 'YYYYMMDD') and"
        SQL = SQL & "                to_date('" & eDate & "', 'yyyymmdd') AND"
        SQL = SQL & "                SUBSTR(A.YARD_LOC, 2, 1) IN ('D', 'V')) N"
        SQL = SQL & "  WHERE M.CNTR_NO = N.CNTR_NO AND M.DUP_NO = N.DUP_NO AND N.RNK = 1 and substr(M.sz_cd, 1,1) <> '2'"
        SQL = SQL & " )"
        SQL = SQL & "  where substr(y_tblock, 2, 1) in ('V', 'D')"
        SQL = SQL & "  group by gubun, wk_date"
        SQL = SQL & "  order by wk_date"
      
      Set Rs = New ADODB.Recordset
      Rs.Open SQL, G_Host_Con, adOpenForwardOnly
      
      If Rs.EOF Then
        MsgBox "해당하는 자료가 없습니다", vbExclamation, Me.Caption
        Rs.Close
        Set Rs = Nothing
        Screen.MousePointer = 0
        Exit Sub
      Else
        I_Total_Van20 = 0
        I_Total_Teu20 = 0
        O_Total_Van20 = 0
        O_Total_Teu20 = 0
        S_Total_Van20 = 0
        S_Total_Teu20 = 0
        I_Total_Van40 = 0
        I_Total_Teu40 = 0
        O_Total_Van40 = 0
        O_Total_Teu40 = 0
        S_Total_Van40 = 0
        S_Total_Teu40 = 0
        
        For i = 1 To 31
          Van_Total(i) = 0
          Teu_Total(i) = 0
        Next i
        
        Rs.MoveFirst
        Do While Not Rs.EOF
          With vaSpread1
            For i = 1 To .MaxCols
              .row = 0: .col = i
              If .Text = Right(NullTrim(Rs!wk_date), 2) Then
                idx = Val(Right(NullTrim(Rs!wk_date), 2))
                .row = Val(NullTrim(Rs!gubun))
                .Text = NullTrim(Rs!Van)
                Select Case .row
                  Case 1
                    I_Total_Van20 = I_Total_Van20 + Val(NullTrim(Rs!Van))
                    I_Total_Teu20 = I_Total_Teu20 + Val(NullTrim(Rs!Teu))
                  Case 2
                    I_Total_Van40 = I_Total_Van40 + Val(NullTrim(Rs!Van))
                    I_Total_Teu40 = I_Total_Teu40 + Val(NullTrim(Rs!Teu))
                  Case 3
                    O_Total_Van20 = O_Total_Van20 + Val(NullTrim(Rs!Van))
                    O_Total_Teu20 = O_Total_Teu20 + Val(NullTrim(Rs!Teu))
                  Case 4
                    O_Total_Van40 = O_Total_Van40 + Val(NullTrim(Rs!Van))
                    O_Total_Teu40 = O_Total_Teu40 + Val(NullTrim(Rs!Teu))
                  Case 5
                    S_Total_Van20 = S_Total_Van20 + Val(NullTrim(Rs!Van))
                    S_Total_Teu20 = S_Total_Teu20 + Val(NullTrim(Rs!Teu))
                  Case 6
                    S_Total_Van40 = S_Total_Van40 + Val(NullTrim(Rs!Van))
                    S_Total_Teu40 = S_Total_Teu40 + Val(NullTrim(Rs!Teu))
                End Select
                
                Van_Total(idx) = Van_Total(idx) + Val(NullTrim(Rs!Van))
                Teu_Total(idx) = Teu_Total(idx) + Val(NullTrim(Rs!Teu))
              End If
            Next i
          End With
          
          Rs.MoveNext
        Loop

        With vaSpread1
          For i = 1 To 31
            .col = i
            .row = 7: .Text = IIf(Van_Total(i) = 0, "", Van_Total(i))
            .row = 8: .Text = IIf(Teu_Total(i) = 0, "", Teu_Total(i))
          Next i
          
          .row = 1
          .col = 32: .Text = IIf(I_Total_Van20 = 0, "", I_Total_Van20)
          .col = 33: .Text = IIf(I_Total_Teu20 = 0, "", I_Total_Teu20)
          
          .row = 2
          .col = 32: .Text = IIf(I_Total_Van40 = 0, "", I_Total_Van40)
          .col = 33: .Text = IIf(I_Total_Teu40 = 0, "", I_Total_Teu40)
          
          .row = 3
          .col = 32: .Text = IIf(O_Total_Van20 = 0, "", O_Total_Van20)
          .col = 33: .Text = IIf(O_Total_Teu20 = 0, "", O_Total_Teu20)
          
          .row = 4
          .col = 32: .Text = IIf(O_Total_Van40 = 0, "", O_Total_Van40)
          .col = 33: .Text = IIf(O_Total_Teu40 = 0, "", O_Total_Teu40)
          
          .row = 5
          .col = 32: .Text = IIf(S_Total_Van20 = 0, "", S_Total_Van20)
          .col = 33: .Text = IIf(S_Total_Teu20 = 0, "", S_Total_Teu20)
          
          .row = 6
          .col = 32: .Text = IIf(S_Total_Van40 = 0, "", S_Total_Van40)
          .col = 33: .Text = IIf(S_Total_Teu40 = 0, "", S_Total_Teu40)
        End With
      End If
      
      With vaSpread1
        For i = 1 To 6
          .row = i: .col = 32
          tmpVan = tmpVan + Val(.Text)
          .col = 33: tmpTeu = tmpTeu + Val(.Text)
        Next i
        
        .row = 7: .col = 32
        .Text = tmpVan
        .row = 8: .col = 33
        .Text = tmpTeu
      End With
            
      Screen.MousePointer = 0
    
      Rs.Close
      Set Rs = Nothing
      
      Exit Sub
      
Query_Tab2_Err:
    Screen.MousePointer = 0
    MsgBox "월별 작업현황 조회 에러" & vbCrLf & Err.Description
End Sub

Private Sub setColmnName(spslist As vaSpread, col As Integer, name As String)
    Dim i As Integer
    
    spslist.MaxCols = col
    spslist.row = 0
    
    For i = 0 To spslist.MaxCols
        If name = "spslist(0)" Then
            spslist.ColWidth(i) = 4.5
        ElseIf name = "vaSpread1" Then
            spslist.ColWidth(i) = 3
        End If
    
        spslist.col = i
        
            If name = "spslist(0)" Then
                    Select Case i
                Case 0
                    spslist.Text = "순서"
                Case 1, 4, 7, 10, 12, 14, 16
                    spslist.Text = "20'"
                Case 2, 5, 8, 11, 13, 15, 17
                    spslist.Text = "40'"
                Case 3, 6, 9
                    spslist.Text = "45'"
                Case 18
                    spslist.Text = "VAN"
                Case 19
                    spslist.Text = "TEU"
                    End Select
            ElseIf name = "vaSpread1" Then
                If i = 0 Then
                    spslist.ColWidth(i) = 10
                    spslist.Text = "구분"
                ElseIf i < 10 Then
                    spslist.Text = "0" & Trim(Str(i))
                ElseIf i = 32 Then
                    spslist.ColWidth(i) = 10
                    spslist.Text = "VAN TOTAL"
                ElseIf i = 33 Then
                    spslist.ColWidth(i) = 10
                    spslist.Text = "TEU TOTAL"
                Else
                    spslist.Text = i
                End If
            Else
                    Select Case i
                Case 0
                    spslist.Text = "구분"
                Case 1, 4, 7, 9, 11
                    spslist.Text = "20'"
                Case 2, 5, 8, 10, 12
                    spslist.Text = "40'"
                Case 3, 6
                    spslist.Text = "45'"
                Case 13
                    spslist.Text = "VAN"
                Case 14
                    spslist.Text = "TEU"
                    End Select
            End If
    Next i
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
    Dim i, j As Integer
    
    If SSTab1.Tab = 0 Then
        txtDay.Enabled = True
        
        Call GetHostDateTime
        ThisYear = Mid(Trim(G_CurrentDate), 1, 4)
        txtYear.Text = ThisYear
        txtMonth.Text = Mid(Trim(G_CurrentDate), 5, 2)
        txtDay.Text = Mid(Trim(G_CurrentDate), 7, 2)
    End If
    
    If SSTab1.Tab = 1 Then
        txtDay.Enabled = True
        
        Call GetHostDateTime
        ThisYear = Mid(Trim(G_CurrentDate), 1, 4)
        txtYear.Text = ThisYear
        txtMonth.Text = Mid(Trim(G_CurrentDate), 5, 2)
        txtDay.Text = Mid(Trim(G_CurrentDate), 7, 2)
        
        Call setColmnName(spslist(0), 19, "spslist(0)")
        
        spslist(0).MaxRows = 5
        spslist(0).col = 0
        
        For i = 0 To spslist(0).MaxRows
            spslist(0).RowHeight(i) = 37
            spslist(0).row = i
            Select Case i
                Case 1
                    spslist(0).Text = "3"
                Case 2
                    spslist(0).Text = "10"
                Case 3
                    spslist(0).Text = "8"
                Case 4
                    spslist(0).Text = "4"
                Case 5
                    spslist(0).Text = "2"
            End Select
        Next i
    End If
    
    If SSTab1.Tab = 2 Then
        txtDay.Text = "01"
        txtDay.Enabled = False
        
        Call setColmnName(vaSpread1, 33, "vaSpread1")

        vaSpread1.MaxRows = 8
        vaSpread1.col = 0
        
        For i = 0 To vaSpread1.MaxRows
            vaSpread1.RowHeight(i) = 22
            vaSpread1.row = i
            Select Case i
                Case 1
                    vaSpread1.Text = "I_20'"
                Case 2
                    vaSpread1.Text = "I_40'"
                Case 3
                    vaSpread1.Text = "O_20'"
                Case 4
                    vaSpread1.Text = "O_40'"
                Case 5
                    vaSpread1.Text = "S_20'"
                Case 6
                    vaSpread1.Text = "S_40'"
                Case 7
                    vaSpread1.Text = "VAN TOTAL"
                Case 8
                    vaSpread1.Text = "TEU TOTAL"
            End Select
        Next i
    End If
End Sub

