-module(day1p2).
-compile(export_all).

repeated(List) ->
    Step = length(List) div 2,
    Ahead = lists:nthtail(Step, List),
    repeated(List, Ahead, List, []).
    
repeated([], _, _, Acc) ->
    Acc;
repeated([H|T], [H|T2], L, Acc) ->
    repeated(T, T2, L, [H| Acc]);
repeated([_|T], [_|T2], L, Acc) ->
    repeated(T, T2, L, Acc);
repeated([H|T], [], L = [H| TL], Acc) ->
    repeated(T, TL, L, [H| Acc]);
repeated([_|T], [], L = [_|TL], Acc) ->
    repeated(T, TL, L, Acc).

main(_) ->
    {ok, Bin} = file:read_file("../input01"),
    CodeList = string:trim(erlang:binary_to_list(Bin)),
    DList = lists:map(fun(C) -> C - $0 end, CodeList),
    Repeated = repeated(DList),
    io:format("~w", [lists:sum(Repeated)]).
