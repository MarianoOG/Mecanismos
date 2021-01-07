function [ raiz, t ] = biseccion( min,max,tol,x,y )
%METODO DE BISECCION
format long
format compact
%y = - x^3 - 4*x^2 + 80*x - 40; %modificar para otras funciones

if ((subs(y,x,min)<0&&subs(y,x,max)>0)||(subs(y,x,min)>0&&subs(y,x,max)<0))
    a=[];
    b=[];
    p=[];
    e=[];
    
    if(subs(y,x,min)<0&&subs(y,x,max)>0)
        a(1)=min;
        b(1)=max;
    else
        a(1)=max;
        b(1)=min;
    end
    
    p(1)=(a(1)+b(1))/2;

    t=cell(1,8);
    t(1,:)={'n','a','b','f(a)','f(b)','Pn','f(Pn)','Error'};
    t(2,:)={1,a(1),b(1),subs(y,x,a(1)),subs(y,x,b(1)),p(1),subs(y,x,p(1)),'----------------------'};
    
    i=2;
    while(1)
        if(subs(y,x,p(i-1))<0)
            a(i)=p(i-1);
            b(i)=b(i-1);
        else
            a(i)=a(i-1);
            b(i)=p(i-1);    
        end
        
        p(i) = (a(i)+b(i))/2;
        e(i)=abs((p(i)-p(i-1))/p(i));
        
        t(i+1,:)={i,a(i),b(i),subs(y,x,a(i)),subs(y,x,b(i)),p(i),subs(y,x,p(i)),e(i)};
        
        if(e(i)<tol),break; end;
        i=i+1;
    end
    
    raiz=p(i);
    
else
    disp('No hay raices en el intervalo')
    raiz=[];
    t=[];
end

end