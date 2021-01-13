function B = nonmaxima_suppression_box(A)
[max_val1, ind1] = max(A); %max_val v vsakem stolpcu
[max_val, ind] = max(max_val1);
[max_val, ind2] = max(A(:,ind));

%PROBLEM PRI TEJ FUNKCIJI JE, DA POGLEDA GLOBALNI MAXIMUM, zato moramo
%poiskati lokalne maximume....

loc=islocalmax(max_val1);
max_val1 = (loc).*max_val1;
max_val1= find(max_val1);
%loc=imregionalmax(A).*A% (max_val1);
%B = loc

%sedaj imamo local maximum
%potrebujemo narediti 8x8 box, kjer preveri local maximum

B = A;
for i = 1:size(max_val1,2)
    [max_val,y_ind] = max(B(:,max_val1(i))); %najde y indeks, kjer je max val
    for ii = 0:8
        if ii+max_val1(i)-4 > size(B,2)
            break
        end
        for j = 0:8
            if j+y_ind-4 > size(B,1)
                break
            end
            if B(max(1,y_ind-4+j),max(1,ii-4+max_val1(i))) < max_val
                B(max(1,y_ind-4+j),max(1,ii-4+max_val1(i))) = 0;
                %[ind-4+i,ind-4+j]

            end
        end
    end
end
%{
for ii = 1:size(A,2)%cez vse stolpce
    %max_val
    if any(B(:,ii) == any(max_val1(:)))
        for i = 0:8
            if i+ind1(ii) > size(B,1)
                break
            end
            for j = 0:8
                if j+ind > size(B,2)
                    break
                end
                if B(max(1,ind1(ii)-4+i),max(1,ii-4+j)) < max_val
                    B(max(1,ind1(ii)-4+i),max(1,ii-4+j)) = 0;
                    %[ind-4+i,ind-4+j]

                end
            end
        end
    end
end
%}

