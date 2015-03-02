function max = findTheMaxDot(Z1,Z2,Z3)
   
    h = (Z3-Z1)/4;   % �n tan�ml� h ve e de�erleri
    
    
    x = linspace(0,2);
    
    f = tanh(x)/(1+x.^2);
        
    

    gValues = calc_g_values(Z1, Z2, Z3); % Z de�erleri i�in g(Z) de�erlerinin hesaplanmas�
    a = inv([ Z1^2, Z1, 1; Z2^2, Z2, 1; Z3^2, Z3, 1]) * gValues; % Z ve g(Z) de�erlerinin kullan�larak a de�erlerinin hesaplanmas� 

    g = a(1)*(x.^2) + a(2)*x + a(3);
    
   
   
    
    Zstar = - a(2) / (2*a(1)); % uydurulan e�rinin maximum noktas�n�n apsisi

    Z2 = decide2MiddleValue(Z2, Zstar); % uydurulan do�runun maximum noktas�n�n ordinat� ile g(Z2) nin k�yaslanmas� ve yeni Z2 de�erinin belirlenmesi
    Z1 = Z2 - h; % yeni Z1 de�erinin atanmas�
    Z3 = Z2 + h; % yeni Z3 de�erinin atanmas� 

    gValues = calc_g_values(Z1, Z2, Z3);  %yeni Z de�erleri i�in g(Z) de�elerinin hesaplanmas�
        
   
        i = 0;
        
        k = 1;
        
        figure(2); set(gcf,'name','Hedef fonksiyon ve uydurulmu� e�riler','numbertitle','off');
        while i <= 16
            
            if i==0 || i == 1 || i == 2 || i==3 || i==4 
                subplot(2,3,k); plot(x,tanh(x)./(1 + x.^2), x, g); title(i);
                k = k+1;
            end
            
            i = i + 1;
            
            
            Zstar =  Z2 + ((1/2)*h*(gValues(1) - gValues(2)))/(gValues(1)-2*gValues(2)+gValues(3)) ;   % uydurulan e�rinin maximum noktas�n�n apsisi

            Z2 = decide2MiddleValue(Z2, Zstar); % uydurulan do�runun maximum noktas�n�n ordinat� ile g(Z2) nin k�yaslanmas� ve yeni Z2 de�erinin belirlenmesi


            Z1 = Z2 - h; % yeni Z1 de�erinin atanmas�
            Z3 = Z2 + h; % yeni Z3 de�erinin atanmas� 

            gValues = calc_g_values(Z1, Z2, Z3);  %yeni Z de�erleri i�in g(Z) de�elerinin hesaplanmas�
            h = (Z3-Z1)/4;
            a = [];
            a = inv([ Z1^2, Z1, 1; Z2^2, Z2, 1; Z3^2, Z3, 1]) * gValues;
            g = a(1)*(x.^2) + a(2)*x + a(3);
        end
        subplot(2,3,k); plot(x,tanh(x)./(1 + x.^2), x, g); title(i-1)
    max = [Z1, gValues(2)];
end