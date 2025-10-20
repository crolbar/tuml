let test_a () =
  let a = 2 in
  let b = 3 in
  Printf.printf "add of %d and %d is %d\n%!" a b (Tuml.add a b);
  assert (Tuml.add a b = 5)
;;

let test_b () = assert (5 = 5);;

(* test_a ();; *)

Runner.run [ "test a", test_a; "test b", test_b ]
