function normale = Normale(coin1, coin2)
    z= -1;
    p = coin1-coin2;
    normale = (z*[p(2), -p(1)]/norm(z*[p(2), -p(1)]));
end