function c = KPColorMap(n)

c = jet(n); c = c(end:-1:1,:); c = c.^3;