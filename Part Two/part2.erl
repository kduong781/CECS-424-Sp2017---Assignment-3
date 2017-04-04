-module(part2).
-export([open/1, dupl/2, table/1, sortie/1]).

open(A) -> %open file
  {ok, S} = file:open(A,read),
  L1 = io:get_line(S,''),
  string:tokens(L1, " ").


dupl(String, List) ->%increment if value are the same else add new tuple of value 1
  case lists:keyfind(String, 1, List) of
      {String, Result} ->
        List2 = lists:keyreplace(String, 1, List, {String, Result+1});
      false -> List2 = lists:append(List, [{String, 1}])
  end.

table(A) ->%unsort
  HashTable = [],
  lists:foldl(fun dupl/2, HashTable, A).

sortie(A) ->%sort
  HashTable = table(open(A)),
  lists:sort(fun({String1,Value1}, {String2,Value2}) -> {Value1,String1} >= {Value2,String2} end, HashTable).
