function y = fun27(x)
    y=zeros(size(x));
    for i=1:5
        y= y+ i*cos(2*pi*i.*x)-exp(i)*sin(2*(pi*i+0.1).*x);
    end
    return
end

