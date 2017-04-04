-module(part1).
-export([add_one/1, give_half/2, whistle/4]).



  %adds one if its odd
   add_one(A) ->
      if
         trunc(A) rem 2 == 1 -> A + 1;
         true -> A
      end.

   %gives half of first parameter to the 2nd parameter
   give_half(A,B) ->
     B + A/2.


     %adds half (if the sum after the half is added is odd, add 1), repeat till number of turns
     %is over
    whistle(A,B,C,D) when D > 0 ->
      A2 = give_half(C,A),
      B2 = give_half(A,B),
      C2 = give_half(B,C),
      SUM = add_one(A2) + add_one(B2) + add_one(C2),
      DIFF = SUM - add_one(A2) - add_one(A2) - add_one(A2),
      io:fwrite("~p ~p ~p ~p", [add_one(A2), add_one(B2), add_one(C2), D-1]),
      io:fwrite("\n"),
      if
        DIFF == 0 ->
          io:fwrite("Recursion is over (Everyone has same amount)");
        D > 1 ->
          whistle(add_one(A2),add_one(B2), add_one(C2), D+1); % change D+1 to D-1 if rules are diff
        true ->
          io:fwrite("Recursion is over")
      end.
