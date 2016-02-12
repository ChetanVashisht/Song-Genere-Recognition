function [ l ] = finder(train,labels_train)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

cd disco
data=audioread('disco.00005.au');
if (size(data,1)>661794)
    data=data(1:661794);
elseif (size(data,1)<661794)
    data=[data;zeros(661794-size(data,1),1)];
end
cd ..

m=mel(data');
plot(m(1,1:15));

k=10;
n=10;
a=15;
[~,~,l]=knn(train,labels_train,m,9,k,a,n);

end

