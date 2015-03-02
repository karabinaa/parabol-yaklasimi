function newZ2= decide2MiddleValue(Z2, Zstar)
    
    if aimfunction(Z2) < aimfunction(Zstar)
         newZ2 = Zstar;
    else
         newZ2 = Z2;
    end
    
    
end