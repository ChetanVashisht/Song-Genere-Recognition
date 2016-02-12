function [ train,test,labels_train,labels_test ] = start()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

split_train=70;
split_test=30;

labels_train=[ones(split_train,1);2*ones(split_train,1);3*ones(split_train,1);4*ones(split_train,1)];
labels_test=[ones(split_test,1);2*ones(split_test,1);3*ones(split_test,1);4*ones(split_test,1)];

train=zeros(280,661794);
test=zeros(120,661794);
m=1;
n=1;

split_train=70;
split_test=30;
k=10;
labels_train=zeros(split_train*k,1);
labels_test=zeros(split_test*k,1);
for i=1:k
    labels_train((i-1)*split_train+1:i*split_train,:)=i*ones(split_train,1);
    labels_test((i-1)*split_test+1:i*split_test,:)=i*ones(split_test,1);
end
for i=1:3
    r = datasample(0:99,split_test,'Replace',false);
    data=cellstr(['classical';'jazz     ';'rock     ';'pop      ']);
    type=data(i);
    if(i==1)
        cd classical
    elseif (i==2)
        cd jazz
    elseif (i==3)
        cd rock
    elseif (i==4)
        cd pop
    end
    for j=0:99
        if (j<10)
            loc=strcat(type,'.0000',num2str(j),'.au');
        else
            loc=strcat(type,'.000',num2str(j),'.au');
        end
        data=audioread(char(loc));
        if (size(data,1)>661794)
            data=data(1:661794);
        elseif (size(data,1)<661794)
            data=[data;zeros(661794-size(data,1),1)];
        end
        if(any(r==j))
            test(n,:)=data;
            n=n+1;
        else
            train(m,:)=data;
            m=m+1;
        end
    end
    cd ..
end

end