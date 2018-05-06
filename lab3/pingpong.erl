%%%-------------------------------------------------------------------
%%% @author sbernal
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Apr 2018 11:28 AM
%%%-------------------------------------------------------------------
-module(pingpong).
-author("sbernal").

%% API
-export([start/0, stop/0, play/1]).

ping_loop() ->
  receive
    stop -> io:format("Stop ping");
    0 -> ping_loop();
    N ->
      io:format("Ping ~w ~n", [N]),
      Arg = N - 1,

      timer:sleep(1000),

      pong ! Arg,
      ping_loop()
  after
    20000 -> io:format("Timeout ping ~n")
  end.


pong_loop() ->
  receive
    stop -> io:format("Stop pong");
    0 -> pong_loop();
    N ->
      io:format("Pong ~w ~n", [N]),
      Arg = N - 1,

      timer:sleep(1000),

      ping ! Arg,
      pong_loop()
  after
    20000 -> io:format("Timeout pong ~n")
  end.

stop() ->
  ping ! stop,
  pong ! stop.


play(N) ->
  ping ! N,
  ok.


start() ->
  register(ping, spawn(fun() -> ping_loop() end)),
  register(pong, spawn(fun() -> pong_loop() end)),
  ok.



