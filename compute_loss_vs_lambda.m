function [loss] = compute_loss_vs_lambda(M, lambda, X_train, y_train, dual)
if nargin<5
    dual = compute_kernel(X_train, M, lambda)
end
dual_reg = dual + eye(size(dual))*(-2*min(eig(dual)));
model = fitcecoc(dual_reg, y_train);
CVMdl = crossval(model, 'KFold', 4);
loss = kfoldLoss(CVMdl)