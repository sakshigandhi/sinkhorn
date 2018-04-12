function [dual] = compute_kernel(X_train, M, lambda)
tranpose_X_train = transpose(X_train)
dual = []
for col=1:size(tranpose_X_train,2)
    x = tranpose_X_train(:,col)
    dist = sinkhorn(x, tranpose_X_train, M, lambda)
    dual = [dual;dist]
end
    
