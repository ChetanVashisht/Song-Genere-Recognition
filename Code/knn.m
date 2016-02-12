function [ c_matrix, acc,l ] = knn( train, labels_train, test, labels_test, k, a, n)
%K NEAREST NEIGHBOURS This function implements knn on test data using
%training data
%For each test row, it finds the KL-divergence from each training row. The
%closest k training rows are chosen and a vote is taken 
m = size(train,1);
o = size(test,1);

d=zeros(m,2);
d(:,2)=labels_train;

g=zeros(n,2);
g(:,1) = 1:n;

l=zeros(o,1);

for i=1:o
    te = test(i,:);
    for j=1:m
        tr = train(j,:);
        d(j,1)= kl_div(te,tr,a);
    end
    e = sortrows(d,1);
    if(e(k,1)==e(k+1,1))
        f = e(1:k+1,:);
    else
        f = e(1:k,:);
    end
    for j=1:n
        g(j,2)=sum(f(:,2)==j);
    end
    h=sortrows(g,2);
    l(i,1)=h(n,1);
    i
end

c_matrix=zeros(n,n);
for i=1:n
    for j=1:n
        c_matrix(i,j)=sum(((labels_test==i) .* (l==j)));
    end
end
acc=mean((labels_test==l)+0);

end