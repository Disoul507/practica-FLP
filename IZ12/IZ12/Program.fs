let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let rec write_list (list:int list)=
    match list with 
    |[] ->  let z=System.Console.ReadKey()
            0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t   

let count_three list el =
    let rec count n el = function
        [] -> false
        |h::t -> if n>3 then true else 
                        if el=h then count (n+1) el t
                        else count n el t
    count 0 el list

let rec in_list_exclude list el = function
    [] ->true
    |h::t -> if h=el then false
                else in_list_exclude t el t

let build_new_list list=
    let rec new_list l list tek= function
        [] -> l
        |h::t ->    let l1=h::l
                    if (count_three list h) && (in_list_exclude l h l) then
                        new_list l1 list h t
                                else new_list l list tek t
    new_list [] list -1000 list



[<EntryPoint>]
let main argv = read_data|>build_new_list|>write_list