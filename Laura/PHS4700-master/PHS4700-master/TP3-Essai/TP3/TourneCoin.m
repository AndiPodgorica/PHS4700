function CoinBlocTourne=TourneCoin(angle,CoinBloc)
%
%  Tourner le coin du bloc 
%  Omega  : Quaternion de rotation.
%
%  Deplacer les faces et les normales autour du centre de masse
%
if angle == 0
  CoinBlocTourne=CoinBloc;
else
  MatR=[cos(angle) -sin(angle); sin(angle) cos(angle)];
  CoinBlocTourne=MatR*CoinBloc;
end
