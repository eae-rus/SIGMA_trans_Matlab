function [ sigma1,sigma2 ] = SIGMA_trans( a,b,s,B,H,pogresh )
%   Detailed explanation goes here
%# ���������� �����
D=length(B);

%# ������� � ������ � ���. ����������
for i=1:1:D
    F1(i)=B(i)*s;
    U1(i)=H(i)*(a+b);
    U2(i)=H(i)*(b);
end;

%# ������� �������� ������������
k=1;
%# ������ �������� ����� ��� ������� 1
usl=1;
i=1;j=2;
while usl
    
    usl_vn=1;
    while usl_vn
        naklon=(F1(j) - F1(i))/(U1(j) - U1(i));
        J0=F1(i)-U1(i)*naklon;
        %# �������� �������
        for z=i:1:j
            if abs(F1(z)-U1(z)*naklon-J0)/F1(z) > (pogresh/100)
                usl_vn=0;
            end
        end
        
        if j==D
            usl_vn=0;
        end
        if usl_vn==1
            j=j+1;
        end
    end
    
    if j<D    
    naklon=(F1(j-1) - F1(i))/(U1(j-1) - U1(i));
    J0=F1(i)-U1(i)*naklon;
    sigma(1,k)=F1(j-1);
    sigma(2,k)=U1(j-1);
    sigma(3,k)=naklon;
    sigma(4,k)=J0;
    end
    if j==D
    naklon=(F1(j) - F1(i))/(U1(j) - U1(i));
    J0=F1(i)-U1(i)*naklon;        
    sigma(1,k)=F1(j);
    sigma(2,k)=U1(j);
    sigma(3,k)=naklon;
    sigma(4,k)=J0;
    end
    
    i=j-1;
    k=k+1;
    if j==D
       usl=0;
    end
end
sigma1=sigma;



%# ������� �������� ������������
k=1;
%# ������ �������� ����� ��� ������� 2
usl=1;
i=1;j=2;
while usl
    
    usl_vn=1;
    while usl_vn
        naklon=(F1(j) - F1(i))/(U2(j) - U2(i));
        J0=F1(i)-U2(i)*naklon;
        %# �������� �������
        for z=i:1:j
            if abs(F1(z)-U2(z)*naklon-J0)/F1(z) > (pogresh/100)
                usl_vn=0;
            end
        end
        
        if j==D
            usl_vn=0;
        end
        if usl_vn==1
            j=j+1;
        end
    end
    
    if j<D    
    naklon=(F1(j-1) - F1(i))/(U2(j-1) - U2(i));
    J0=F1(i)-U2(i)*naklon;
    sigma(1,k)=F1(j-1);
    sigma(2,k)=U2(j-1);
    sigma(3,k)=naklon;
    sigma(4,k)=J0;
    end
    if j==D
    naklon=(F1(j) - F1(i))/(U2(j) - U2(i));
    J0=F1(i)-U2(i)*naklon;        
    sigma(1,k)=F1(j);
    sigma(2,k)=U2(j);
    sigma(3,k)=naklon;
    sigma(4,k)=J0;
    end
    
    i=j-1;
    k=k+1;
    if j==D
       usl=0;
    end
end
sigma2=sigma;

end

