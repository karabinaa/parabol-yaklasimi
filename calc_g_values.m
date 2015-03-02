function gValues = calc_g_values(Z1, Z2, Z3)
    
    g1 = aimfunction(Z1);
    g2 = aimfunction(Z2);
    g3 = aimfunction(Z3);
    gValues = [g1; g2; g3];

end 