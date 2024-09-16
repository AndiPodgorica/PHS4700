function ut=calculerUt(k,st,n)
ut=k*st+sqrt(1-st.^2)*-(n/norm(n));
end
