VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   8940
   ClientLeft      =   120
   ClientTop       =   285
   ClientWidth     =   17115
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8940
   ScaleWidth      =   17115
   Begin VB.PictureBox Picture1 
      Height          =   9015
      Left            =   0
      ScaleHeight     =   8955
      ScaleWidth      =   17115
      TabIndex        =   0
      Top             =   0
      Width           =   17175
      Begin VB.Image img 
         Height          =   8895
         Left            =   0
         Stretch         =   -1  'True
         Top             =   0
         Width           =   17055
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub SetPhoto()
    On Error GoTo Err
    img.Picture = LoadPicture("\\192.168.10.95\Sample Pictures\Desert.jpg")
Err:
    Resume Next
End Sub

Private Sub Form_Load()
    SetPhoto
End Sub
