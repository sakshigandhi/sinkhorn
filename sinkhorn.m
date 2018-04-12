function [D]=sinkhorn(a,b,M, lambda)
K=exp(-lambda*M);
K(K<1e-100)=1e-100;
U=K.*M;

I=(a>0);
if ~all(I),
    K=K(I,:);
    U=U(I,:);
    a=a(I);
end

ainvK=bsxfun(@rdivide,K,a);
i=0;
u=ones(size(a,1),size(b,2))/size(a,1);

% iterations
while i<5000,
        u=1./(ainvK*(b./(u'*K)'));
    i=i+1;

    if mod(i,20)==1 || i==5000,        
        v=b./((u'*K)');
        u=1./(ainvK*v);
                        
        % check whether to stop
        stop=norm(sum(abs(v.*(K'*u)-b)),inf);
        if stop< .5e-2|| isnan(stop), % norm of all || . ||_1 differences between the marginal of the current solution with the actual marginals.
            break;
        end      
        i=i+1;
    end
end

D=sum(u.*(U*v));