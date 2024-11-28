stamp(space). 
stamp(flora). 
stamp(fauna). 
stamp(sport). 
position(0). 
position(1). 
position(2). 
position(3). 

uniquevar(Var1, Var2, Var3, Var4) :- 
not(Var1 = Var2), not(Var1 = Var3), 
not(Var1 = Var4), not(Var2 = Var3), 
not(Var2 = Var4), not(Var3 = Var4).

space_position(Result, Wolfstamp, Wolfpos, Nifstamp, Nifpos, Noofstamp, Noofpos, Nafstamp, Nafpos) :-
    Wolfstamp = space, Result = Wolfpos;
    Nafstamp = space, Result = Nafpos;
    Noofstamp = space, Result = Noofpos.

resulting(Wolfstamp, Wolfpos, Nifstamp, Nifpos, Noofstamp, Noofpos, Nafstamp, Nafpos) :-
    stamp(Wolfstamp), position(Wolfpos),
    stamp(Nifstamp), position(Nifpos),
    stamp(Noofstamp), position(Noofpos),
    stamp(Nafstamp), position(Nafpos),

    uniquevar(Wolfstamp, Nifstamp, Noofstamp, Nafstamp),
    uniquevar(Wolfpos, Nifpos, Noofpos, Nafpos),
    Wolfstamp = fauna,
    not(Noofstamp = sport), 

    space_position(SpaceX, Wolfstamp, Wolfpos, Nifstamp, Nifpos, Noofstamp, Noofpos, Nafstamp, Nafpos),
    Nifpos is (SpaceX + 1) mod 4,
    Noofpos is (Nafpos + 2) mod 4,
    Wolfpos is (Nafpos - 1) mod 4.