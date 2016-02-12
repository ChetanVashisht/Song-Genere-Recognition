clear
%Loading parameters
%[train_song2 ,test_song2,labels_train,labels_test]=start();

fprintf('\nLoading stored song amplitudes.\n\n');

fprintf('Loading training set.\n');
train = csvread('tr_final.csv');
fprintf('Loading testing set.\n');
test=csvread('te_final.csv');
%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;

%MFCC:
%train2 = mel(train_song2);
%test2 = mel(test_song2);

fprintf('\nLoading labels for training and testing sets.\n\n');
split_train=70;
split_test=30;
k=10;
labels_train=zeros(split_train*k,1);
labels_test=zeros(split_test*k,1);
for i=1:k
    labels_train((i-1)*split_train+1:i*split_train,:)=i*ones(split_train,1);
    labels_test((i-1)*split_test+1:i*split_test,:)=i*ones(split_test,1);
end
%fprintf('Program paused. Press enter to continue.\n');
%pause;

k=10;
n=10;
a=15;
[c1,acc1,~]=knn(train,labels_train,test,labels_test,k,a,n);

%fprintf('Program paused. Press enter to continue.\n');
%pause;
c1

% l=finder(train,labels_train);

% data=cellstr(['blues    ';'classical';'country  ';'disco    ';'hiphop   ';'jazz     ';'metal    ';'pop      ';'reggae   ';'rock     ']);
% fprintf('Predicted Genre: ');
% data(l)
