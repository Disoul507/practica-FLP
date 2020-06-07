// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
open System
open System.Drawing
open System.Windows.Forms

let mainForm = new Form(Width = 600, Height = 400, Text = "Времена года")

let Label1 = new Label(Text="Выберите один из месяцев: ")
Label1.Width <- mainForm.Width
mainForm.Controls.Add(Label1)

let jan = new Button(Width = 75,Height = 25, Left = 50,Top = 30,Text = "Январь")
let feb = new Button(Width = 75,Height = 25, Left = 50,Top = 60,Text = "Февраль")
let mar = new Button(Width = 75,Height = 25, Left = 50,Top = 90,Text = "Март")
let apr = new Button(Width = 75,Height = 25, Left = 50,Top = 120,Text = "Апрель")
let may = new Button(Width = 75,Height = 25, Left = 50,Top = 150,Text = "Май")
let jun = new Button(Width = 75,Height = 25, Left = 50,Top = 180,Text = "Июнь")
let jul = new Button(Width = 75,Height = 25, Left = 50,Top = 210,Text = "Июль")
let aug = new Button(Width = 75,Height = 25, Left = 50,Top = 240,Text = "Август")
let sep = new Button(Width = 75,Height = 25, Left = 50,Top = 270,Text = "Сентябрь")
let oct = new Button(Width = 75,Height = 25, Left = 50,Top = 300,Text = "Октябрь")
let nov = new Button(Width = 75,Height = 25, Left = 50,Top = 330,Text = "Ноябрь")
let dec = new Button(Width = 75,Height = 25, Left = 50,Top = 360,Text = "Декабрь")

mainForm.Controls.Add(jan)
mainForm.Controls.Add(feb)
mainForm.Controls.Add(mar)
mainForm.Controls.Add(apr)
mainForm.Controls.Add(may)
mainForm.Controls.Add(jun)
mainForm.Controls.Add(jul)
mainForm.Controls.Add(aug)
mainForm.Controls.Add(sep)
mainForm.Controls.Add(oct)
mainForm.Controls.Add(nov)
mainForm.Controls.Add(dec)

let winter _ = MessageBox.Show ("Зима.","Время года") |>ignore
let spring _= MessageBox.Show("Весна.","Время года") |>ignore
let summer _= MessageBox.Show("Лето.","Время года") |>ignore
let autumn _= MessageBox.Show("Осень.","Время года") |>ignore

let _ = jan.Click.Add(winter)
let _ = feb.Click.Add(winter)
let _ = dec.Click.Add(winter)
let _ = mar.Click.Add(spring)
let _ = apr.Click.Add(spring)
let _ = may.Click.Add(spring)
let _ = jun.Click.Add(summer)
let _ = jul.Click.Add(summer)
let _ = aug.Click.Add(summer)
let _ = sep.Click.Add(autumn)
let _ = oct.Click.Add(autumn)
let _ = nov.Click.Add(autumn)

do Application.Run(mainForm) 

[<EntryPoint>]
let main argv = 
    0 // return an integer exit code
