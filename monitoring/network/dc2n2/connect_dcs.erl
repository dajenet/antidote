#!/usr/bin/env escript
%%! -smp enable -sname erlshell -setcookie antidote
main(_Args) ->
    ok = rpc:call(antidote@antidote1, antidote_dc_manager, create_dc, [[antidote@antidote1, antidote@antidote2]]),
    ok = rpc:call(antidote@antidote3, antidote_dc_manager, create_dc, [[antidote@antidote3, antidote@antidote4]]),
    {ok, Desc1} = rpc:call(antidote@antidote1, antidote_dc_manager, get_connection_descriptor, []),
    {ok, Desc3} = rpc:call(antidote@antidote3, antidote_dc_manager, get_connection_descriptor, []),
    rpc:call('antidote@antidote1', antidote_dc_manager, subscribe_updates_from, [[Desc3]]),
    rpc:call('antidote@antidote3', antidote_dc_manager, subscribe_updates_from, [[Desc1]]),
    io:format("Connection setup!").
