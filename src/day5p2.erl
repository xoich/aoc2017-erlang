-module(day5p2).
-compile(export_all).

steps_to_exit(Arr) ->
    steps_to_exit(Arr, 0, array:size(Arr), 0).

steps_to_exit(_, I, Size, Steps) when I < 0; I >= Size ->
    Steps;
steps_to_exit(Array, I, Size, Steps) ->
    J = array:get(I, Array),
    Off = if J >= 3 -> -1; true -> 1 end,
    NArr = array:set(I, J+Off, Array),
    steps_to_exit(NArr, I+J, Size, Steps+1).

main(_) ->
    {ok, Bin} = file:read_file("../input5"),
    Lines = string:lexemes(Bin, "\n"),
    LIst = [ erlang:binary_to_integer(L) || L <- Lines],
    steps_to_exit(array:from_list(LIst)).

test() ->
    I1 = [0, 3, 0, 1, -3],
    10 = steps_to_exit(array:from_list(I1)).
