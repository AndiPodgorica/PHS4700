function [obs, blocTrans, blocColors ] = Declarations( PositionObs, n_o, n_t )
%Declare everything
    obs = Observateur(PositionObs, n_o);
    blocTrans = Bloc(7, 7, 15, n_t, [3.5, 3.5, 12.5]);
    blocColors = BlocColors(1, 2, 5, 0, [3.5, 4, 14.5]);
end

