%%************************************************************************%
% createsin - creates a series of superimposed sinusoidal functions of
% given frequency (Hz) and phases. Because this function is meant to mimic
% a signal picked up by the tribometer, the third function
% variable (sr) is the data acquisiton rate and fourth (time) is the
% duration of the signal.
%************************************************************************%%

function f = createsin(amp,freqs,phases,sr,time,ff)
x = time*linspace(0,1,round(sr*time));
y = x;
switch ff
    case 'sin'
        for i = 1:length(y)
            a = 0;
            for ii = 1:length(freqs)
                a = a + amp(ii)*cos(2*pi*freqs(ii)*x(i) + phases(ii))+amp(ii)*sqrt(-1)*sin(2*pi*freqs(ii)*x(i) + phases(ii));
            end
            y(i) = a;
        end
    case 'chirp_linear'
        for i = 1:length(y)
            a = 0;
            for ii = 1:length(freqs)
                a = a + cos(2*pi*(freqs(ii) + x(i))*x(i) + phases(ii)) + sqrt(-1)*sin(2*pi*(freqs(ii) + x(i))*x(i) + phases(ii));
            end
            y(i) = a;
        end
    case 'chirp_quadratic'
        for i = 1:length(y)
            a = 0;
            for ii = 1:length(freqs)
                fo = freqs(ii);
                
                a = a + cos(2*pi*(freqs(ii) + 1/4*x(i))*x(i)^2 + phases(ii)) + sqrt(-1)*sin(2*pi*(freqs(ii) + 1/4*x(i))*x(i) + phases(ii));
            end
            y(i) = a;
        end
end
f = y;
end