#!/usr/bin/env escript
%%! -smp enable -sname erlshell -setcookie antidote
main(_Args) ->
  {ok, Desc1} = rpc:call(antidote@antidote1, antidote_dc_manager, get_connection_descriptor, []),
  {ok, Desc2} = rpc:call(antidote@antidote2, antidote_dc_manager, get_connection_descriptor, []),
  {ok, Desc3} = rpc:call(antidote@antidote3, antidote_dc_manager, get_connection_descriptor, []),
  {ok, Desc4} = rpc:call(antidote@antidote4, antidote_dc_manager, get_connection_descriptor, []),
  Descriptors = [Desc1, Desc2, Desc3, Desc4],
  rpc:call('antidote@antidote1', antidote_dc_manager, subscribe_updates_from, [Descriptors]),
  rpc:call('antidote@antidote2', antidote_dc_manager, subscribe_updates_from, [Descriptors]),
  rpc:call('antidote@antidote3', antidote_dc_manager, subscribe_updates_from, [Descriptors]),
  rpc:call('antidote@antidote4', antidote_dc_manager, subscribe_updates_from, [Descriptors]),
  io:format("Connection setup!").
