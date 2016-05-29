val a = [1,2,3];
hd a;
tl a;
fun reverse (l,r) = (r,l);
fun zip l r = if null l orelse null r then [] else (hd l ,hd r) :: zip (tl l) (tl r);
zip [1,2,3];
