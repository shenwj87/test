% %% 构造矩阵
% n = 2;
% p = randperm(n);
% U = zeros(n,n);
% for i = 1:n
%     U(i,p(i)) = 1;
% end
% pp = [U eye(size(U,1));
%     -eye(size(U,1)) U'];
% 
% A = randn(2*n,2*n);
% for i=1:size(pp,2)
% n1(i,1) = norm(A*pp(:,i),2);
% end
% 
% pp'*pp;

% m = 1000; n = 96;
% A = randn(m,n);
% for i=1:n
% O = randi([0,1],n,n);
% no(i,1) = norm(A*O(:,i));
% end

%%
p{1} = [0 1;-1 0];%[1 0 1 0;0 1 0 1;-1 0 1 0;0 -1 0 1];
for k=2:10
p{k} = [cell2mat(p(k-1)) -cell2mat(p(k-1));cell2mat(p(k-1)) cell2mat(p(k-1))];
% p{k} = [cell2mat(p(k-1)) eye(size(cell2mat(p(k-1)),1));-eye(size(cell2mat(p(k-1)),1)) cell2mat(p(k-1))'];
end
for k = 2:10
    q = cell2mat(p(k));
%     q(:,[1,2]) = [];
    p{k} = q;
end
pp1 = cell2mat(p(7));
pp = pp1(1:size(pp1,1),:);
A = rand(size(pp1,1),size(pp1,1));
for i=1:size(pp,2)
n1(i,1) = norm(A*pp(:,i),2);
end
I = pp'*pp;
tf = norm(I - size(pp,1)/2*eye(size(pp,2)));

sqrtk = sqrt(size(pp,1)/2); % sqrt(k)
npp2 = norm(pp);
nppf = norm(pp,"fro");