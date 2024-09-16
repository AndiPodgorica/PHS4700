function ur = Reflected(ui, i)
    ui = ui/norm(ui);
    i = i/norm(i);
    ur = ui - 2*i*dot(ui,i);
    ur = ur/norm(ur);
end