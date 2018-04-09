-module(onp).

-import(math,[sin/1, cos/1, tan/1, ctg/1, pow/2, sqrt/1]).

-export([onp/1]).



onp(Exp) ->
  onpHelp(string:tokens(Exp, ", "), []).

onpHelp([], [HS | TS]) -> HS;

onpHelp(["+"|T1], [V1 |  [V2 |T2]]) ->
  onpHelp(T1, [V1 + V2 | T2]);

onpHelp(["-" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V2 - V1 | TS]);

onpHelp(["/" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V2 / V1 | TS]);

onpHelp(["*" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [V1 * V2 | TS]);

onpHelp(["sqrt"|T1], [V |T2]) ->
  onpHelp(T1, [sqrt(V) | T2]);

onpHelp(["pow" | T], [V1 | [ V2 | TS ] ]) ->
  onpHelp(T, [pow(V2, V1) | TS]);

onpHelp(["sin" | T], [V | TS ]) ->
  onpHelp(T, [sin(V) | TS]);

onpHelp(["cos" | T], [V | TS ] ) ->
  onpHelp(T, [cos(V) | TS]);

onpHelp(["tan" | T], [V | TS ]) ->
  onpHelp(T, [tan(V) | TS]);

onpHelp(["ctg" | T], [V | TS ]) ->
  onpHelp(T, [1/tan(V) | TS]);


onpHelp([H |T], S) ->
  try
    onpHelp(T, [list_to_float(H) | S])
catch
    error : _ -> onpHelp(T, [list_to_integer(H) | S])
  end.

