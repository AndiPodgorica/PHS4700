function [pcm, MI, aa] = Devoir1(pos, theta, wz, Force)
    pcm = CentreMasse.CM(pos, theta);
    MI = MomentInertie.MI(theta, pos, pcm);
    aa = AccelerationAngulaire.Acceleration(pos, theta, MI, wz, Force, pcm);
    
end
