%%%-------------------------------------------------------------------
%%% @author sbernal
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Apr 2018 11:34 AM
%%%-------------------------------------------------------------------
-module(qsort).
-author("sbernal").

%% API
-export([qs/1, randomElems/3, compareSpeeds/3]).


lessThan(List, Arg) -> [X || X <- List, X < Arg].

grtEqThan(List, Arg) -> [X || X <- List, X >= Arg].

qs([]) -> [];
qs([Pivot|Tail]) -> qs( lessThan(Tail,Pivot) ) ++ [Pivot] ++ qs( grtEqThan(Tail,Pivot) ).


randomElems(N, Min, Max) ->
  [random:uniform(Max - Min + 1) + Min -1 || _ <- lists:seq(1, N)].

compareSpeeds(List, Fun1, Fun2) ->
  {timer:tc(Fun1, [List | []]), timer:tc(Fun2, [List | [] ])}.

% Mmap = fun(X, Fun) -> [Fun(XX) || XX <- X] end.

% MFilter([1,2,3,4,5,6,7], fun(X) -> (x rem 2) == 0 end).


%%SplitNum = fun F(0) -> []; F(Num) -> [(Num rem 10)] ++ F(Num div 10) end.
%%SumDigits = fun(X) -> lists:foldl(fun(A,B) -> A+B end, 0, X) end.
%%SumNum = fun(Num) -> SumDigits(SplitNum(Num)) end.

%%umNumber = fun(Num) ->
%% lists:foldl(fun(X, Y) -> X + (Y - $0) end , 0, integer_to_list(Num)) end.