n = 74;
h = zeros(2, 2, 20);
mimo_pilot = zeros(2,n);
mimo_obser = zeros(2,n);
for k = 1:20
    for i = 1:n
        mimo_pilot(1, i) = randi([99, 100]);  
        mimo_pilot(2, i) = randi([99, 100]);  
    end


    for i = 1:n
        mimo_obser(1, i) = 3 + 5*log(500*k);  
        mimo_obser(2, i) = 5 + 5*log(500*k); 
    end

    h(:, :, k) = mimo_obser * mimo_pilot' * (mimo_pilot * mimo_pilot')^-1;
end

figure; 
hold on; 
k_values = 1:20; 
plot(k_values, squeeze(h(1, 1, :)), 'r-', 'LineWidth', 2); 
plot(k_values, squeeze(h(1, 2, :)), 'g-', 'LineWidth', 2); 
plot(k_values, squeeze(h(2, 1, :)), 'b-', 'LineWidth', 2); 
plot(k_values, squeeze(h(2, 2, :)), 'k-', 'LineWidth', 2); 
hold off; 
xlabel('Hz');
ylabel('Amplitude');
title('Frequency Respond of Hij');
legend('h11', 'h12', 'h21', 'h22', 'Location', 'best');
grid on; 



