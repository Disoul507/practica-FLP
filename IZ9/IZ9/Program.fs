
let rec izbyt s x i =
    if x=i then s
    else if x%i = 0 then (izbyt (s+i) x (i+1))
    else (izbyt s x (i+1))

let kolIzb f =
    let rec kol_izb f x tek =
        if x=20000 then tek
        else if (f 0 x 1)>x then 
       //System.Console.Write(System.Convert.ToString(x)+"\n");
            (kol_izb f (x+1) (tek+1))
        else (kol_izb f (x+1) tek)
    kol_izb f 1 0

[<EntryPoint>]
let main argv =
    let result = kolIzb izbyt
    System.Console.Write("Количество избыточных чисел: " + System.Convert.ToString(result));
    let z = System.Console.ReadKey() 
    0 
