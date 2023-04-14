function Hs = get_two_Hs(Hy, h, w)
vertex = [[w/2. , double(w) , w/2     , 0];
          [0.   , h/2.      , double(h), h/2.]
         ];
     
new_vertex(1,:) = vertex(1,:) - w/2;
new_vertex(2,:) = vertex(2,:) - h/2;

vertex_t = htx(Hy,new_vertex);

u = vertex_t(:,2) - vertex_t(:,4);
v = vertex_t(:,1) - vertex_t(:,3);

ux = u(1) ; uy = u(2) ; vx = v(1) ; vy = v(2);
sa = (h^2*uy^2 + w^2*vy^2)/(h*w*(uy*vx-ux*vy));
sb = (h^2*ux*uy+w^2*vx*vy)/(h*w*(ux*vy-uy*vx));
if (sa < 0)
    sa = -sa;
    sb = -sb;
end
Hs = [[sa,sb,0];
      [0 ,1 ,0];
      [0 ,0 ,1]];


end