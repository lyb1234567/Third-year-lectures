function number=check_complex(input)
  if isreal(input) && input>0
      number=input;
  else
      number=0;
  end
end