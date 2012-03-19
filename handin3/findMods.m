function mods = findMods(allowed) 
    mods = [];
    for i = 1:prod(size(allowed))
        if (allowed(i) > 0)
            mods = [mods; i];
        end
    end
    