
n = 74;

% Tao tin hieu hoa tieu ngau nhien
pilot_signal_re = randi([100, 110], n, 1); % Phan thuc la so nguyen trong [-100, 110]
pilot_signal_im = randi([100, 110], n, 1); % Phan ao la so nguyen trong [100, 110]

pilot_signal = pilot_signal_re + 1i * pilot_signal_im;

% ma so
y_r = zeros(74,10);
y_i = zeros(74,10);



k = 1;
for j=10000000:500000:19000000 
    noise_re = randn(n,1);
    noise_im = randn(n,1);
    y_r(:,k) = (log(20*k)/10)*pilot_signal_re + noise_re;
    y_i(:,k) = (log(20*k)/10)*pilot_signal_im + noise_im;
    k = k+1;
   
end

y_r = readtable('C:\CE project\y_r.xlsx'); %Doc phan thuc cua tin hieu quan sat
y_i = readtable('C:\CE project\y_i.xlsx'); %Doc phan ao cua du lieu quan sat
y_r = table2array(y_r);
y_i = table2array(y_i);
y = y_r + 1i*y_i;


x = pilot_signal';

mau_so = sum(abs(x));

tu_so = zeros(1,11);

for j=1:1:19
    tu_so(j) = x * y(:, j);  % Tính tích vô h??ng (h?ng) h[i]
end

h = tu_so/mau_so;



h_a = abs(h/100);
x = 1:length(h_a);



figure; % T?o m?t c?a s? m?i cho ?? th?
plot(real(pilot_signal), imag(pilot_signal), 'ro'); % 'o' bi?u di?n các ?i?m
title('Pilot signal');
xlabel('Re');
ylabel('Im');
grid on; % Hi?n l??i
axis equal;


figure; % T?o m?t c?a s? m?i cho ?? th?
plot(real(y), imag(y), 'ro'); % 'x' bi?u di?n các ?i?m
title('Obser signal');
xlabel('Re');
ylabel('Im');
grid on; % Hi?n l??i
axis equal;

f_start = 1e9; % 1 GHz
f_step = 0.5e9; % 50 kHz
frequencies = f_start + (x-1) * f_step; % Tính toán vector t?n s?

% V? ?? th?
figure; % T?o m?t hình m?i
plot(frequencies, h_a, '-o', 'MarkerSize', 8, 'LineWidth', 2); % N?i các ?i?m v?i ??u tròn
xlabel('Frequency (Hz)'); % Nhãn tr?c X
ylabel('Amplitude Rep'); % Nhãn tr?c Y
title('Frequency response of channel'); % Tiêu ?? ?? th?
grid on; % Hi?n l??i trên ?? th?


n = 74;

% Tao tin hieu hoa tieu ngau nhien
pilot_signal_re_n = randn(n, 1); % Phan thuc la so ngau nhien phan phoi chuan trong doan [0:1]
pilot_signal_im_n = randn(n, 1); % Phan ao la so ngau nhien phan phoi chuan trong doan [0:1]

pilot_signal_n = pilot_signal_re_n + 1i * pilot_signal_im_n;


y_r_n = zeros(74,10);
y_i_n = zeros(74,10);



k = 1;
for j=10000000:500000:19000000 
    noise_re = randn(n,1);
    noise_im = randn(n,1);
    y_r_n(:,k) = (log(2*k)/10)*pilot_signal_re_n + noise_re;
    y_i_n(:,k) = (log(2*k)/10)*pilot_signal_im_n + noise_im;
    k = k+1;
   
end

y_r_n = readtable('C:\CE project\y_r_n.xlsx'); %Doc phan thuc cua tin hieu quan sat
y_i_n = readtable('C:\CE project\y_i_n.xlsx'); %Doc phan ao cua du lieu quan sat
y_r_n = table2array(y_r_n);
y_i_n = table2array(y_i_n);
y_n = y_r_n + 1i*y_i_n;


x_n = pilot_signal_n';

mau_so_n = sum(abs(x_n));

tu_so_n = zeros(1,11);

for j=1:1:19
    tu_so_n(j) = x_n * y_n(:, j);  % Tich vo huong
end

h_n = tu_so_n/mau_so_n;

h_a_n = abs(h_n);
x = 1:length(h_a_n);

f_start = 1e9; % 1 GHz
f_step = 0.5e9; % 50 kHz
frequencies = f_start + (x-1) * f_step; % Tính toán vector t?n s?

% V? ?? th?
figure; % T?o m?t hình m?i
plot(frequencies, h_a_n, '-o', 'MarkerSize', 8, 'LineWidth', 2); % N?i các ?i?m v?i ??u tròn
xlabel('Frequency (Hz)'); % Nhãn tr?c X
ylabel('Amplitude Rep'); % Nhãn tr?c Y
title('Frequency response of channel and noise'); % Tiêu ?? ?? th?
grid on; % Hi?n l??i trên ?? th?