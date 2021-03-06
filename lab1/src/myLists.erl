-module(myLists).

%% API
-export([contains/2, duplicateElements/1, sumFloats/1, sumFloats1/1]).

contains([], _) -> false;
contains([Value | T], Value) -> true;
contains([_ | T], Value) -> contains(T, Value).


duplicateElements([]) -> [];
duplicateElements([H | T]) ->
  [H,H] ++ duplicateElements(T).



sumFloats([]) -> 0;
sumFloats([H | T]) when is_float(H) ->
  H + sumFloats(T);
sumFloats([_ | T])->
  0 + sumFloats(T).


sumFloats1([]) -> 0;
sumFloats1([H | T]) when is_float(H) ->
  sumFloatsOg(T, H);
sumFloats1([_ | T]) ->
  sumFloatsOg(T, 0).

sumFloatsOg([], Sum) -> Sum;
sumFloatsOg([H | T], Sum) -> sumFloatsOg(T, Sum + H);
sumFloatsOg([_ | T], Sum) -> sumFloatsOg(T, Sum).

