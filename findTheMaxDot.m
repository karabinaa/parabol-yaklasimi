function max = findTheMaxDot(Z1,Z2,Z3)
   
    h = (Z3-Z1)/4;   % ön tanýmlý h ve e deðerleri
    
    
    x = linspace(0,2);
    
    f = tanh(x)/(1+x.^2);
        
    

    gValues = calc_g_values(Z1, Z2, Z3); % Z deðerleri için g(Z) deðerlerinin hesaplanmasý
    a = inv([ Z1^2, Z1, 1; Z2^2, Z2, 1; Z3^2, Z3, 1]) * gValues; % Z ve g(Z) deðerlerinin kullanýlarak a deðerlerinin hesaplanmasý 

    g = a(1)*(x.^2) + a(2)*x + a(3);
    
   
   
    
    Zstar = - a(2) / (2*a(1)); % uydurulan eðrinin maximum noktasýnýn apsisi

    Z2 = decide2MiddleValue(Z2, Zstar); % uydurulan doðrunun maximum noktasýnýn ordinatý ile g(Z2) nin kýyaslanmasý ve yeni Z2 deðerinin belirlenmesi
    Z1 = Z2 - h; % yeni Z1 deðerinin atanmasý
    Z3 = Z2 + h; % yeni Z3 deðerinin atanmasý 

    gValues = calc_g_values(Z1, Z2, Z3);  %yeni Z deðerleri için g(Z) deðelerinin hesaplanmasý
        
   
        i = 0;
        
        k = 1;
        
        figure(2); set(gcf,'name','Hedef fonksiyon ve uydurulmuþ eðriler','numbertitle','off');
        while i <= 16
            
            if i==0 || i == 1 || i == 2 || i==3 || i==4 
                subplot(2,3,k); plot(x,tanh(x)./(1 + x.^2), x, g); title(i);
                k = k+1;
            end
            
            i = i + 1;
            
            
            Zstar =  Z2 + ((1/2)*h*(gValues(1) - gValues(2)))/(gValues(1)-2*gValues(2)+gValues(3)) ;   % uydurulan eðrinin maximum noktasýnýn apsisi

            Z2 = decide2MiddleValue(Z2, Zstar); % uydurulan doðrunun maximum noktasýnýn ordinatý ile g(Z2) nin kýyaslanmasý ve yeni Z2 deðerinin belirlenmesi


            Z1 = Z2 - h; % yeni Z1 deðerinin atanmasý
            Z3 = Z2 + h; % yeni Z3 deðerinin atanmasý 

            gValues = calc_g_values(Z1, Z2, Z3);  %yeni Z deðerleri için g(Z) deðelerinin hesaplanmasý
            h = (Z3-Z1)/4;
            a = [];
            a = inv([ Z1^2, Z1, 1; Z2^2, Z2, 1; Z3^2, Z3, 1]) * gValues;
            g = a(1)*(x.^2) + a(2)*x + a(3);
        end
        subplot(2,3,k); plot(x,tanh(x)./(1 + x.^2), x, g); title(i-1)
    max = [Z1, gValues(2)];
end