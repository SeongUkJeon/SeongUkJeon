VERSION 5.00
Begin VB.Form frmStartScreen 
   BorderStyle     =   1  '단일 고정
   Caption         =   "메인"
   ClientHeight    =   7140
   ClientLeft      =   4605
   ClientTop       =   1650
   ClientWidth     =   7260
   LinkTopic       =   "frmTotal"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7140
   ScaleWidth      =   7260
   Begin VB.Timer trm 
      Left            =   3600
      Top             =   2880
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "수정"
      Height          =   375
      Left            =   6720
      TabIndex        =   1
      Top             =   6720
      Visible         =   0   'False
      Width           =   555
   End
   Begin VB.TextBox txtRmk 
      BackColor       =   &H0080FFFF&
      BeginProperty Font 
         Name            =   "휴먼매직체"
         Size            =   24
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2220
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "frmStartScreen.frx":0000
      Top             =   4920
      Width           =   7260
   End
   Begin VB.Image img 
      Height          =   4965
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7245
   End
End
Attribute VB_Name = "frmStartScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mTime%

Private Sub cmdExit_Click()

  Unload Me

End Sub

Private Sub cmdUpdate_Click()

  Dim SQL$

  SQL = " UPDATE t_config "
  SQL = SQL & " SET PIT_RMK ='" & txtRmk & "'"
  G_Host_Con.Execute (SQL)

End Sub

Private Sub Form_Load()
    Me.Left = (Screen.Width - Me.Width) / 2
    Me.Top = (Screen.Height - Me.Height) / 2 - 500
    
    Dim idx%
    Dim tRs As New ADODB.Recordset
    Dim SQL$
  
    SQL = "select PIT_RMK "
    SQL = SQL & "   from t_config"
    Set tRs = G_Host_Con.Execute(SQL)
    With tRs
      If Not (.BOF And .EOF) Then
        txtRmk = NullTrim(!PIT_RMK)
      End If
      .Close
    End With
    
    Call SetPhoto
End Sub

'사진 가져오기
Private Sub SetPhoto()
  On Error GoTo Err
  If Dir$("\\Main\photo\start\start.jpg") <> "" Then
    img.Picture = LoadPicture("\\MAIN\photo\start\start.jpg")
  Else
    If Dir$("\\192.168.10.4\photo\start\start.jpg") <> "" Then
      img.Picture = LoadPicture("\\192.168.10.4\photo\start\start.jpg")
    Else
      img.Picture = LoadPicture("")
    End If
  End If
Err:
  Resume Next
End Sub



Private Sub img_Click()

  Unload Me

End Sub

Private Sub tmr_Timer()

  mTime = mTime + 1
  
  If mTime = 10 Then
    Unload Me
  End If


End Sub


