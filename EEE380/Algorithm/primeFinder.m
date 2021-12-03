function [PrimesInterval,numberPrimes]=primeFinder(interval)
 sort(interval);
 interval1=primes(interval(1));
 interval2=primes(interval(2));
 numberPrimes=size(interval2,2)-size(interval1,2);
 PrimesInterval=interval2(size(interval1,2)+1:size(interval2,2));
end