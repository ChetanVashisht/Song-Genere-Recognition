function [ MelCoeff,Melfrequencies,windowed ] = mel( song )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

m=size(song,1);
i1=1;
fs=22050;

for o=1:m
    for i= 165376:441:496126
        y1= song(o,i:i+441);
	
        %-------------------------------------------Generating Hamming window
    	h=hamming(size(y1,2));
        %--------------------------------------------FFT
        original = y1;
        windowed = original.*(h');
        [mag2,~,~] = fftOneSide(windowed, fs);
        

        %--------------------------------------------Triangular frequency generation
        filterNum = 21;
        Realfreq = getTriFilterBankParam(fs, filterNum);
        freq = Realfreq(2:21);
        %---------------------------------------------MFCC Domain
        
        count = 1;
        for i = 1:1:200
            if((mod(i,10))==0)
                z1(count) = log(mag2(i)*freq(i/10));
                %z2(count) = freq2(i);
                count = count + 1;
            end
        end
        
        %--------------------------------------------DCT
        
        Mel = dct(z1);
        Melfrequencies(i1,:)=Mel(1:15);
        i1=i1+1;
    end
    MelAverage = mean(Melfrequencies);
    MelCovariance = cov(Melfrequencies);
    MelCovariance = MelCovariance(:).';
    MelCoeff(o,:) = [MelAverage MelCovariance];
    o
end
plot(y1);
end