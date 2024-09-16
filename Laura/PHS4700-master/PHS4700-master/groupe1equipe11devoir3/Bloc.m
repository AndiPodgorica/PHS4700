function [CoinsBloc NormalesBloc]=Bloc(CotesBloc,PosBloc,AngBloc)
CoteO2=CotesBloc(1:2)/2;
CoinsBlocNR=[-CoteO2(1) -CoteO2(1) CoteO2(1) CoteO2(1) ;-CoteO2(2) CoteO2(2) CoteO2(2) -CoteO2(2)];
NormalesBlocNR=[ -1 0 1 0 ; 0 1 0 -1];
for i=1:4
  CoinsBloc(:,i)=TourneCoin(AngBloc,CoinsBlocNR(:,i))+[PosBloc(1);PosBloc(2)];
  NormalesBloc(:,i)=TourneCoin(AngBloc,NormalesBlocNR(:,i));
end
