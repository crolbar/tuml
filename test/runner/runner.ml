let run (runables : (string * (unit -> unit)) list) =
  List.iter
    (fun (name, f) ->
       Printf.printf
         "\x1b[31m->\x1b[m \x1b[34mRunning \x1b[3m%s\x1b[m \x1b[31m<-\x1b[m\n%!"
         name;
       let start = Unix.gettimeofday () in
       try
         f ();
         Printf.printf
           "\x1b[31m->\x1b[m \x1b[32;3m%s\x1b[23m Finished in \
            \x1b[39;1m%.6fs\x1b[m \x1b[31m<-\x1b[m\n\
            %!"
           name
           (Unix.gettimeofday () -. start)
       with
       | err ->
         Printf.printf
           "\x1b[31m->\x1b[m \x1b[31;3m%s\x1b[23m FAILED: \x1b[1m%s\x1b[m \
            \x1b[31m<-\x1b[m\n\
            %!"
           name
           (Printexc.to_string err);
         ())
    runables
;;
