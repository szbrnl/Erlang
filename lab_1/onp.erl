-module(onp)

-export([onpc/1]).


onp(Exp) ->
  onpHelp(string:tokens(Exp, ", "), []).

onpHelp([], [HS | TS]) -> HS;

onpHelp(["+" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V1 + V2 | TS]);

onpHelp(["-" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V2 - V1 | TS]);

onpHelp(["/" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V2 / V1 | TS]);

onpHelp(["*" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V1 * V2 | TS]);

onpHelp([H | T], [S]) ->
  onpHelp(T, [H | S]);

onpHelp([H | T], []) ->
  onpHelp(T, [H]).
