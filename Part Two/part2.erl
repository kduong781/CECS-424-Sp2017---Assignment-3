-module(part2).
-export([open/1, dupl/2, table/1]).

open(A) ->
  {ok, S} = file:open(A,read),
  L1 = io:get_line(S,''),
  string:tokens(L1, " ").


dupl(String, List) ->
  case lists:keyfind(String, 1, List) of
      {String, Result} ->
        List2 = lists:keyreplace(String, 1, List, {String, Result+1});
      false -> List2 = lists:append(List, {String, 1})
  end.

table(A) ->
  HashTable = {},
  lists:foldl(fun dupl/2, HashTable, A).

sort(A) ->
  HashTable = table(open(A)),
  lists:sort(HashTable).
