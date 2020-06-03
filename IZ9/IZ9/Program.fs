
let rec izbyt s x i =
    if x=i then s
    else if x%i = 0 then (izbyt (s+i) x (i+1))
    else (izbyt s x (i+1))

let rec kol_izb f x tek =
    if x=20000 then tek
    else if (f 0 x 1)>x then (kol_izb f (x+1) (tek+1))
    else (kol_izb f (x+1) tek)

[<EntryPoint>]
let main argv =
    let result = kol_izb izbyt 1 0
    System.Console.Write("Количество избыточных чисел: " + System.Convert.ToString(result));
    let z = System.Console.ReadKey() 
    0 // return an integer exit code
