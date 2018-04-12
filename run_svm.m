function [loss] = run_svm(M, X_train_300, X_train_500, X_train_800, X_train_1200, X_train_1700, X_train_2500, y_train_300, y_train_500, y_train_800, y_train_1200, y_train_1700, y_train_2500)

% lambda = 100
% loss_300_100 = compute_loss_vs_lambda(M, 100, X_train_300, y_train_300)
loss_500_100 = compute_loss_vs_lambda(M, 100, X_train_500, y_train_500)
% loss_800_100 = compute_loss_vs_lambda(100, X_train_800, y_train_800)
% loss_1200_100 = compute_loss_vs_lambda(100, X_train_1200, y_train_1200)
% loss_1700_100 = compute_loss_vs_lambda(100, X_train_1700, y_train_1700)
% loss_2500_100 = compute_loss_vs_lambda(100, X_train_2500, y_train_2500)

% lambda = 1
% loss_300_1 = compute_loss_vs_lambda(M, 1, X_train_300, y_train_300)
loss_500_1 = compute_loss_vs_lambda(M, 1, X_train_500, y_train_500)
% loss_800_1 = compute_loss_vs_lambda(1, X_train_800, y_train_800)
% loss_1200_1 = compute_loss_vs_lambda(1, X_train_1200, y_train_1200)
% loss_1700_1 = compute_loss_vs_lambda(1, X_train_1700, y_train_1700)
% loss_2500_1 = compute_loss_vs_lambda(1, X_train_2500, y_train_2500)

% lambda = 0.0001
% loss_300_inv_1 = compute_loss_vs_lambda(M, 0.0001, X_train_300, y_train_300)
loss_500_inv_1 = compute_loss_vs_lambda(M, 0.0001, X_train_500, y_train_500)
% loss_800_inv_1 = compute_loss_vs_lambda(0.0001, X_train_800, y_train_800)
% loss_1200_inv_1 = compute_loss_vs_lambda(0.0001, X_train_1200, y_train_1200)
% loss_1700_inv_1 = compute_loss_vs_lambda(0.0001, X_train_1700, y_train_1700)
% loss_2500_inv_1 = compute_loss_vs_lambda(0.0001, X_train_2500, y_train_2500)

% loss = mean([loss_300_100, loss_500_100, loss_800_100; loss_300_1, loss_500_1, loss_800_1; loss_300_inv_1, loss_500_inv_1, loss_800_inv_1])
% disp(loss_300_100);
% disp(loss_300_1);
% disp(loss_300_inv_1);

disp(loss_500_100);
disp(loss_500_1);
disp(loss_500_inv_1);