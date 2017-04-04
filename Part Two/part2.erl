-module(part2).
-export([open/1, tuple/2]).

open(A) ->
  {ok, S} = file:open(A,read),
  L1 = io:get_line(S,''),
  string:tokens(L1, " ").


tuple(String, List) ->
  case lists:keyfind(String, 1, List) of
      {String, Result} -> lists:key;
      false -> List2 = lists:append(List, {String, 1})
  end.
