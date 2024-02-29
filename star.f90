implicit none ! GitHub FortranTip star.f90
character (len=20) :: s, nml_text
integer :: i(2), j, m(2), n
data m,n /3*5/
namelist /k/ m,n
s = "3*5"
read (s,*) i, j
nml_text = "&k m=2*7, n=7/"
print*,i,j ! 5 5 5
print*,m,n ! 5 5 5
read (nml_text,nml=k)
print*,m,n ! 7 7 7
end
